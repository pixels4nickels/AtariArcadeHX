package gamelibs.input;

import easeljs.display.Shape;
import easeljs.geom.Point;
import easeljs.geom.Rectangle;
import easeljs.display.Stage;
import easeljs.display.SpriteSheet;
import easeljs.display.Container;
@:native ("JoyStick")
extern class JoyStick {
	/**
	 * The joystick component displays an on-screen joystick controller, which can be easily skinned.
	 * The controller provides 9-way keyboard-style controls (up, left, down, right, and 4 corners).
	 * Additionally, the joystick provides angle and distance information that can be polled, as
	 * well as a "buttonActive" state. Ensure that the joystick.sprite is added to the stage after it is created.
	 * @class JoyStick
	 * @param {Rectangle} rect A rectangle that defines the hit-area of the joystick when "autoHide" is true. The coordinates
	 *      of the rectangle are relative to the stage/container, not the joystick's position.
	 * @param {Object} params An object that defines additional properties of the joystick, including:
	 *  <ol><li>controlDirection: If the joystick should control the game direction by triggering button-down events.
	 *      The default value is true</li>
	 *  <li>autoHide: If the joystick should only show when the player presses the hitArea. It will appear where the
	 *      player presses. The default value is false.</li>
	 *  <li>showStick: If the joystick should add a "stick" line between the pad and thumb. The default value is true.</li>
	 *  <li>radius: The radius of the joystick draggable area. The default value is 50.</li>
	 *  <li>pullRadius: The amount you need to pull the joystick to bring it to 100% in any direction. This provides a less
	 *  precise drag area, or allows a smaller graphic. It is recommended that this is set whenever radius is set. The default
	 *  value is 100.</li>
	 *  <li>dragThreshold: The amount of the pullRadius that causes an actual drag. The default value is 0.3.</li></ol>
	 *  @param {SpriteSheet | Object} images A spritesheet that defines the joystick states, or an object containing images
	 *      and registration points (regX and regY) for each image. The available images are:
	 *      <ol><li>base: core graphic</li>
	 *      <li>thumb: draggable knob</li>
	 *      <li>pointer: points in joystick direction.</li></ol>
	 * @constructor
	 */

	public function new (hitArea:Rectangle, params:Dynamic, images:SpriteSheet|Bitmap):Void;
	public function initialize(hitArea:Rectangle, params:Dynamic, images:SpriteSheet|Bitmap):Void;

	public static var RADIUS:Int;
	public static var PULL_RADIUS:Float;
	public static var DRAG_THRESHOLD:Float;


	/**
	 * A reference to the joystick sprite, which needs to be added to an EaselJS container on the stage
	 * or the stage itself to be used.
	 * @property sprite
	 * @type Container
	 */
		public var sprite:Container;

	/**
	 * The distance in "positive" pixels the joystick is currently dragged from center in positive pixels,
	 * regardless of direction.
	 * @property currentDistance
	 * @type Number
	 * @default 0
	 */
	public var currentDistance:Number;
	/**
	 * The distance the joystick is currently dragged from center in either direction,
	 * as a Point containing an X and Y ratios (-1 to 1) that the thumb is dragged from the center.
	 * @property currentAmount
	 * @type Point
	 * @default 0,0
	 */
	public var currentAmount:Number;
	/**
	 * The current angle in degrees that the joystick is pointing.
	 * @property currentAngle
	 * @type Number
	 * @default 0
	 */
	public var currentAngle:Number;
	/**
	 * The current angle in radians that the joystick is pointing.
	 * @property currentRad`
	 * @type Number
	 * @default 0
	 */
	public var currentRad:Number;
	/**
	 * Detemines if the joystick is currently active (pressed by the user).
	 * @property buttonActive
	 * @type Boolean
	 * @default false
	 */
	public var buttonActive:Bool;

	/**
	 * Determines if the joystick is currently dragged passed the threshold.
	 * @property dragActive
	 * @type Boolean
	 * @default false
	 */
	public var dragActive:Bool;

	public var controlDirection:Bool;
	public var showStick:Bool;
	public var pullFactor:Number;

	public var spritesheet:SpriteSheet;
	public var thumb:Shape;
	public var pad: Shape;
	public var pointer: Shape;
	public var dragProps:Dynamic;

	public var buttonActive:Bool;
	public var currentAmount:Point;
	public var currentAngle:Float;
	public var currentDistance:Float;
	public var currentRad:Float;
	public var dragActive:Bool;
	public var sprite:Container;

	public var hitArea:Rectangle;
	public var autoHide:Bool;
	public var autoMove:Bool;
	public var radius:Float;
	public var pullRadius:Float;
	public var dragThreshold:Float;
	public var currentState:String;
	public var newPosition:Point,

	public function setPosition (x:Float, y:Float):Void;

	public function draw():Void;

	/**
	 * Set the joystick x and y position. This is only necessary if the "autoHide" property is false.
	 * @method setPosition
	 * @param {Number} x The horizontal position of the joystick center.
	 * @param {Number} y The vertical position of the joystick center.
	 */
	public function setPosition(x:Float, y:Float):Void;

	public function handleJoystickPress(event:Dynamic):Void;

	public function handleDrag(event:Dynamic):Void;
	public function updateThumb():Void;

	public function setState(h:Float, v:Float):Void;

	public function handleRelease(event:Dynamic):Void;

	public function handleTweenComplete():Void;

	public function tick():Void;

	public function toString():String;


}