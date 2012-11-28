package gamelibs;

import easeljs.display.Bitmap;
import easeljs.display.Stage;
import easeljs.display.Container;

@:native("GameLibs.GameUI")
extern class GameUI {

	public var background:Bitmap;
	public static var STRETCH:String;
	public static var SCALE:String;
	public static var CROP:String;

	//Align
	public static var CENTER:String;
	//Specifies that the CLIP is aligned at the center.
	public static var CENTER_TOP:String;
	//Specifies that the CLIP is aligned at center-top.
	public static var CENTER_LEFT:String;
	//Specifies that the CLIP is aligned at center-left corner.
	public static var CENTER_RIGHT:String;
	//Specifies that the CLIP is aligned at center-right corner.
	public static var BOTTOM:String;
	//Specifies that the CLIP is aligned at the bottom.
	public static var BOTTOM_LEFT:String;
	//Specifies that the CLIP is aligned in the bottom-left corner.
	public static var BOTTOM_RIGHT:String;
	//Specifies that the CLIP is aligned in the bottom-right corner.
	public static var TOP_LEFT:String;
	//Specifies that the CLIP is aligned in the top-left corner.
	public static var TOP_RIGHT:String;
	//Specifies that the CLIP is aligned in the top-right corner.

	/**
	 * Initializes the UI. This is called by the GameBootstrap before the game is instantiated.
	 * @method initialize
	 * @param {Number} w The stage width
	 * @param {Number} h The stage height
	 * @protected
	 */
	//public function new (w:Float, h:Float):Void;
	public function initialize (w:Float, h:Float):Void;

	/**
	 * Change the background. The background is better suited to live in an HTML DIV
	 * instead of the canvas. The background DIV is sized to the same dimensions as the
	 * Stage. Changing the background results in a "snap" change to the new image - there
	 * is no transition.
	 * @method changeBackground
	 * @param {HTMLImageElement|String} src The path or Image element to use as a background.
	 * @param {Number} width The width of the viewport.
	 * @param {Number} height The height of the viewport.
	 * @param {String} fit The mode to fit the image into the viewport.
	 * <ul>
	 *     <li>stretch (default): Match the width and height of the viewport. This will augement the image
	 *          if the ratios do not match.</li>
	 *     <li>scale: Scale the image to fit in the viewport. Additional space may be visible on the outer
	 *          edge of the image.</li>
	 *     <li>crop: Scale the image to fill the viewport. Parts of the image will be cropped out.</li>
	 * </ul>
	 * @param {String} align The mode to align the image if it does not fit perfectly.
	 */
	public static function changeBackground (src:Dynamic, width:Float, height:Float, fit:String, align:String):Bitmap;

	public static function blur(stage:Stage):Void;


	public static function drawChild(child:Container, container:Container):Void;

	/**
	 * Notify the framework that the mouse is beginning to drag. This will ensure that the mouse focus
	 * can not get lost in iframes. Note that you MUST call stopDrag when the drag is complete.
	 * @method startDrag
	 */
	public static function startDrag ():Void;

	/**
	 * Notify the framework that a mouse drag has completed. This must be called if the startDrag was
	 * called at the start of a drag.
	 * @method stopDrag
	 */
	public static function stopDrag ():Void;

}