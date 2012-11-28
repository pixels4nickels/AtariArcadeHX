package gskinner;

@:native ("ProximityManager")
extern class ProximityManager {
	/**
	* The Proximity Manager breaks the canvas up into a grid of a specific size,
	* and when updated, stores the contents (sprites) into their grid positions,
	* making proximity detection a lot faster and lighter weight.
	* @class ProximityManager
	* @param {Number} gridSize The size of the grid to use. It should be larger than the
	* width and height of the sprites that are added to it.
	* @constructor
	*/
	public function new (gridSize:Float):Void;
	public function initialize (gridSize:Float):Void;

	/**
	* The size of the current grid. This must be set when the ProximityManager is
	* created, and can not be changed later. The proximity manager only deals in
	* positions, and does not account for size, so the grid size should be larger than
	* the full width or height of the largest sprite in the grid.
	* @property gridSize
	* @type Number
	* @default 25
	*/
	public var gridSize:Float;

	/**
	* A 2-dimensional list of "positions", which shows where the sprite lives on the grid.
	* @property pos
	* @type Array
	* @protected
	*/
	public var pos:Array <Dynamic>;

	/**
	* A list of game sprites contained in the grid.
	* @property sprites
	* @type Array
	* @protected
	*/
	public var sprites:Array <Dynamic>;

	/**
	* Add a sprite to the grid.
	* @method addItem
	* @param {Object} sprite An object containing an x and y property.
	*/
	public function addItem (sprite:Dynamic):Void;


	/**
	* Get the number of sprites in the grid.
	* @method getLength
	* @return {Number} The number of sprites in the grid.
	*/
	public function getLength ():Float;

	/**
	* Get an object's neighbouring objects in the surrounding grid squares. Sprites in the same grid, and
	* the squares above, below, left, right, and on all corners are returned.
	* @method getNeighbours
	* @param {Object} sprite A sprite in the grid.
	* @return {Array} A list of neighbouring objects in the surrounding grid squares (9 total squares)
	*/
	public function getNeighbours (sprite:Dynamic):Array <Dynamic>;

	/**
	* Return a string formatted list of the contents of the grid for debugging.
	* @method list
	* @return {String} The string output of the grid.
	*/
	public function list ():String;

	/**
	* Refresh the positions in the grid. This method is <b>not</b> called automatically
	* so it is up to the developer to call it when sprite properties (x or y) change.
	* Ensure that this method is called before <b>getNeighbours()</b> is called.
	* @method refresh
	*/
	public function refresh ():Void;


	/**
	* Remove a sprite from the grid.
	* @method removeItem
	* @param {Object} sprite An object that is on the grid.
	*/
	public function removeItem (sprite:Dynamic):Void;

	/**
	* Remove a sprite from the grid.
	* @method removeAllItems
	* @param {Object} sprite An object that is on the grid.
	*/
	public function removeAllItems ():Void;


}