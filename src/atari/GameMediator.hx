package atari;

import easeljs.display.Stage;
import gamelibs.multiplayer.MultiPlayerGame;
@:native ("GameMediator")
extern class GameMediator {

	/**
	 * The GameMediator is the official communication layer for events between the Game Shell
	 * in the parent window, and the game instance running in the IFRAME. The game instance
	 * will receive a reference to the active GameMediator instance when initialized, and can
	 * call methods, which will be properly handled by the game framework. The Game Framework
	 * can also make calls that will be properly passed onto the game instance. Note that all
	 * calls on the game instance are wrapped in try/catch to avoid showing errors to the user
	 * and relevant methods are surfaced as system dialogs.
	 * @class GameMediator
	 * @constructor
	 */
	public function new ():Void;

	/**
	* Register the shell with the GameMediator.
	* @method registerShell
	* @param {Class} shell The game shell class (not instance). Game Shell has a static API.
	* @protected
	*/
	public function initializeGame(shell:Class, mpg:MultiPlayerGame):Void;


	// Shell Events
	public static var LEVEL_COMPLETE:String;
	public static var LIFE_LOST:String;
	public static var GAME_OVER:String;
	public static var GAME_COMPLETE:String;
	public static var GAME_ERROR:String;
	public static var GAME_NOTIFICATION:String;
	public static var GAME_ACHIEVEMENT:String;

	// Private shell events
	public static var START_DRAG:String;
	public static var STOP_DRAG:String;

	// Game Commands
	public static var START_GAME:String;
	public static var PAUSE_GAME:String;
	public static var GET_SCORE:String;
	public static var CONTINUE_GAME:String;
	public static var RESTART_GAME:String;
	public static var DESTROY_GAME:String;
	public static var REDUCE_FRAMERATE:String;
	public static var REMOVE_PLAYER:String;

	/**
	 * Defines the constant for a notify-level error, which can usually be ignored.
	 * @property ERROR_NOTIFY
	 * @type {String}
	 * @default errorNotify
	 */
	public static var ERROR_NOTIFY:String;

	/**
	 * Defines the constant for a warning-level error, which should probably be logged or displayed.
	 * @property ERROR_WARNING
	 * @type {String}
	 * @default errorWarning
	 */
	public static var ERROR_WARNING:String;

	/**
	 * Defines the constant for a critical-level error, which means the game can not recover. An error should
	 * be displayed
	 * @property ERROR_CRITICAL
	 * @type {String}
	 * @default errorCritical
	 */
	public static var ERROR_CRITICAL:String;

	public static var callbacks:Array;


	/**
	* A reference to the Game Shell.
	* @property shell
	* @type {Class}
	* @protected
	*/
	public var shell:Class;

	/**
	 * A reference to the game instance.
	 * @property gameInstance
	 * @type {Object}
	 * @protected
	 */
	public var gameInstance:Dynamic;

	/**
	 * A reference to the current multi-player game controller.
	 * @property multiPlayerGame
	 * @type MultiPlayerGame
	 * @protected
	 */
	public var multiPlayerGame:MultiPlayerGame;

	/**
	 * A reference to the EaselJS stage used for the game. This is set by the GameBootStrap when the
	 * game instance is registered.
	 * @property stage
	 * @type Stage
	 */
	public var stage:Stage;

	/**
	 * If the game is currently paused.
	 * @property isPaused
	 * @type Boolean
	 */
	public var isPaused:Bool;

	/**
	 * The last time tick was called.
	 * @property lastTick
	 * @type Number
	 * @protected
	 */
	public var lastTick:Float;

	public var tickThreshold:Float; // Cheat threshold. Undocumented.

	public var poorFPSLog:Float;

	/**
	 * The target FPS, defaults to 30, but can be overridden by the game manifest.
	 * @property targetFPS
	 * @type Number
	 * @default 30
	 */
	public var targetFPS:Float;

	/**
	 * The target time between frames in milliseconds, which is 1000 divided by the current
	 * FPS.
	 * @property targetMS
	 * @type Number
	 * @default 33.3
	 */
	public var targetMS:Float;

	/**
	 * A reference to the current assets object.
	 * @property currentAssets
	 * @type Object
	 * @protected
	 */
	public var currentAssets:Dynamic;

	// Callbacks
	/**
	 * The game has dispatched an event (callback) that needs to be bubbled up to the site/framework.
	 * @event onGameEvent
	 * @param {String} method The name of the event/method the game has called.
	 * @param {Array} args A list of arguments.
	 */
	public function onGameEvent():Dynamic;

	/**
	 * This callback is fired when the game is ready to be played. This gives the site/framework
	 * a chance to show dialogs/options, or to play pre-roll ads.
	 * @event onGameReady
	 */
	public function onGameReady():Dynamic;

	/**
	 * This callback is fired as a game preloads. This gives the site/framework a chance to
	 * display loading progress to the user.
	 * @event onGameProgress
	 * @param {Object} event a PreloadJS progress event.
	 */
	public function GameProgress():Dynamic;


	/**
	* The game has completed, so clean up the mediator references. New mediators are created
	* for each game, however it helps to clean up after ourselves.
	* @method cleanUp
	*/
	public function cleanUp ():Void;

	/**
	* Framework commands are marshaled through the command method, and then called on the game instance
	* methods.
	* @method command
	* @param {String} commandName The command name.  All command names are statically defined as properties
	* of the GameMediator class. This is all handled internally so the values are not important to developers.
	* @param {Object} args An object with named parameters to be passed into the game.
	* @return {*} Some methods have a custom return value (such as <b>getScore</b>). Any methods that do not exist
	* will return <b>false</b>. Otherwise, <b>true</b> is returned.
	* @protected
	*/
	public function command (commandName:String, args:Dynamic):*;


	/**
	* The game has called one of the injected callbacks to communicate with the game framework.
	* See the Game class to determine the correct parameters for each callback.
	* @method handleGameEvent
	* @param {String} method The method constant to call.
	* @param {Array} args The arguments called from the game.
	* @protected
	*/
	public function handleGameEvent (method:String, args:Array <Dynamic>):Void;

	/**
	 * Pause is handled internally, and simply flags the game as paused so the game instance
	 * no longer receives tick calls.
	 * @method handlePause
	 * @param {Boolean} paused Whether the game should be paused or not.
	 * @protected
	 */
	public function handlePause (paused:Bool):Void;

	/**
	* The GameBootstrap is preloading a game instance, and the progress has changed.
	* @method handlePreloadProgress
	* @param {Object} event The event object generated by PreloadJS.
	* @protected
	*/
	public function handleGameProgress (event:Dynamic):Void;

	/**
	* Log an error silently.
	* @method logError
	* @param {Error} error The error caught by the framework.
	* @param {String} message A verbose message for the logs.
	*/
	public function logError (error:Error, message:String):Void;

	/**
	* Register the game instance with the GameMediator. This ensures that all the game has all the
	* required methods and event handlers defined, and adds handlers for events. Note that the
	* events are not <i>required</i> on the games, but code hinting will work properly when
	* there are placeholder methods, and it implies the methods are being called.
	* @method registerGameInstance
	* @param {Object} gameInstance The game instance getting registered.
	* @protected
	*/
	public function registerGameInstance (gameInstance:Dynamic):Void;


	/**
	* Mute the game. Note that the game frame has a separate instance of SoundJS
	* running, which manages all the game sounds.
	* @method setMute
	* @param {Boolean} muted If the framework should be muted or not.
	*/
	public function setMute (muted:Bool):Void;

	/**
	* Display an error to the player.
	* @method showError
	* @param {Error} error The error caught by the framework.
	* @param {String} message A verbose message for the player.
	* @protected
	*/
	public function showError (error:Error, message:String):Void;

	/**
	* Start the game. This sets up the tick, and calls startGame on the game instance.
	* @method startGame
	*/
	public function startGame ():Void;

	/**
	* Tick the game. Each game frame is managed from the GameMediator, ensuring that the
	* order of operations in multiplayer games is respected, and the stage update happens
	* at the right time. The should make it easier for developers making multi-player
	* games.
	* @method tick
	* @protected
	*/
	public function tick ():Void;

	public function checkFPS():Void;

	public function handleRelayedInput(type:String, event:Dynamic, data:Dynamic):Void;

	public function toString():String;

}