package gamelibs;

@:native ("Parallax")
extern class Parallax {

	/**
	 * The Parallax class creates and manages a set of layers to create a parallax effect.
	 * @class Parallax
	 * @param {Array} levels A list of parallax levels, which contains:
	 * <ol>
	 *     <li>A src path for displaying the background</li>
	 *     <li>A width which is the image width to be used when panning</li>
	 *     <li>...Other rules for scaling TBD</li>
	 * </ol>
	 * @constructor
	 */
	public function new (levels:Dynamic):Void;

	/**
	 * Initialize the effect.
	 * @method initialize
	 * @param levels
	 * @protected
	 */
	public function initialize (levels:Dynamic):Void;

	/**
	* A list of the layers that are created in the core background DIV class.
	* @property layers
	* @type Array
	* @protected
	*/
	public var layers:Array <Dynamic>;

	/**
	 * A list of the parallax levels.
	 * @property levels
	 * @type Array
	 * @protected
	 */
	public var levels:Array <Dynamic>;

	/**
	 * The width of the effect, which is the width of the container DIV
	 * @property width
	 * @type Number
	 */
	public var width:Float;

	/**
	 * The height of the effect, which is the height of the container DIV
	 * @property height
	 * @type Number
	 */
	public var height:Float;

	/**
	 * Set the position of the effect. Currently, this is just a horizontal position. The position
	 * will align all the layers.
	 * @method setPosition
	 * @param {Number} position The position (0-1) of the effect.
	 * @param {Boolean} Whether to refresh immediately (true), or tween to the new position (false). The
	 * default is false.
	 */
	public function setPosition (position:Float, Whether:Bool):Void;

	/**
	* Tick the effect. When tweening, this moves the current position closer to the target. Once the target
	* has reached ~1 pixel, it will stop.
	* @method tick
	* @protected
	*/
	public function tick ():Void;

	/**
	 * Update the effect. The position has changed, so redraw the layers.
	 * @method update
	 * @protected
	 */
	public function update ():Void;

}