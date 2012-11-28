package gamelibs;

import easeljs.display.Stage;

@:native ("FPSMeter")
extern class FPSMeter{
	/**
	* A component which displays current FPS. It will display on top off all other children on the stage.
	* The FPSMeter will only display when the games are running in developer mode.
	* @class FPSMeter
	* @param {Stage} stage The EaselJS Stage to add the FPS Meter
	* @param {String} color The text color. The default is "#FFFFFF".
	* @constructor
	*/
	public function new (stage:Stage, color:String):Void;
	public function initialize (stage:Stage, color:String):Void;

	public var text:String;
	public var stage:Stage;

	public function tick ():Void;
	public function toString ():String;
}
