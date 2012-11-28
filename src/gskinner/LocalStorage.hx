package gskinner;

@:native ("LocalStorage")
extern class LocalStorage {

    public function new():Void;

	public static function  set (name:String, value:Dynamic):Void

	public static function  get (name:String, defaultValue:Dynamic):Dynamic;

}
