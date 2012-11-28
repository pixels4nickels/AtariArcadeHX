package gamelibs.input;

import easeljs.geom.Point;
import gamelibs.multiplayer.GameInfo;
@:native ("GamePad")
extern class GamePad {


	/**
	 * A reference to the <i>current</i> player's GamePad. This is the interface all games
	 * should use for the local player input. Note that multiplayer input comes instead from
	 * the GameInfo (player info) and MultiPlayer API updatePlayers, which is called on
	 * each game every tick (or so).
	 * @property player
	 * @type {GamePad}
	 * @default null
	 */
	public static var player:GamePad;

	/**
	 * A list of the <i>other</i> players in the game. This list does <b>not</b> include
	 * the current player.
	 * @property players
	 * @type {Array}
	 * @default []
	 */
	public static var players:Array <Dynamic>;

	public static var target:Point;


	/**
	 * Represents an upwards movement, which can also be an UP ARROW or W key
	 * @property DOWN
	 * @type {String}
	 * @default up
	 * @static
	 */
	public static var UP:String;

	/**
	 * Represents a downwards movement, which can also be a DOWN ARROW or S key
	 * @property DOWN
	 * @type {String}
	 * @default down
	 * @static
	 */
	public static var DOWN:String;

	/**
	 * Represents a left movement, which can also be a LEFT ARROW or A key
	 * @property UP
	 * @type {String}
	 * @default left
	 * @static
	 */
	public static var LEFT:String;


	/**
	 * Represents a right movement, which can also be a RIGHT ARROW or D key
	 * @property RIGHT
	 * @type {String}
	 * @default right
	 * @static
	 */
	public static var RIGHT:String;

	/**
	 * Represents a primary action, which can also be the SPACE key
	 * @property BUTTON_1
	 * @type {String}
	 * @default button1
	 * @static
	 */
	public static var BUTTON_1:String;

	/**
	 * Represents a secondary action.
	 * @property BUTTON_2
	 * @type {String}
	 * @default button2
	 * @static
	 */
	public static var BUTTON_2:String;

	/**
	 * Represents a tertiary action.
	 * @property BUTTON_3
	 * @type {String}
	 * @default button3
	 * @static
	 */
	public static var BUTTON_3:String;

	/**
	 * Represents a 4th action.
	 * @property BUTTON_4
	 * @type {String}
	 * @default button4
	 * @static
	 */
	public static var BUTTON_4:String;

	/**
	 * Static initialization happens automatically after everything has been defined.
	 * @method initialize
	 * @static
	 * @protected
	 */
	public function initialize(gameInfo:GameInfo):Void;

	public function new (gameInfo:GameInfo);


	public var KeyCodes:Dynamic;


	/**
	 * Callback to be fired when a key is pressed
	 * @event onButtonDown
	 */
	public var onButtonDown:Dynamic;

	/**
	 * Callback to be fired when a key is released
	 * @event onButtonUp
	 */
	public var onButtonUp:Dynamic;

	/**
	 * Callback to be fired when a button is manually tapped.
	 * This is nice for single events that do not actually store
	 * the button state.
	 * @event onTap
	 */
	public var onTap:Dynamic;

	/**
	 * Games may implement an easter egg, which is activated using the
	 * konami code UP, UP, DOWN, DOWN, LEFT, RIGHT, LEFT, RIGHT, B, A.
	 * Simply subscribe to this callback, and then make appropriate
	 * game changes
	 * @event onKonamiCode
	 */
	public var onKonamiCode:Dynamic;

	/**
	 * Where the use is currently targeting using mouse & touch gestures.
	 * The games should ignore NULL targets, as it indicates that either
	 * no target is set, or the user is using other input methods, such
	 * as the keyboard.
	 * @property target
	 * @type Point
	 * @default null
	 */
	public var target:Point;

	/**
	 * The current touch angle. If this is null, the user is not interacting with
	 * the touch controls.
	 * @property angle
	 * @type Number
	 * @default null
	 * @protected
	 */
	public var angle:Float;

	/**
	 * The last key pressed.
	 * @property lastPressed
	 * @type {Number}
	 */
	public var lastPressed:Float; //TODO: Is this implemented?

	/**
	 * The current key map that maps code values to constant key values, such as
	 * directional arrows and action buttons.
	 * @property keyMap
	 * @type Object
	 * @protected
	 */
	public var keyMap:Dynamic;

	/**
	 * The hash of currently pressed buttons, indexed by key code or constant.
	 * @property downButtons
	 * @type Object
	 * @protected
	 */
	public var downButtons:Array <Dynamic>;

	/**
	 * Initialization sets the default key mapping, and initializes other values.
	 * @method initialize
	 * @protected
	 */
	public function initialize():Void;

	/**
	 * Set the current position of the "cursor".
	 * @method setPosition
	 * @param {Number} x The x-axis position.
	 * @param {Number} y The y-axis position.
	 */
	public function setPosition(x:Int, y:Int):Void;

	/**
	 * Bet the current position of the cursor.
	 * @method getPosition
	 * @return {Point} The current position. If it is null, then it has not been set, or the
	 * user is interacting using another method.
	 */
	public function getPosition():Point;

	/**
	 * Get the current angle that the player is indicating. If the player is using keys,
	 * then the angle will be one of 8 45-degree angles (counter-clockwise from left:
	 * 180, 135, 90, 45, 0, -45, -90, -135). If the player is using a touch control,
	 * the angle will be any degree between -179 and 180 (same rules as above). If there is no keys
	 * or touch input, the angle will be 0.
	 * @method getAngle
	 * @param {Boolean} degrees If the angle is to be returned in degress (true) or radians (false).
	 * @return {Number} The angle.
	 */
	public function getAngle (degrees:Bool):Float;

	/**
	 * Set the current angle. Touch controls can use this API to control the game pad.
	 * @method setAngle
	 * @protected
	 */
	public function setAngle(angle:Float):Void;

	/**
	 * Trigger a stage tap (mousedown, then mouseup) event manually.
	 * @method triggerTap
	 * @param {Number} x The x-axis coordinate of the tap.
	 * @param {Number} y The y-axis coordinate of the tap.
	 */
	public function triggerTap(x:Float, y:Float):Void;

	/**
	 * Trigger a button press manually (press, then release) - an action likely to be used by
	 * arcade button components.
	 * @method triggerButton
	 * @param {Number} code The keycode to trigger.
	 */
	public function triggerButton(code:Float):Void;

	/**
	 * Determine if a button is currently pressed.
	 * @method isButtonDown
	 * @param {String|Number} code The button code or constant.
	 * @return {Boolean} If the button is pressed (true) or not (false).
	 */
	public function isButtonDown(code):Bool;

	/**
	 * Determine if all of the specified buttons are pressed. If any of the provided
	 * button codes are not pressed, then false is returned.
	 * @method isAllButtonsDown
	 * @return {Boolean} If all of the buttons are pressed (true) or not (false).
	 */
	public function isButtonDown(code:String|Number):Bool;

	public function isAllButtonsDown():Bool;

	/**
	 * Determine if any of the specified buttons are pressed. If any of the provided
	 * button codes are pressed, then true is returned.
	 * @method isAnyButtonsDown
	 * @return {Boolean} If any of the buttons are pressed (true). If all buttons are released,
	 * then false is returned.
	 */
	public function isAnyButtonsDown():Bool;

	/**
	 * Return a list of codes/constants that are pressed.
	 * @method getDownButtons
	 * @return {Array} A list of the codes/constants that are pressed.
	 */
	public function getDownButtons():Array <Dynamic>;

	/**
	 * Define keyBoard mappings for the GamePad. The mappings help determine which keyboard
	 * keys or string values map to directional and access keys, making it possible to have
	 * scenarios where both arrow keys and WASD keys handle direction, or mapping letters
	 * or arcade buttons to button constants.
	 * @method setKeyMap
	 * @param {Object} newKeys The key map object
	 * @param {Boolean} clearExisting If the new keymap should override (false) or append (true) to the
	 * current key map. The default value is <b>false</b>.
	 */
	public function setKeyMap(newKeys:Dynamic, clearExisting:Bool):Void;

	/**
	 * Manually set a button down. If the button is not down already, the onButtonDown() callback
	 * is fired.
	 * @method setButtonDown
	 * @param {Number|String} code The button code to press.
	 */
	public function setButtonDown(code:Number|String):Void;

	/**
	 * Manually set multiple buttons down.
	 * @method setButtonsDown
	 * @param {String|Number} args Pass multiple arguments to set multiple buttons down with one call.
	 */
	public function setButtonsDown(code:Number|String):Void;

	/**
	 * Manueally set a button up. If the button is pressed, then the onButtonUp callback is fired.
	 * @method setButtonUp
	 * @param {Number|String} code The button code to release.
	 */
	public function setButtonUp(code:Number|String):Void;

	/**
	 * Manually set multiple buttons up.
	 * @method setButtonsUp
	 * @param {Number|String} args Pass multiple arguments to set multiple buttons donw with one call.
	 */
	public function setButtonsUp(code:Dynamic):Void;

	/**
	 * Reset the game pad, which ensures that if the player is pressing buttons when the
	 * game ends, it will start out fresh.
	 * @method reset
	 */
	public function reset():Void;

	public function handleButtonDown(event:Dynamic):Void;

	public function handleButtonUp(event:Dynamic):Void;
	// KonamiCode
	//password: "38384040373937396665",
	//passwordSoFar: 0,
	//konamiActivated: false,

	public function checkForCode(code:Float):Bool;

	/**
	 * Determine if the keycode matches any of the mapped keys.
	 * @param {Number} keyCode The key code to check
	 * @return {Number}
	 * @protected
	 */
	public function getInternalCode(keyCode:Float):Float;

	public function toString():String;

	/**
	 * An event is fired from an external source, likely the site framework window.
	 * This ensures the game framework can receive input properly.
	 * @method onExternalEvent
	 * @param {Object} event The external event object.
	 * @static
	 * @protected
 */
	public static function onExternalEvent (event:Dynamic):Void;

	public static function handleButtonDown(event:Dynamic):Void;

	public static function handleButtonUp(event:Dynamic):Void;

}