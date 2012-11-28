package gamelibs.multiplayer;

@:native("GameLibs.MultiPlayerGame")
extern class MultiPlayerGame {

	/**
	 * The MultiPlayerGame class manages the relationship between the socket server and the game. It
	 * connects to the server, and receives incoming packets, which are parsed and stored for retrieval
	 * by the GameMediator at the appropriate time. There is also a simple API to dispatch frame packets
	 * from the player, which the GameMediator also manages.
	 * @class MultiPlayerGame
	 * @param {GameInfo} gameInfo The game information object.
	 * @constructor
	 */
	public function new (gameInfo:GameInfo):Void;
	public function initialize(gameInfo:GameInfo):Void;

	public static var SOCKET_URL:String;


	/**
	* A reference to the current GameInfo, which holds the active players, and other info
	* about the current game.
	* @property gameInfo
	* @type GameInfo
	* @protected
	*/
	public var gameInfo:GameInfo;

	/**
	 * The socket connection.
	 * @property socket
	 * @type Object
	 * @protected
	 */
	public var socket:Dynamic;

	/**
	 * This client's unique nickname, used to determine which packets belong to this client.
	 */
	public var clientId:Dynamic;

	/**
	 * Is this client the host of the game
	 */
	public var isHost:Bool;

	// Interval
	public var countDown:Int;

	// Amount of time remaining
	public var secondsLeft:Int;

	/**
	 * A list (or hash) of current packets since the last tick. This is collected, and then
	 * pulled out by the GameMediator when the game is ready to apply them.
	 * @property currentPackets
	 * @type Array
	 * @protected
	 */
public var currentPackets:Array <Dynamic>;

	/**
	 * A game sync packet received by the server. This is collected, and then
	 * pulled out by the GameMediator when the game is ready to apply it.
	 * @property lastSync
	 * @type GamePacket
	 * @protected
	 */
	public var lastSync:GamePacket;

	// Callbacks
	/**
	 * The callback that is fired when the game counts down while waiting for players to connect.
	 * @event onCountDown
	 * @param {Number} seconds The number of seconds remaining.
	 */
	public var onCountDown:Dynamic;
	/**
	 * The callback that is fired when the game is ready to play.
	 * @event onGameReady
	 */
	public var onGameReady:Dynamic;
	/**
	 * The callback that is fired when we've connected to the server.
	 * @event onConnectionSuccess
	 */
	public var onConnectionSuccess:Dynamic;
	/**
	 * Called when the socket server is unavailable.
	 *
	 */
	public var onConnectionError:Dynamic;

	/**
	 * Called when the socket server returns an error, like room is full, or game not found.
	 */
	public var onSocketError:Dynamic;

	/**
	 * The callback that is fired the game has timed out, due to not enough players being in the game.
	 * @event onGameTimeout
	 */
	public var onGameTimeout:Dynamic;
	/**
	 * The callback that is fired when players have been added or removed from the game.
	 * @event onPlayersChanged
	 */
	public var onPlayersChanged:Dynamic;
	/**
	 * The callback that is fired when the game has been canceled. This happens when a game
	 * has already begun, and too many players leave.
	 * @event onGameCanceled
	 */
	public var onGameCanceled:Dynamic;

	// Placeholder for ticking.
	private function tick():Void;

	private function cleanupSocket() :Void;



	/*************************************************
	 * PUBLIC METHODS
	 **************************************************/

	/**
	 * Join a new game
	 * @param packet
	 */
	public function joinGame (packet:Dynamic):Void;

	/**
	 * Send the entire game state to the other players. Only host games will provide synchronization
	 * packets, and it should only be sent every so often.
	 * @method sendGameState
	 * @param {GamePacket} packet The game state object.
	 */
	public function sendGameState (packet:GamePacket):Void;

	/**
	 * Send a frame packet to the other players.
	 * This is called by by the mediator whenever the game has an available packet.
	 * This can happen as often as every tick, but an effort should be made to keep this to less than 10/second.
	 * @method sendPacket
	 * @param {FramePacket} packet The frame packet to send.
	 */
	public function sendPacket (packet:FramePacket):Void;

	/**
	 * Get the current frame packets for all other players since last tick. Once it is retrieved
	 * it will be cleared for the next tick.
	 * @method getPackets
	 * @return {Array} packets A list of the other player's FramePackets received since last tick.
	 */
	public function getPackets (packets:Dynamic):Array <Dynamic>;

	/**
	 * Get the last sync packet sent by the game host. If it is empty, it will be ignored. Once it is retrieved
	 * it will be cleared for the next tick.
	 * @method getLastSync
	 * @return {GamePacket} The last game packet from the host.
	 */
	public function getLastSync ():GamePacket;

	public function destroy():Void;



	/*************************************************
	 * SOCKET / EVENT HANDLERS
	 **************************************************/

	// Socket Methods.
	/**
	 * The socket has connected.
	 * @method handleConnect
	 * @param {Object} data Socket data
	 * @protected
	 */
	public function handleConnect (data:Dynamic):Void;

	/**
	 * The socket has started the countdown.
	 * @method handleCountDown
	 * @param {Object} data Socket data
	 * @protected
	 */
	public function handleCountDown (data:Dynamic):Void;

	/**
	 * The game is ready to start.
	 * @param {Object} data Socket data
	 * @protected
	 */
	public function handleGameReady (data:Dynamic):Void;

	/**
	 * This client has successfully joined a room.
	 * @param {Object} data A list of all players currently in the room, with you at the end.
	 * @protected
	 */
	public function handleJoinSuccess (data:Dynamic):Void;

	/**
	 * The server has selected this client to be the host.
	 * @param data
	 */
	public function handleBecomeHost (data:Dynamic):Void;

	/**
	 * Another client has joined the room we're already in. We will not receive this for ourselves.
	 * @param data
	 */
	public function handleNewPlayer (data:Dynamic):Void;

	/**
	 * Client has left
	 * @param data data.nickname
	 */
	public function handlePlayerLeave (data:Dynamic):Void;

	/**
	 * The game has been canceled. This happens when a game has already started, but enough players
	 * leave that the game can not continue.
	 * @method handleGameCanceled
	 * @protected
	 */
	public function handleGameCanceled ():Void;

	/**
	 * A frame packet was received from the socket server. It gets stored for retrieval. This ensures
	 * that the game can get all the packets at once each tick.
	 * @method handlePacket
	 * @param {Object} data The raw data from the socket.
	 * @protected
	 */
	public function handlePacket (data:Dynamic):Void;

	/**
	* A game packet was received from the socket server. It gets stored for retrieval. This ensures
	* that the game can get the sync when it needs it.
	* @method handleSync
	* @param {Object} data The raw data from the socket.
	* @protected
	*/
	public function handleSync (data:Dynamic):Void;


	/**
	 * @param data
	 */
	public function handleError (data:Dynamic):Void;

	public function toString ():String;


}