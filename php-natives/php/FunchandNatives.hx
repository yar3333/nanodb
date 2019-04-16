package php;

import haxe.Constraints;

class FunchandNatives
{
	public static function filter_var(variable:Dynamic, ?filter:Int, ?options:Dynamic) : Dynamic
	{
		if (options == null)
		{
			if (filter == null)
			{
				return untyped __call__('filter_var', variable);
			}
			else
			{
				return untyped __call__('filter_var', variable, filter);
			}
		}
		else
		{
			return untyped __call__('filter_var', variable, filter, options);
		}
	}
	
	public static inline function call_user_func_array(callback:Function, param_arr:TypedArray<Int, Dynamic>) : Dynamic return untyped __call__('call_user_func_array', callback, param_arr);
	
	public static function call_user_func(callback:Function, ?parameter:Dynamic, ?restArgs:Dynamic) : Dynamic
	{
		if (restArgs == null)
		{
			if (parameter == null)
			{
				return untyped __call__('call_user_func', callback);
			}
			else
			{
				return untyped __call__('call_user_func', callback, parameter);
			}
		}
		else
		{
			return untyped __call__('call_user_func', callback, parameter, restArgs);
		}
	}
	
	public static inline function create_function(args:String, code:String) : String return untyped __call__('create_function', args, code);
	
	public static inline function forward_static_call_array(func:Function, parameters:NativeArray) : Dynamic return untyped __call__('forward_static_call_array', func, parameters);
	
	public static function forward_static_call(func:Function, ?parameter:Dynamic, ?restArgs:Dynamic) : Dynamic
	{
		if (restArgs == null)
		{
			if (parameter == null)
			{
				return untyped __call__('forward_static_call', func);
			}
			else
			{
				return untyped __call__('forward_static_call', func, parameter);
			}
		}
		else
		{
			return untyped __call__('forward_static_call', func, parameter, restArgs);
		}
	}
	
	public static inline function func_get_arg(arg_num:Int) : Dynamic return untyped __call__('func_get_arg', arg_num);
	
	public static inline function func_get_args() : NativeArray return untyped __call__('func_get_args');
	
	public static inline function func_num_args() : Int return untyped __call__('func_num_args');
	
	public static inline function function_exists(function_name:String) : Bool return untyped __call__('function_exists', function_name);
	
	public static inline function get_defined_functions() : NativeArray return untyped __call__('get_defined_functions');
	
	public static function register_shutdown_function(callback:Function, ?parameter:Dynamic, ?restArgs:Dynamic) : Void
	{
		if (restArgs == null)
		{
			if (parameter == null)
			{
				untyped __call__('register_shutdown_function', callback);
			}
			else
			{
				untyped __call__('register_shutdown_function', callback, parameter);
			}
		}
		else
		{
			untyped __call__('register_shutdown_function', callback, parameter, restArgs);
		}
	}
	
	public static function register_tick_function(func:Function, ?arg:Dynamic, ?restArgs:Dynamic) : Bool
	{
		if (restArgs == null)
		{
			if (arg == null)
			{
				return untyped __call__('register_tick_function', func);
			}
			else
			{
				return untyped __call__('register_tick_function', func, arg);
			}
		}
		else
		{
			return untyped __call__('register_tick_function', func, arg, restArgs);
		}
	}
	
	public static inline function unregister_tick_function(function_name:String) : Void return untyped __call__('unregister_tick_function', function_name);
}
