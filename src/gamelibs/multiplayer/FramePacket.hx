package gamelibs.multiplayer;

@:native("GameLibs.FramePacket")
extern class FramePacket {
	/**
	 * Frame Packets represent actions and data for a single player, which is
	 * passed over the socket each tick. This likely contains things like player position,
	 * projectiles, etc. Also included is player events, which are one-time actions
	 * such as firing a projectile, losing a life, etc.
	 * @class FramePacket
	 * @constructor
	 */
	public function new (data:Dynamic):Void;



	/**
	* The frame state. This is an object containing all the packet data about the
	* frame. This should be customized by the game. Each game will have to be able
	* to read the information that it provides.
	* @property state
	* @type Object
	*/
	public var state:Dynamic;

	/**
	 * If this is enabled, the player will receive his own packet back from the server.
	 * Otherwise everyone BUT the sender will receive it.
	 * @property state
	 * @type Object
	 */
	public var returnToSender:Bool;

	/**
	 * The clientId for this packet. MultiPlayerGame will inject this into any packets it sends out.
	 */
	public var clientId:Dynamic;

	/**
	 * Any events that take place in the frame, such as firing a projectile, losing a
	 * life, etc. This should be customized by the game. Each game will have to be able
	 * to read the information that it provides.
	 * @property events
	 * @type Object
	 * @default null
	 */
	public var events:Dynamic;

	public function initialize(events:Array<Dynamic>, state:String):Void;

	/**
	 * Convert the properties of the packet into a raw object for serialization by
	 * the server.
	 * @return {Object} The frame data.
	 */
	public function serialize():Dynamic;

	/**
	 * Read the socket data into the properties of the FramePacket. This can be used in
	 * place of the constructor in case the packet is re-used.
	 * @param {Object} data The socket data/
	 */
	public function deserialize(data:Dynamic):Void;

	public function toString():String;


}