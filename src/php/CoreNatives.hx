package php;

class CoreNatives
{
	public static inline function throw_(v:Dynamic) : Void
	{
		untyped __call__("throw", v);
	}
	
	public static function instanceof(v:Dynamic, c:Dynamic) : Bool
	{
		return untyped __php__("$v instanceof $c");
	}
	
	public static function cast_to_int(v:Dynamic) : Int
	{
		return untyped __php__("(int)$v");
	}
	
	public static function cast_to_bool(v:Dynamic) : Bool
	{
		return untyped __php__("(bool)$v");
	}
	
	public static function cast_to_float(v:Dynamic) : Float
	{
		return untyped __php__("(float)$v");
	}
	
	public static function cast_to_string(v:Dynamic) : String
	{
		return untyped __php__("(string)$v");
	}
	
	public static function cast_to_array(v:Dynamic) : NativeArray
	{
		return untyped __php__("(array)$v");
	}
	
	public static function cast_to_object(v:Dynamic) : Dynamic
	{
		return untyped __php__("(object)$v");
	}
	
	public static function cast_to_unset(v:Dynamic) : Dynamic
	{
		return untyped __php__("(unset)$v");
	}
	
	public static function cast_to_binary(v:Dynamic) : NativeArray
	{
		return untyped __php__("(binary)$v");
	}
}