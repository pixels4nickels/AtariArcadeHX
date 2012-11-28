package atari;

@:native ("Atari")
extern class Atari {

	/**
	 * The Atari Object stores all the library classes.
	 * For example, to access the Common.proxy method, use:
	 * <pre>Atari.Common.proxy(method, scope);</pre>
	 * <br/><br/>
	 * The window.Atari package is passed into libraries as the "scope"
	 * @class Atari
	 */


	/**
	 * Holds a reference to the current game namespace. This includes all the classes and code
	 * that will used for the active game. Once the game is over, the entire namespace is wiped
	 * out.
	 * <br/><br/>
	 * The window.Atari.currentGame property is passed in to the game classes as the "scope".
	 * @property currentGame
	 * @type Object
	 * @static
	 */
	public static var currentGame:Dynamic;

	/**
	 * Set the game framework into developer mode. This provides better errors in the console, as
	 * well as displaying log messages left in the source code.
	 * @property developerMode
	 * @type {Boolean}
	 * @default false
	 */
	public static var developerMode:Bool;

	/**
	 * Output to the console during development. This method is IE-safe, so it can be used
	 * and left in after deployment without risk of crashes.  The arguments are send to console.log,
	 * they are in a try/catch statment to prevent errors.
	 *
	 * @method trace
	 * @param Arguments arguments All arguments are displayed as a space-separated string.
	 * @static
	 */
	public static function trace (Arguments:Dynamic):Void;

	/**
	 * JavaScript does not provide method closure, so a proxy function can be used
	 * to maintain method scope. Any parameters called on the resulting function will be passed
	 * into the callback.
	 * @param {Function} method The method to call
	 * @param {Object} scope The object to call the method on
	 * @return {Function} A delegate (proxy) function that will maintain the proper scope when it is called.
	 * @static
	 */
	public static function proxy(method:Dynamic, scope:Dynamic):Dynamic;

	/**
	 * Parse a JSON string into an object.
	 * @param {String} str The raw JSON-formatted string.
	 * @return {Object} The JavaScript-formatted object.
	 * @static
	 */
	public static function parseJSON(str:String):Dynamic;

}