package php;

class MbstringNatives
{
	public static function mb_check_encoding(?var_:String, ?encoding:String) : Bool
	{
		if (encoding == null)
		{
			if (var_ == null)
			{
				return untyped __call__('mb_check_encoding');
			}
			else
			{
				return untyped __call__('mb_check_encoding', var_);
			}
		}
		else
		{
			return untyped __call__('mb_check_encoding', var_, encoding);
		}
	}
	
	public static function mb_convert_case(str:String, mode:Int, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_convert_case', str, mode);
		}
		else
		{
			return untyped __call__('mb_convert_case', str, mode, encoding);
		}
	}
	
	public static function mb_convert_encoding(str:String, to_encoding:String, ?from_encoding:Dynamic) : String
	{
		if (from_encoding == null)
		{
			return untyped __call__('mb_convert_encoding', str, to_encoding);
		}
		else
		{
			return untyped __call__('mb_convert_encoding', str, to_encoding, from_encoding);
		}
	}
	
	public static function mb_convert_kana(str:String, option="KV", ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_convert_kana', str, option);
		}
		else
		{
			return untyped __call__('mb_convert_kana', str, option, encoding);
		}
	}
	
	public static function mb_convert_variables(to_encoding:String, from_encoding:Dynamic, vars:Dynamic, ?restArgs:Dynamic) : String
	{
		if (restArgs == null)
		{
			return untyped __call__('mb_convert_variables', to_encoding, from_encoding, vars);
		}
		else
		{
			return untyped __call__('mb_convert_variables', to_encoding, from_encoding, vars, restArgs);
		}
	}
	
	public static inline function mb_decode_mimeheader(str:String) : String return untyped __call__('mb_decode_mimeheader', str);
	
	public static function mb_decode_numericentity(str:String, convmap:NativeArray, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_decode_numericentity', str, convmap);
		}
		else
		{
			return untyped __call__('mb_decode_numericentity', str, convmap, encoding);
		}
	}
	
	public static function mb_detect_encoding(str:String, ?encoding_list:Dynamic, strict=false) : String
	{
		if (encoding_list == null)
		{
			return untyped __call__('mb_detect_encoding', str);
		}
		else
		{
			return untyped __call__('mb_detect_encoding', str, encoding_list, strict);
		}
	}
	
	public static function mb_detect_order(?encoding_list:Dynamic) : Dynamic
	{
		if (encoding_list == null)
		{
			return untyped __call__('mb_detect_order');
		}
		else
		{
			return untyped __call__('mb_detect_order', encoding_list);
		}
	}
	
	public static function mb_encode_mimeheader(str:String, ?charset:String, transfer_encoding="B", linefeed="\r\n", indent=0) : String
	{
		if (charset == null)
		{
			return untyped __call__('mb_encode_mimeheader', str);
		}
		else
		{
			return untyped __call__('mb_encode_mimeheader', str, charset, transfer_encoding, linefeed, indent);
		}
	}
	
	public static function mb_encode_numericentity(str:String, convmap:NativeArray, ?encoding:String, is_hex=false) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_encode_numericentity', str, convmap);
		}
		else
		{
			return untyped __call__('mb_encode_numericentity', str, convmap, encoding, is_hex);
		}
	}
	
	public static inline function mb_encoding_aliases(encoding:String) : NativeArray return untyped __call__('mb_encoding_aliases', encoding);
	
	public static inline function mb_ereg_match(pattern:String, str:String, option="msr") : Bool return untyped __call__('mb_ereg_match', pattern, str, option);
	
	public static inline function mb_ereg_replace_callback(pattern:String, callback:Array<Dynamic>->String, str:String, option="msr") : String return untyped __call__('mb_ereg_replace_callback', pattern, callback, str, option);
	
	public static inline function mb_ereg_replace(pattern:String, replacement:String, str:String, option="msr") : String return untyped __call__('mb_ereg_replace', pattern, replacement, str, option);
	
	public static inline function mb_ereg_search_getpos() : Int return untyped __call__('mb_ereg_search_getpos');
	
	public static inline function mb_ereg_search_getregs() : NativeArray return untyped __call__('mb_ereg_search_getregs');
	
	public static function mb_ereg_search_init(str:String, ?pattern:String, option="msr") : Bool
	{
		if (pattern == null)
		{
			return untyped __call__('mb_ereg_search_init', str);
		}
		else
		{
			return untyped __call__('mb_ereg_search_init', str, pattern, option);
		}
	}
	
	public static function mb_ereg_search_pos(?pattern:String, option="ms") : NativeArray
	{
		if (pattern == null)
		{
			return untyped __call__('mb_ereg_search_pos');
		}
		else
		{
			return untyped __call__('mb_ereg_search_pos', pattern, option);
		}
	}
	
	public static function mb_ereg_search_regs(?pattern:String, option="ms") : NativeArray
	{
		if (pattern == null)
		{
			return untyped __call__('mb_ereg_search_regs');
		}
		else
		{
			return untyped __call__('mb_ereg_search_regs', pattern, option);
		}
	}
	
	public static inline function mb_ereg_search_setpos(position:Int) : Bool return untyped __call__('mb_ereg_search_setpos', position);
	
	public static function mb_ereg_search(?pattern:String, option="ms") : Bool
	{
		if (pattern == null)
		{
			return untyped __call__('mb_ereg_search');
		}
		else
		{
			return untyped __call__('mb_ereg_search', pattern, option);
		}
	}
	
	public static function mb_ereg(pattern:String, str:String, ?regs:NativeArray) : Int
	{
		if (regs == null)
		{
			return untyped __call__('mb_ereg', pattern, str);
		}
		else
		{
			return untyped __call__('mb_ereg', pattern, str, regs);
		}
	}
	
	public static inline function mb_eregi_replace(pattern:String, replace:String, str:String, option="msri") : String return untyped __call__('mb_eregi_replace', pattern, replace, str, option);
	
	public static function mb_eregi(pattern:String, str:String, ?regs:NativeArray) : Int
	{
		if (regs == null)
		{
			return untyped __call__('mb_eregi', pattern, str);
		}
		else
		{
			return untyped __call__('mb_eregi', pattern, str, regs);
		}
	}
	
	public static inline function mb_get_info(type="all") : Dynamic return untyped __call__('mb_get_info', type);
	
	public static inline function mb_http_input(type="") : Dynamic return untyped __call__('mb_http_input', type);
	
	public static function mb_http_output(?encoding:String) : Dynamic
	{
		if (encoding == null)
		{
			return untyped __call__('mb_http_output');
		}
		else
		{
			return untyped __call__('mb_http_output', encoding);
		}
	}
	
	public static function mb_internal_encoding(?encoding:String) : Dynamic
	{
		if (encoding == null)
		{
			return untyped __call__('mb_internal_encoding');
		}
		else
		{
			return untyped __call__('mb_internal_encoding', encoding);
		}
	}
	
	public static function mb_language(?language:String) : Dynamic
	{
		if (language == null)
		{
			return untyped __call__('mb_language');
		}
		else
		{
			return untyped __call__('mb_language', language);
		}
	}
	
	public static inline function mb_list_encodings() : NativeArray return untyped __call__('mb_list_encodings');
	
	public static inline function mb_output_handler(contents:String, status:Int) : String return untyped __call__('mb_output_handler', contents, status);
	
	public static function mb_parse_str(encoded_string:String, ?result:NativeArray) : Bool
	{
		if (result == null)
		{
			return untyped __call__('mb_parse_str', encoded_string);
		}
		else
		{
			return untyped __call__('mb_parse_str', encoded_string, result);
		}
	}
	
	public static inline function mb_preferred_mime_name(encoding:String) : String return untyped __call__('mb_preferred_mime_name', encoding);
	
	public static function mb_regex_encoding(?encoding:String) : Dynamic
	{
		if (encoding == null)
		{
			return untyped __call__('mb_regex_encoding');
		}
		else
		{
			return untyped __call__('mb_regex_encoding', encoding);
		}
	}
	
	public static function mb_regex_set_options(?options:String) : String
	{
		if (options == null)
		{
			return untyped __call__('mb_regex_set_options');
		}
		else
		{
			return untyped __call__('mb_regex_set_options', options);
		}
	}
	
	public static function mb_send_mail(to:String, subject:String, message:String, ?additional_headers:String, ?additional_parameter:String) : Bool
	{
		if (additional_parameter == null)
		{
			if (additional_headers == null)
			{
				return untyped __call__('mb_send_mail', to, subject, message);
			}
			else
			{
				return untyped __call__('mb_send_mail', to, subject, message, additional_headers);
			}
		}
		else
		{
			return untyped __call__('mb_send_mail', to, subject, message, additional_headers, additional_parameter);
		}
	}
	
	public static inline function mb_split(pattern:String, str:String, limit=-1) : NativeArray return untyped __call__('mb_split', pattern, str, limit);
	
	public static function mb_strcut(str:String, start:Int, ?length:Int, ?encoding:String) : String
	{
		if (encoding == null)
		{
			if (length == null)
			{
				return untyped __call__('mb_strcut', str, start);
			}
			else
			{
				return untyped __call__('mb_strcut', str, start, length);
			}
		}
		else
		{
			return untyped __call__('mb_strcut', str, start, length, encoding);
		}
	}
	
	public static function mb_strimwidth(str:String, start:Int, width:Int, trimmarker="", ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strimwidth', str, start, width, trimmarker);
		}
		else
		{
			return untyped __call__('mb_strimwidth', str, start, width, trimmarker, encoding);
		}
	}
	
	public static function mb_stripos(haystack:String, needle:String, offset=0, ?encoding:String) : Int
	{
		if (encoding == null)
		{
			return untyped __call__('mb_stripos', haystack, needle, offset);
		}
		else
		{
			return untyped __call__('mb_stripos', haystack, needle, offset, encoding);
		}
	}
	
	public static function mb_stristr(haystack:String, needle:String, before_needle=false, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_stristr', haystack, needle, before_needle);
		}
		else
		{
			return untyped __call__('mb_stristr', haystack, needle, before_needle, encoding);
		}
	}
	
	public static function mb_strlen(str:String, ?encoding:String) : Dynamic
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strlen', str);
		}
		else
		{
			return untyped __call__('mb_strlen', str, encoding);
		}
	}
	
	public static function mb_strpos(haystack:String, needle:String, offset=0, ?encoding:String) : Int
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strpos', haystack, needle, offset);
		}
		else
		{
			return untyped __call__('mb_strpos', haystack, needle, offset, encoding);
		}
	}
	
	public static function mb_strrchr(haystack:String, needle:String, part=false, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strrchr', haystack, needle, part);
		}
		else
		{
			return untyped __call__('mb_strrchr', haystack, needle, part, encoding);
		}
	}
	
	public static function mb_strrichr(haystack:String, needle:String, part=false, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strrichr', haystack, needle, part);
		}
		else
		{
			return untyped __call__('mb_strrichr', haystack, needle, part, encoding);
		}
	}
	
	public static function mb_strripos(haystack:String, needle:String, offset=0, ?encoding:String) : Int
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strripos', haystack, needle, offset);
		}
		else
		{
			return untyped __call__('mb_strripos', haystack, needle, offset, encoding);
		}
	}
	
	public static inline function mb_strrpos(haystack:String, needle:String, offset=0) : Int return untyped __call__('mb_strrpos', haystack, needle, offset);
	
	public static inline function mb_strrpos_pos(haystack:String, needle:String, offset=0, encoding:String) : Int return untyped __call__('mb_strrpos', haystack, needle, offset, encoding);
	
	public static function mb_strstr(haystack:String, needle:String, before_needle=false, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strstr', haystack, needle, before_needle);
		}
		else
		{
			return untyped __call__('mb_strstr', haystack, needle, before_needle, encoding);
		}
	}
	
	public static function mb_strtolower(str:String, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strtolower', str);
		}
		else
		{
			return untyped __call__('mb_strtolower', str, encoding);
		}
	}
	
	public static function mb_strtoupper(str:String, ?encoding:String) : String
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strtoupper', str);
		}
		else
		{
			return untyped __call__('mb_strtoupper', str, encoding);
		}
	}
	
	public static function mb_strwidth(str:String, ?encoding:String) : Int
	{
		if (encoding == null)
		{
			return untyped __call__('mb_strwidth', str);
		}
		else
		{
			return untyped __call__('mb_strwidth', str, encoding);
		}
	}
	
	public static function mb_substitute_character(?substrchar:Dynamic) : Dynamic
	{
		if (substrchar == null)
		{
			return untyped __call__('mb_substitute_character');
		}
		else
		{
			return untyped __call__('mb_substitute_character', substrchar);
		}
	}
	
	public static function mb_substr_count(haystack:String, needle:String, ?encoding:String) : Int
	{
		if (encoding == null)
		{
			return untyped __call__('mb_substr_count', haystack, needle);
		}
		else
		{
			return untyped __call__('mb_substr_count', haystack, needle, encoding);
		}
	}
	
	public static function mb_substr(str:String, start:Int, ?length:Int, ?encoding:String) : String
	{
		if (encoding == null)
		{
			if (length == null)
			{
				return untyped __call__('mb_substr', str, start);
			}
			else
			{
				return untyped __call__('mb_substr', str, start, length);
			}
		}
		else
		{
			return untyped __call__('mb_substr', str, start, length, encoding);
		}
	}
	
	public static inline function str_split(str:String, split_length=1) : NativeArray return untyped __call__('str_split', str, split_length);
}
