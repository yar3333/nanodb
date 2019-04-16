package php;

class TokenizerNatives
{
	public static inline function token_get_all(source:String) : TypedArray<TypedArray<Dynamic>> return untyped __call__('token_get_all', source);
	public static inline function token_name(token:Int) : String return untyped __call__('token_name', token);
}
