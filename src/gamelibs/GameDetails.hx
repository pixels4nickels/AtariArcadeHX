package gamelibs;

import easeljs.display.Stage;
import js.CanvasRenderingContext2D;

@:native ("GameDetails")
extern class GameDetails
{
	public var score:Int;
	public var level:Int;
	public var lives:Int;


	public function new (score:Int, level:Int, lives:Int):Void;

	public function initialize (score:Int, level:Int, lives:Int):Void;
	public function deserialize (value:Dynamic):Void;
	public function serialize ():Dynamic;
	public function toString ():String;
}
