package gamelibs.input;

import easeljs.geom.Rectangle;
import easeljs.display.Shape;
import easeljs.geom.Point;
@:native ("TouchBar")
extern class TouchBar {
	/**
	 * The TouchBar is a user interface control that converts a draggable surface into keyboard controls
	 * using a "target" object. For example, as long as the target is to the left, the target will move towards it
	 * (using static motion or a simple ease-out motion) as long as the mouse is down.
	 * The TouchBar supports vertical and horizontal targeting, as well as target aligning, which is handy
	 * if the target shape has a centered or top-left registration point.
	 * @class TouchBar
	 * @param {Rectangle} hitArea The hitArea that is used relative to the stage.
	 * @param {DisplayObject} target A display object, which also contains a width & height property
	 * that the TouchBar moves towards the user's pointer.
	 * @param {String} targetAlignMode How the target aligns to the pointer. This will depend on the registration
	 *      point of the target. The default is top left ("TL"). Available modes are:
	 *      <ol><li>TL: Top Left (this can also be set using an empty value or empty string)</li>
	 *      <li>TC: Top Center (this can also be set just using "C")</li>
	 *      <li>TR: Top Right (this can also be set just using "R")</li>
	 *      <li>ML: Middle Left (this can also be set just using "M")</li>
	 *      <li>MC: Middle Center</li>
	 *      <li>MR: Middle Right</li>
	 *      <li>BL: Bottom Left (this can also be set just using "B")</li>
	 *      <li>BC: Bottom Center</li>
	 *      <li>BR: Bottom Right</li></ol>
	 * @param {Stage} stage The EaselJS stage to track mouseMove events.
	 * @constructor
 */

	public function new (hitArea:Dynamic, target:Dynamic, targetAlignMode:Dynamic, stage:Dynamic):Void;
	public function initialize (hitArea:Dynamic, target:Dynamic, targetAlignMode:Dynamic, stage:Dynamic):Void;

	/**
		 * A constant that defines horizontal-only movement when setting the targetDirection
		 * of the TouchBar.
		 * @property HORIZONTAL
		 * @type {String}
		 * @default horizontal
		 * @static
		 */
	public static var HORIZONTAL = "horizontal";

	/**
	 * A constant that defines vertical-only movement when setting the targetDirection
	 * of the TouchBar.
	 * @property VERTICAL
	 * @type {String}
	 * @default vertical
	 * @static
	 */
	public static var VERTICAL = "vertical";

	/**
	 * A constant that defines both horizontal and vertical movement when setting the
	 * targetDirection of the TouchBar.
	 * @property BOTH
	 * @type {String}
	 * @default both
	 * @static
	 */
	public static var BOTH = "both";

	/**
	 * A constant that defines a static pixel-per-frame move motion when setting the
	 * targetMode of the TouchBar.
	 * @property MOVE_MODE
	 * @type {String}
	 * @default moveMode
	 * @static
	 */
	public static var MOVE_MODE = "moveMode";

	/**
	 * A constant that defines a simple ease-out motion when setting the targetMode
	 * of the TouchBar.
	 * @property TWEEN_MODE
	 * @type {String}
	 * @default tweenMode
	 * @static
	 */
	public static var TWEEN_MODE = "tweenMode";

	public static var enabled:Bool;
	public static var setEnabled:Dynamic;


	/**
	 * The hitArea of the generated shape that starts the touch-drag interaction.
	 * @property hitArea
	 * @type Rectangle
	 */
	public var hitArea:Rectangle;

	/**
	 * The target that the TouchBar moves towards the pointer. This can be any object with
	 * and x, y, width, and height property.
	 * @property target
	 * @type Object
	 */
	public var target:Dynamic;

	/**
	 * The generated EaselJS shape which should be added to the stage as the touch target.
	 * @property sprite
	 * @type Shape
	 * @protected
	 */
	public var sprite:Shape;

	/**
	 * The position that the user last interacted with, which the target object will move towards.
	 * @property targetPosition
	 * @type Point
	 * @protected
	 */
	public var targetPosition:Point;

	/**
	 * The position that the target object is currently at.
	 * @property currentPosition
	 * @type Point
	 * @protected
	 */
	public var currentPosition:Point;

	/**
	 * The pixel offset which assists with target alignment.
	 * @property offset
	 * @type Point
	 * @protected.
	 */
	public var offset:Point;

	/**
	 * Determines if the mouse is currently pressed.
	 * @property mouseIsDown
	 * @type Boolean
	 * @default false
	 * @protected
	 */
	public var mouseIsDown:Bool;


	/**
	* The mode in which the target moves towards the pointer. The available options are:
	* <ol>
	*     <li>TouchBar.MOVE_MODE: Move a specific pixel amount (specified by targetAmount) each tick.</li>
	*     <li>TouchBar.TWEEN_MODE: Tween towards the pointer each tick using the targetAmount to determine the
	*     speed.</li>
	* </ol>
	* The default value is moveMoveMode.
	* @property targetMode
	* @type String
	* @default moveMode
	*/
	public var targetMode:String;

	/**
	 * The speed to move the paddle. This changes behaviour depending on the target mode.
	 * <ol><li>In move mode (TouchBar.MOVE_MODE), it is the number of pixels to travel towards the target
	 *      each tick. The higher the number, the faster it moves.</li>
	 *      <li>In tween mode, it is the divisor, which the remaining distance between the target and the touch
	 *      position. This higher the number, the slower it moves.</li></ol>
	 * @property targetAmount
	 * @type Number
	 * @default 10
	 */
	public var targetAmount:Float;

	/**
	 * The direction to constrain motion to. The available options are:
	 * <ol>
	 *     <li>TouchBar.HORIZONTAL: Move only horizontally</li>
	 *     <li>TouchBar.VERTICAL: Move only vertically</li>
	 *     <li>TouchBar.BOTH: Move in any direction</li>
	 * </ol>
	 * @property targetDirection
	 * @type String
	 * @default both
	 */
	public var targetDirection:String;

	/**
	 * The horizontal align mode. This is either R (right), L (left), or C (center), and is
	 * derived from the targetAlignMode passed in the constructor, or using setTargetAlignMode().
	 * @property horizontalAlign
	 * @type String
	 * @default C
	 * @protected
	 */
	public var horizontalAlign:String;

	/**
	 * The vertical align mode. This is either T (top), B (bottom), or M (middle), and is
	 * derived from the targetAlignMode passed in the constructor, or using setTargetAlignMode().
	 * @property verticalAlign
	 * @type String
	 * @default M
	 * @protected.
	 */
	public var verticalAlign:String;

	/**
	 * Determines if the target always reaches the last place the pointer was tapped. If true, the
	 * target will continue to move after the pointer is released. If false, the target will stop
	 * when the pointer is released.
	 * @property alwaysReachTarget
	 * @type Boolean
	 * @default false
	 */
	public var alwaysReachTarget:Bool;

	/**
	 * A tick factor will multiply the current targetAmount. To be used when doing
	 * framerate-based motion.
	 * @property tickFactor
	 * @type Number
	 * @default 1
	 */
	public var tickFactor:Float;

	public var hasMoved:Bool;

	public function handleMouseDown (event:Dynamic):Void;
	public function handleMouseMove (event:Dynamic):Void;
	public function handleMouseUp (event:Dynamic):Void;

	public function setTargetAlignMode (align:String):Void;
	public function stopMoving (stopTick:Dynamic):Void;
	public function tick ():Void;
	public function update ():Void;
	public function updateOffset ():Void;
	public function updateTarget ():Void;

}