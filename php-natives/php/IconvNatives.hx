package php;

class IconvNatives
{
	public static inline function textdomain(text_domain:String) : String return untyped __call__('textdomain', text_domain);
	
	public static inline function iconv_get_encoding(type="all") : Dynamic return untyped __call__('iconv_get_encoding', type);
	
	public static function iconv_mime_decode_headers(encoded_headers:String, mode=0, ?charset:String) : NativeArray
	{
		if (charset == null)
		{
			return untyped __call__('iconv_mime_decode_headers', encoded_headers, mode);
		}
		else
		{
			return untyped __call__('iconv_mime_decode_headers', encoded_headers, mode, charset);
		}
	}
	
	public static function iconv_mime_decode(encoded_header:String, mode=0, ?charset:String) : String
	{
		if (charset == null)
		{
			return untyped __call__('iconv_mime_decode', encoded_header, mode);
		}
		else
		{
			return untyped __call__('iconv_mime_decode', encoded_header, mode, charset);
		}
	}
	
	public static function iconv_mime_encode(field_name:String, field_value:String, ?preferences:NativeArray) : String
	{
		if (preferences == null)
		{
			return untyped __call__('iconv_mime_encode', field_name, field_value);
		}
		else
		{
			return untyped __call__('iconv_mime_encode', field_name, field_value, preferences);
		}
	}
	
	public static inline function iconv_set_encoding(type:String, charset:String) : Bool return untyped __call__('iconv_set_encoding', type, charset);
	
	public static function iconv_strlen(str:String, ?charset:String) : Int
	{
		if (charset == null)
		{
			return untyped __call__('iconv_strlen', str);
		}
		else
		{
			return untyped __call__('iconv_strlen', str, charset);
		}
	}
	
	public static function iconv_strpos(haystack:String, needle:String, offset=0, ?charset:String) : Int
	{
		if (charset == null)
		{
			return untyped __call__('iconv_strpos', haystack, needle, offset);
		}
		else
		{
			return untyped __call__('iconv_strpos', haystack, needle, offset, charset);
		}
	}
	
	public static function iconv_strrpos(haystack:String, needle:String, ?charset:String) : Int
	{
		if (charset == null)
		{
			return untyped __call__('iconv_strrpos', haystack, needle);
		}
		else
		{
			return untyped __call__('iconv_strrpos', haystack, needle, charset);
		}
	}
	
	public static function iconv_substr(str:String, offset:Int, ?length:Int, ?charset:String) : String
	{
		if (charset == null)
		{
			if (length == null)
			{
				return untyped __call__('iconv_substr', str, offset);
			}
			else
			{
				return untyped __call__('iconv_substr', str, offset, length);
			}
		}
		else
		{
			return untyped __call__('iconv_substr', str, offset, length, charset);
		}
	}
	
	public static inline function iconv(in_charset:String, out_charset:String, str:String) : String return untyped __call__('@iconv', in_charset, out_charset, str);
	
	public static inline function ob_iconv_handler(contents:String, status:Int) : String return untyped __call__('ob_iconv_handler', contents, status);
}
