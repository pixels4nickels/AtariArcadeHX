package gamelibs;

@:native("GameLibs.StringUtils")
extern class StringUtils {
	/**
	* The StringUtils class provides common string formatting methods
	* used throughout.
	* @class StringUtils
	*/

	/**
	* Supplant a number of key-value pairs into a string. This enables
	* template-like formatting using {KEY_NAME} string injection.
	* @method supplant
	* @param {String} str The core string that contains {KEYS} to be replaced.
	* @param {Object} params The replacement object, which contains <pre>{KEYS:"Value"}</pre> properties.
	* @return {String} A string with all replaced string values. Note that values defined in the source string
	* that are not found in the replacement object will remain with {CURLY_BRACES}.
	* @static
	*/
	public static function supplant (str:String, params:Dynamic):String

	public static function formatScore (score:Int, str:String):String;

	public static function padLeft (str:String, length:Int, character:String):String;

	public static function padRight (str:String, length:Int, character:String):String;

}