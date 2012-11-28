package gskinner;

@:native ("VendorPrefixUtil")
extern class VendorPrefixUtil {

    public function new():Void;

	public var cache:Dynamic;

	public var prefexs:Array <String>;

	public var style:Dynamic;

	public static function getName(prop:Dynamic):Dynamic;
}
