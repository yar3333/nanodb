package php;

class GlobalVars
{
	public static var _SERVER(get, never) : TypedAssoc<String, Dynamic>;
	static inline function get__SERVER() return untyped __var__('_SERVER');
	
	public static var _GET(get, never) : TypedAssoc<String, String>;
	static inline function get__GET() return untyped __var__('_GET');
	
	public static var _POST(get, never) : TypedAssoc<String, String>;
	static inline function get__POST() return untyped __var__('_POST');
	
	public static var _FILES(get, never) : TypedAssoc<String, TypedAssoc<String, Dynamic>>;
	static inline function get__FILES() return untyped __var__('_FILES');
	
	public static var _COOKIE(get, never) : TypedAssoc<String, String>;
	static inline function get__COOKIE() return untyped __var__('_COOKIE');
	
	public static var _SESSION(get, never) : TypedAssoc<String, String>;
	static inline function get__SESSION() return untyped __var__('_SESSION');
	
	public static var _REQUEST(get, never) : TypedAssoc<String, String>;
	static inline function get__REQUEST() return untyped __var__('_REQUEST');
	
	public static var _ENV(get, never) : TypedAssoc<String, String>;
	static inline function get__ENV() return untyped __var__('_ENV');
}