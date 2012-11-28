package gamelibs.input;

import easeljs.display.DisplayObject;
import easeljs.geom.Rectangle;
import easeljs.display.Container;

@:native ("ArcadeButton")
extern class ArcadeButton {


	public static var DEFAULT_ALPHA = 0.5;
	public static var HOVER_ALPHA = 1;
	public static var DISABLED_ALPHA = 0.2;


	public function new ():Void;


	public var button;
	public var hitArea:Rectangle;
	public var pressed:Bool;
	public var dragging:Bool;

	/**
	 * Determines if the button can be interacted with. Do not set this property, instead use the
	 * setDisabled() API.
	 * @property disabled
	 * @type Boolean
	 * @default false
	 * @readonly
	 */
	public var disabled:Bool;

	public var name:String;

	public var hoverSuffix:String;
	public var disabledSuffix:String;

	/**
	 * The display sprite to add to stage. Do not add the ArcadeButton instance itself, that
	 * will cause errors in EaselJS.
	 * @property sprite
	 * @type Container
	 */
	public var sprite:Container;
	public var buttonSprite:Container;

	public var alpha:sString;
	public var hoverAlpha:String;
	public var disabledAlpha:String;

	public var hoverState:String;
	public var disabledState:String;

	/**
	 * A callback to fire when the button is pressed.
	 * @property callback
	 * @type Function
	 */
	public var callback:Dynamic;

	public function initialize(button:Container, hitArea:Rectangle, image:Bitmap|SpriteSheet, name:String, params:Dynamic):Void;

	public function draw():Void;
	public function handlePress(event):Void;
	public function handleDrag(event):Void;
	public function handleRelease(event):Void;
	public function setDisabled(value):Void;
	public function setPosition(x, y):Void;
	public function toString():Void;

}