package gamelibs.multiplayer;

@:native ("GameLibs.GameInfo")
extern class GameInfo {

	public var gameId:String;
	public var gameModes:Array <Dynamic>;
	public var height:Float;
	public var isIOS:Bool;
	public var mode:String;
	public var platform:Float;
	public var players:Array <Dynamic>;
	public var quality:Float;
	public var roomName:String;
	public var scaleFactor:Float;
	public var selectedMode:Float;
	public var touchEnabled:Bool;
	public var width:Float;

	/**
	 * The game mode for a single player game
	 * @property SINGLE_PLAYER
	 * @type {String}
	 * @default singlePlayer
	 * @static
	 */
	public static var SINGLE_PLAYER:String;

	/**
	 * The game mode for a multi-player game, usually initiated with a random match-up.
	 * @property MULTI_PLAYER
	 * @type {String}
	 * @default multiPlayer
	 * @static
	 */
	public static var MULTI_PLAYER:String;


	// Platform ENUMs
	public static var PLATFORM_DESKTOP:String;
	public static var PLATFORM_WP7:String;
	public static var PLATFORM_WP8:String;
	public static var PLATFORM_IPHONE:String;
	public static var PLATFORM_IPHONE3:String;
	public static var PLATFORM_IPHONE_PINNED:String;
	public static var PLATFORM_IPHONE3_PINNED:String;

	public static var QUALITY_NORMAL:Int;
	public static var QUALITY_HIGH:Int;
	public static var QUALITY_LOW:Int;


	public function getMyPlayer ():Void;
	public function getSelectedGameMode ():String;
	public function isMultiPlayer ():Bool;
	public function new ():Void;
	public function setSelectedGameMode (index:Float):Void;
	public function initialize(gameId:String, mode:String, roomName:String, players:Array <Dynamic>, multiPlayerGame:Bool, gameModes:Array <Dynamic>, platform:Float, width:Float, height:Float):Void;
}