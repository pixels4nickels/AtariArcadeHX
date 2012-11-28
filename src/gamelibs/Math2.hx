package gamelibs;

import easeljs.geom.Point;
import easeljs.geom.Rectangle;

@:native ("Math2")
extern class Math2 {

	/**
	 * A static multiplier to convert a radian angle to degrees.
	 * @property RAD_TO_DEG
	 * @type {Number}
	 * @default 180/Math.PI
	 * @static
	 */
	public static var RAD_TO_DEG:Float ;

	/**
	 * A static multiplier to convert a degree angle to radians.
	 * @property DEG_TO_RAD
	 * @type {Number}
	 * @default Math.PI/180
	 * @static
	 */
	public static var DEG_TO_RAD:Float ;

	// Hit Detection
	/**
	 * No intersection
	 * @property INTERSECT_NONE
	 * @type {Number}
	 * @default 0
	 * @static
	 */
	public static var INTERSECT_NONE:Int;

	/**
	 * Left intersection
	 * @property INTERSECT_LEFT
	 * @type {Number}
	 * @default 1
	 * @static
	 */
	public static var INTERSECT_LEFT:Int;

	/**
	 * Right intersection
	 * @property INTERSECT_RIGHT
	 * @type {Number}
	 * @default 2
	 * @static
	 */
	public static var INTERSECT_RIGHT:Int;

	/**
	 * Top intersection
	 * @property INTERSECT_TOP
	 * @type {Number}
	 * @default 4
	 * @static
	 */
	public static var INTERSECT_TOP:Int;

	/**
	 * Bottom intersection
	 * @property INTERSECT_BOTTOM
	 * @type {Number}
	 * @default 8
	 * @static
	 */
	public static var INTERSECT_BOTTOM:Int;

	/**
	 * Inside intersection (both points are inside the rectangle)
	 * @property INTERSECT_INSIDE
	 * @type {Number}
	 * @default 16
	 * @static
	 */
	public static var INTERSECT_INSIDE:Int;

	/**
	 * No intersection
	 * @property INTERSECT_ANY
	 * @type {Number}
	 * @default 15 (1|2|4|8)
	 * @static
	 */
	public static var INTERSECT_ANY:Int;

	/**
	 * Horizontal (left and right) intersection
	 * @property INTERSECT_HORIZONTAL
	 * @type {Number}
	 * @default 3 (1|2)
	 * @static
	 */
	public static var INTERSECT_HORIZONTAL:Int;

	/**
	 * Vertical (top and bottom) intersection
	 * @property INTERSECT_NONE
	 * @type {Number}
	 * @default 12 (4|8)
	 * @static
	 */
	public static var INTERSECT_VERTICAL:Int;


	public function hitTestPoint(rect:Rectangle, p:Point):Bool;


	/**
	 * Determine if a number is inside of a range.
	 * @param {Number} value The value to check.
	 * @param {Number} low The low end of the range
	 * @param {Number} high The high end of the range
	 * @return {Boolean}
	 */
	public function isBetween(value, low, high):Bool;

	/**
	 * Interpolate between two numbers. This helps find a point between two numbers. For example:
	 * <ul><li>Interpolating between 10 and 20 with 0.5 would result in 15.</li>
	 *      <li>Interpolating between 10 and 20 with 0.25 would result in 12.5.</li>
	 *      <li>Interpolating between 10 and 20 with 2 would result in 30.</li>
	 *      <li>Interpolating between 10 and 20 with -0.5 would result in 5.</li>
	 * </ul>
	 * @param {Number} val1 The first number. It can be higher or lower than the second.
	 * @param {Number} val2 The second number.
	 * @param {Number} amount A percentage between the two numbers. The default is 0.5.
	 *      A lower number will fall closer to the second value. You can optionally pass
	 *      a number greater than one or less than zero to find values outside of the range.
	 * @return {Number} The derived value between the two points.
	 */
	public function interpolate(val1:Float, val2:Float, amount:Float):Float;
	public function getRange (min:Float, max:Float):Float;
	public static function lineToBox (p1:Point, p2:Point, rect:Rectangle, checkDirection:Float):Float;
	public static function lineToLine (p1:Float, p2:Float, p3:Float, p4:Float):Bool;
	public static function moveTowardsTarget (object:Sprite|Point|Object, amount:Float, moveX:Bool, moveY:Bool):Void;
	public static function tweenTowardsTarget (object:Sprite|Point|Object, factor:Float, moveX:Bool, moveY:Bool):Void;

}