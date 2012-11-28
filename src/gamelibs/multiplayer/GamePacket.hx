package gamelibs.multiplayer;

@:native("GameLibs.GamePacket")
extern class GamePacket {

	/**
	 * The GamePacket represents a full synchronization of the current game,
	 * which is periodically passed by host game instances to all other players
	 * to ensure everyone is playing the same game.
	 * @class GamePacket
	 * @constructor
	 */
	public function new (events:Array <Dynamic>, gameState:Dynamic, playersState:Array <Dynamic>):Void;
	public function initialize (events:Array <Dynamic>, gameState:Dynamic, playersState:Array <Dynamic>):Void;

	public var details:Array <Dynamic>;
	public var game:Dynamic;
	public var players:Array <Dynamic>;


	/**
	 * An list of all the events in this sync packet
	 * @property details
	 * @type Array
	 */
	public var events:Array <Dynamic>;

	/**
	 * A description of the current game state other than player info. This might include a list
	 * of all asteroids, missiles, bricks, etc. The game must be able to interpret the information
	 * that is sends.
	 * @property game
	 * @type Object
	 */
	public var gameState:Dynamic;

	/**
	 * A description of all players current state. This might include position, player projectiles,
	 * rotation, etc. The game must be able to interpret the information that it sends.
	 * @property players
	 * @type Array
	 */
	public var playersState:Array <Dynamic>;


	/**
	 * Convert the packet information into a raw object to be sent over the socket.
	 * @method serialize
	 * @return {Object} The raw data.
	 */
	public function serialize ():Dynamic;

	/**
	 * Convert the socket data into properties on the GamePacket.
	 * @method deserialize
	 * @param {Object} data The data from the socket.
	 */
	public function deserialize(data:Dynamic):Void;

	public function toString():String;

}