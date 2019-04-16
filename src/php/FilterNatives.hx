package php;

class FilterNatives
{
	public static var FILTER_VALIDATE_BOOLEAN(get, never) : String; private static inline function get_FILTER_VALIDATE_BOOLEAN() : String return untyped __php__("FILTER_VALIDATE_BOOLEAN");
	public static var FILTER_VALIDATE_EMAIL(get, never) : String; private static inline function get_FILTER_VALIDATE_EMAIL() : String return untyped __php__("FILTER_VALIDATE_EMAIL");
	public static var FILTER_VALIDATE_FLOAT(get, never) : String; private static inline function get_FILTER_VALIDATE_FLOAT() : String return untyped __php__("FILTER_VALIDATE_FLOAT");
	public static var FILTER_VALIDATE_INT(get, never) : String; private static inline function get_FILTER_VALIDATE_INT() : String return untyped __php__("FILTER_VALIDATE_INT");
	public static var FILTER_VALIDATE_IP(get, never) : String; private static inline function get_FILTER_VALIDATE_IP() : String return untyped __php__("FILTER_VALIDATE_IP");
	public static var FILTER_VALIDATE_MAC(get, never) : String; private static inline function get_FILTER_VALIDATE_MAC() : String return untyped __php__("FILTER_VALIDATE_MAC");
	public static var FILTER_VALIDATE_REGEXP(get, never) : String; private static inline function get_FILTER_VALIDATE_REGEXP() : String return untyped __php__("FILTER_VALIDATE_REGEXP");
	public static var FILTER_VALIDATE_URL(get, never) : String; private static inline function get_FILTER_VALIDATE_URL() : String return untyped __php__("FILTER_VALIDATE_URL");
	
	public static inline function filter_has_var(type:Int, variable_name:String) : Bool return untyped __call__('filter_has_var', type, variable_name);
	
	public static inline function filter_id(filtername:String) : Int return untyped __call__('filter_id', filtername);
	
	public static function filter_input_array(type:Int, ?definition:Dynamic, add_empty=true) : Dynamic
	{
		if (definition == null)
		{
			return untyped __call__('filter_input_array', type);
		}
		else
		{
			return untyped __call__('filter_input_array', type, definition, add_empty);
		}
	}
	
	public static function filter_input(type:Int, variable_name:String, ?filter:Int, ?options:Dynamic) : Dynamic
	{
		if (options == null)
		{
			if (filter == null)
			{
				return untyped __call__('filter_input', type, variable_name);
			}
			else
			{
				return untyped __call__('filter_input', type, variable_name, filter);
			}
		}
		else
		{
			return untyped __call__('filter_input', type, variable_name, filter, options);
		}
	}
	
	public static inline function filter_list() : NativeArray return untyped __call__('filter_list');
	
	public static function filter_var_array(data:NativeArray, ?definition:Dynamic, add_empty=true) : Dynamic
	{
		if (definition == null)
		{
			return untyped __call__('filter_var_array', data);
		}
		else
		{
			return untyped __call__('filter_var_array', data, definition, add_empty);
		}
	}
	
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
}
