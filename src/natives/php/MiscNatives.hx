package php;

class MiscNatives
{
	public static inline function connection_aborted() : Int return untyped __call__('connection_aborted');
	
	public static inline function connection_status() : Int return untyped __call__('connection_status');
	
	public static inline function constant(name:String) : Dynamic return untyped __call__('constant', name);
	
	public static inline function define(name:String, value:Dynamic, case_insensitive=false) : Bool return untyped __call__('define', name, value, case_insensitive);
	
	public static inline function defined(name:String) : Bool return untyped __call__('defined', name);
	
	public static function die(?status:String) : Void
	{
		if (status == null)
		{
			untyped __call__('die');
		}
		else
		{
			untyped __call__('die', status);
		}
	}
	
	public static inline function eval(code:String) : Dynamic return untyped __call__('eval', code);
	
	public static function exit(?status:String) : Void
	{
		if (status == null)
		{
			untyped __call__('exit');
		}
		else
		{
			untyped __call__('exit', status);
		}
	}
	
	public static function get_browser(?user_agent:String, return_array=false) : Dynamic
	{
		if (user_agent == null)
		{
			return untyped __call__('get_browser');
		}
		else
		{
			return untyped __call__('get_browser', user_agent, return_array);
		}
	}
	
	public static inline function __halt_compiler() : Void return untyped __call__('__halt_compiler');
	
	public static inline function highlight_file(filename:String, return_=false) : Dynamic return untyped __call__('highlight_file', filename, return_);
	
	public static inline function highlight_string(str:String, return_=false) : Dynamic return untyped __call__('highlight_string', str, return_);
	
	public static function ignore_user_abort(?value:Bool) : Int
	{
		if (value == null)
		{
			return untyped __call__('ignore_user_abort');
		}
		else
		{
			return untyped __call__('ignore_user_abort', value);
		}
	}
	
	public static function pack(format:String, ?args:Dynamic, ?restArgs:Dynamic) : String
	{
		if (restArgs == null)
		{
			if (args == null)
			{
				return untyped __call__('pack', format);
			}
			else
			{
				return untyped __call__('pack', format, args);
			}
		}
		else
		{
			return untyped __call__('pack', format, args, restArgs);
		}
	}
	
	public static function php_check_syntax(filename:String, ?error_message:String) : Bool
	{
		if (error_message == null)
		{
			return untyped __call__('php_check_syntax', filename);
		}
		else
		{
			return untyped __call__('php_check_syntax', filename, error_message);
		}
	}
	
	public static inline function php_strip_whitespace(filename:String) : String return untyped __call__('php_strip_whitespace', filename);
	
	public static inline function sleep(seconds:Int) : Int return untyped __call__('sleep', seconds);
	
	public static inline function sys_getloadavg() : NativeArray return untyped __call__('sys_getloadavg');
	
	public static inline function time_nanosleep(seconds:Int, nanoseconds:Int) : Dynamic return untyped __call__('time_nanosleep', seconds, nanoseconds);
	
	public static inline function time_sleep_until(timestamp:Float) : Bool return untyped __call__('time_sleep_until', timestamp);
	
	public static inline function uniqid(prefix="", more_entropy=false) : String return untyped __call__('uniqid', prefix, more_entropy);
	
	public static inline function unpack(format:String, data:String) : NativeArray return untyped __call__('unpack', format, data);
	
	public static inline function usleep(micro_seconds:Int) : Void return untyped __call__('usleep', micro_seconds);
}
