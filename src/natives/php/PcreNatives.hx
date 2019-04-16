package php;

import haxe.macro.Expr;

class PcreNatives
{
	public static var PREG_PATTERN_ORDER(get, never) : Int; private static inline function get_PREG_PATTERN_ORDER() : Int return untyped __php__("PREG_PATTERN_ORDER");
	public static var PREG_SET_ORDER(get, never) : Int; private static inline function get_PREG_SET_ORDER() : Int return untyped __php__("PREG_SET_ORDER");
	public static var PREG_OFFSET_CAPTURE(get, never) : Int; private static inline function get_PREG_OFFSET_CAPTURE() : Int return untyped __php__("PREG_OFFSET_CAPTURE");
	
	public static function preg_filter(pattern:Dynamic, replacement:Dynamic, subject:Dynamic, limit=-1, ?count:Int) : Dynamic
	{
		if (count == null)
		{
			return untyped __call__('preg_filter', pattern, replacement, subject, limit);
		}
		else
		{
			return untyped __call__('preg_filter', pattern, replacement, subject, limit, count);
		}
	}
	
	public static inline function preg_grep(pattern:String, input:NativeArray, flags=0) : NativeArray return untyped __call__('preg_grep', pattern, input, flags);
	
	public static inline function preg_last_error() : Int return untyped __call__('preg_last_error');
	
	public static inline function preg_match_all(pattern:String, subject:String) : Int return untyped __call__('preg_match_all', pattern, subject);
	public static inline function preg_match_all_ex(pattern:String, subject:String, matches:NativeArray, ?flags:Int, offset=0) : Int return untyped __call__('preg_match_all', pattern, subject, matches, untyped __physeq__(flags, null) ? __php__("PREG_PATTERN_ORDER") : flags, offset);
	
	public static inline function preg_match(pattern:String, subject:String) : Int return untyped __call__('preg_match', pattern, subject);
	public static inline function preg_match_ex(pattern:String, subject:String, matches:NativeArray, flags=0, offset=0) : Int return untyped __call__('preg_match', pattern, subject, matches, flags, offset);
	
	public static function preg_quote(str:String, ?delimiter:String) : String
	{
		if (delimiter == null)
		{
			return untyped __call__('preg_quote', str);
		}
		else
		{
			return untyped __call__('preg_quote', str, delimiter);
		}
	}
	
	public static function preg_replace_callback_array(patterns_and_callbacks:NativeArray, subject:Dynamic, limit=-1, ?count:Int) : Dynamic
	{
		if (count == null)
		{
			return untyped __call__('preg_replace_callback_array', patterns_and_callbacks, subject, limit);
		}
		else
		{
			return untyped __call__('preg_replace_callback_array', patterns_and_callbacks, subject, limit, count);
		}
	}
	
	public static function preg_replace_callback(pattern:Dynamic, callback:NativeArray->String, subject:Dynamic, limit=-1, ?count:Int) : Dynamic
	{
		if (count == null)
		{
			return untyped __call__('preg_replace_callback', pattern, callback, String, subject, limit);
		}
		else
		{
			return untyped __call__('preg_replace_callback', pattern, callback, String, subject, limit, count);
		}
	}
	
	public static function preg_replace<T>(pattern:Dynamic, replacement:Dynamic, subject:T, limit=-1, ?count:Int) : T
	{
		if (count == null)
		{
			return untyped __call__('preg_replace', pattern, replacement, subject, limit);
		}
		else
		{
			return untyped __call__('preg_replace', pattern, replacement, subject, limit, count);
		}
	}
	
	public static inline function preg_split(pattern:String, subject:String, limit=-1, flags=0) : NativeArray return untyped __call__('preg_split', pattern, subject, limit, flags);
}
