package php;

class StringToolsNative
{
	public static inline function splitNative(s:String, delimiter:String): TypedAssoc<Int, String> return cast Global.explode(delimiter, s);
	public static inline function lpad(s:String, char:String, count:Int): String return Global.str_pad(s, count, char, Const.STR_PAD_LEFT);
	public static inline function rpad(s:String, char:String, count:Int): String return Global.str_pad(s, count, char);
	public static inline function ltrim(s:String, ?chars:String): String return Global.ltrim(s, chars);
	public static inline function rtrim(s:String, ?chars:String): String return Global.rtrim(s, chars);
	public static inline function trim(s:String, ?chars:String): String return Global.trim(s, chars);
	public static inline function replace(s:String, from:String, to:String): String return Global.str_replace(from, to, s);
	public static inline function startsWith(s:String, start:String): Bool return Syntax.strictEqual(Global.strpos(s, start), 0);
	public static inline function endsWith(s:String, end:String): Bool return Global.substr(s, -end.length) == end;
}