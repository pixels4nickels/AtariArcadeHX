package gamelibs.multiplayer;

import gamelibs.input.GamePad;

@:native("GameLibs.Player")
extern class Player {
	/**
	 * A player in a game. This will help determine who you are playing with
	 * @class Player
	 * @param {String} name The player's name
	 * @param {String} id The player's unique ID.
	 * @constructor
	 */

	/** If either id or name is not passed, Player will use one for both */
	public function new (name:Dynamic, id:Dynamic):Void;
	public function initialize (name:Dynamic, id:Dynamic):Void;

	public static var DEVELOPER_AVATARS:Array <String>;
	public static var DEFAULT_AVATAR:String;

	/**
	* The player's name.
	* @property name
	* @type String
	*/
	public var name:String;

	/**
	 * The player's unique ID.
	 * @property id
	 * @type String
	 */
	public var id:String;

	/**
	 * This player is a clientHost
	 */
	public var isHost:Bool;

	/**
	 * If the player is your player.
	 * @property isMe
	 * @type Boolean
	 */
	public var isMe:Bool;

	/**
	 * If the player is currently AI controlled
	 */
	public var isComputer:Bool;

	/**
	 * If the player is your Facebook friend.
	 * @property isFriend
	 * @type Boolean
	 */
	public var isFriend:Bool;

	/**
	 * Reference to the player's input gamepad.
	 * @property gamePad
	 * @type GamePad
	 */
	public var gamePad:GamePad;

	/**
	 * A url to the player's avatar. This will be hosted on Atari, or pulled from Facebook.
	 * @property avatar
	 * @type String
	 */
	public var avatar:String;

	/**
	 * Return an avatar for the player. If no avatar is found, a default one will be returned.
	 * @method getAvatar
	 * @return {String}
	 */
	public function getAvatar ():String;

	public function toString ():String;
}