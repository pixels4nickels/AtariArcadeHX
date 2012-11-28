package gamelibs;

@:native ("GameLibs.PerformanceMonitor")
extern class PerformanceMonitor {

	/**
	 * A component which monitors the performance of the game, and toggles low quality
	 * mode if the
	 * @class PerformanceMonitor
	 * @param {Function} callback A function to fire when the performance is deemed to be unacceptable.
	 * @param {Number} threshold The amount of time in milliseconds that the game is allowed to have poor FPS
	 *      before it toggles low quality.
	 * @constructor
	 */
	public function new (callback:Dynamic, minFPS:Float, threshold:Float):Void;
	public function initialize (callback:Dynamic, minFPS:Float, threshold:Float):Void;

	public static var DEFAULT_THRESHOLD:Float;

	public static var maxMs:Float;

	/**
	 * The minimum FPS allowed.
	 * @property minFPS
	 * @type Number
	 * @default 30
	 */
	public static var minFPS:Float;

	/**
	 * The number of milliseconds that can pass before the low quality mode is toggled.
	 * @property threshold
	 * @type Number
	 * @default 3000
	 */
	public static var threshold:Float;

	/**
	 * The method to call when the game enters low quality mode. It is recommended to use a proxy
	 * method to maintain scope. The callback takes a single argument, which indicates if the game
	 * is in low quality mode.
	 * @property callback
	 * @type Function
	 */
	public var callback:Dynamic;

	/**
	 * If the game is currently in low quality mode.
	 * @property lowQualityMode
	 * @type Boolean
	 * @default false
	 */
	public static var lowQualityMode:Bool;

	/**
	 * The amount of time that has elapsed since the framerate has been acceptable.
	 * @property timeOnLow
	 * @type Number
	 * @default 0
	 */
	public static var timeOnLow:Float;


	/**
	 * Reset the PerformanceMonitor. This happens whenever a game is restarted or continued.
	 * Note: Currently NOT implemented in any games.
	 * @method reset
	 */
	public function reset ():Void;

	public function tick ():Void;

}