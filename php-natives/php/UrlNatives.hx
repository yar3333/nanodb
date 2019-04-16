package php;

class UrlNatives
{
	public static inline function base64_decode(data:String, strict=false) : String return untyped __call__('base64_decode', data, strict);
	
	public static inline function base64_encode(data:String) : String return untyped __call__('base64_encode', data);
	
	public static inline function get_headers(url:String, format=0) : NativeArray return untyped __call__('get_headers', url, format);
	
	public static inline function get_meta_tags(filename:String, use_include_path=false) : NativeArray return untyped __call__('get_meta_tags', filename, use_include_path);
	
	public static function http_build_query(query_data:Dynamic, ?numeric_prefix:String, ?arg_separator:String, ?enc_type:Int) : String
	{
		if (enc_type == null)
		{
			if (arg_separator == null)
			{
				if (numeric_prefix == null)
				{
					return untyped __call__('http_build_query', query_data);
				}
				else
				{
					return untyped __call__('http_build_query', query_data, numeric_prefix);
				}
			}
			else
			{
				return untyped __call__('http_build_query', query_data, numeric_prefix, arg_separator);
			}
		}
		else
		{
			return untyped __call__('http_build_query', query_data, numeric_prefix, arg_separator, enc_type);
		}
	}
	
	public static inline function parse_url(url:String, component=-1) : Dynamic return untyped __call__('parse_url', url, component);
	
	public static inline function rawurldecode(str:String) : String return untyped __call__('rawurldecode', str);
	
	public static inline function rawurlencode(str:String) : String return untyped __call__('rawurlencode', str);
	
	public static inline function urldecode(str:String) : String return untyped __call__('urldecode', str);
	
	public static inline function urlencode(str:String) : String return untyped __call__('urlencode', str);
}
