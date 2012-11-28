package gamelibs.input;

import easeljs.display.Shape;
import easeljs.display.Container;
import easeljs.display.SpriteSheet;
import easeljs.geom.Rectangle;

@:native ("Throttle")
extern class Throttle {

	/**
	 * The Throttle is a single-axis controller that can be used both vertically and
	 * horizontally. Ensure that the throttle.sprite is added to the stage after it is created.
	 * @class Throttle
	 * @param {Rectangle} hitArea The hit area that triggers the throttle action if autoHide=false.
	 * @param {String} direction The axis for the throttle (Throttle.HORIZONTAL or Throttle.VERTICAL). The default is vertical.
	 * @param {Object} params An object that defines the available parameters:
	 *      <ol><li>controlDirection: Whether the throttle causes buttonDown/buttonUp behaviour automatically. The default is true.</li>
	 *      <li>autoHide: If the throttle hides by default, and is displayed when the user presses the hit area. The default is false.
	 *          Note that a hitArea MUST be defined to use autoHide.</li>
	 *      <li>radius: The distance the throttle moves from the center. The default value is 45.</li>
	 *      <li>pullRadius: The distance the user can move in order to pull the thumb to 100%. The default value is 100.</li>
	 *      <li>minimumDistance: The minimum distance (as a percent) the user must pull the thumb to be considered a change in direction.
	 *          The default value is 0.1 (10%)</li></ol>
	 * @param {SpriteSheet | Object} images The images that define the Throttle skins:
	 *      <ol><li>base: The base skin</li>
	 *      <li>thumb: The draggable knob</li></ol>
	 * @constructor
	 */

	public function new(hitArea:Rectangle, direction:String, params:Dynamic, images:SpriteSheet|Bitmap);

	public function initialize(hitArea:Rectangle, direction:String, params:Dynamic, images:SpriteSheet|Bitmap);
	/**
		 * Defines the vertical throttle mode.
		 * @property VERTICAL
		 * @type {String}
		 * @default vertical
		 * @static
		 */
	public static var VERTICAL:String;

	/**
	 * Defines the horizontal throttle mode.
	 * @property HORIZONTAL
	 * @type {String}
	 * @default horizontal
	 * @static
	 */
	public static var HORIZONTAL:String;

	// Defaults
	public static var RADIUS:Float;
	public static var PULL_RADIUS:Float;
	public static var MINIMUM_DISTANCE:Float;

	public var hitArea:Rectangle;
	public var direction:String;

	public var radius:s.RADIUS,
	public var pullRadius:Float;
	public var controlDirection:Bool;
	public var autoHide:Bool;
	public var minimumDistance:Float;

	public var throttle:Container;
	public var spritesheet:SpriteSheet;
	public var dragProps:Dynamic;

	public var pad:Shape;
	public var thumb:Shape;

	/**
	 * A reference to the throttle sprite, which needs to be added to an EaselJS container on the stage
	 * or the stage itself to be used.
	 * @property sprite
	 * @type Container
	 */
	public var sprite:Container;

	/**
	 * The current distance from the center to the throttle position.
	 * @property currentDistance
	 * @type Number
	 * @default 0
	 */
	public var currentDistance:Float;

	/**
	 *  The current direction (1, 0, or -1) of the throttle.
	 *  @property currentDirection
	 *  @type Number
	 */
	public var currentDirection:Float;

	/**
	 * Determines if the throttle is currently being pressed.
	 * @property buttonActive
	 * @type Boolean
	 * @default false
	 */
	public var buttonActive:Bool;

	public var dragActive:Bool;

	public var isVertical:Bool;

	/**
	 * Set the throttle x and y position. This is only necessary if the "autoHide" property is false.
	 * @method setPosition
	 * @param {Number} x The horizontal position on pixels
	 * @param {Number} y The vertical position in pixels.
	 */
	public function setPosition(x:Float, y:Float):Void;

	public function handlePress(event:Dynamic):Void;

	public function handleThrottlePress(event:Dynamic):Void;

	public function handleDrag(event:Dynamic):Void;

	public function handleRelease(event):Void;

	public function toString():String;


}