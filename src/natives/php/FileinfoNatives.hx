package php;

class FileinfoNatives
{
	/**
	 * No special handling. 
	 */
	public static var FILEINFO_NONE(get, never) : Int; private static inline function get_FILEINFO_NONE() : Int return untyped __php__("FILEINFO_NONE");

	/**
	 * Follow symlinks. 
	 */
	public static var FILEINFO_SYMLINK(get, never) : Int; private static inline function get_FILEINFO_SYMLINK() : Int return untyped __php__("FILEINFO_SYMLINK");

	/**
	 * Return the mime type. Available since PHP 5.3.0. 
	 */
	public static var FILEINFO_MIME_TYPE(get, never) : Int; private static inline function get_FILEINFO_MIME_TYPE() : Int return untyped __php__("FILEINFO_MIME_TYPE");

	/**
	 * Return the mime encoding of the file. Available since PHP 5.3.0. 
	 */
	public static var FILEINFO_MIME_ENCODING(get, never) : Int; private static inline function get_FILEINFO_MIME_ENCODING() : Int return untyped __php__("FILEINFO_MIME_ENCODING");

	/**
	 * Return the mime type and mime encoding as defined by RFC 2045. 
	 */
	public static var FILEINFO_MIME(get, never) : Int; private static inline function get_FILEINFO_MIME() : Int return untyped __php__("FILEINFO_MIME");

	/**
	 * Decompress compressed files. Disabled since PHP 5.3.0 due to thread safety issues. 
	 */
	public static var FILEINFO_COMPRESS(get, never) : Int; private static inline function get_FILEINFO_COMPRESS() : Int return untyped __php__("FILEINFO_COMPRESS");

	/**
	 * Look at the contents of blocks or character special devices. 
	 */
	public static var FILEINFO_DEVICES(get, never) : Int; private static inline function get_FILEINFO_DEVICES() : Int return untyped __php__("FILEINFO_DEVICES");

	/**
	 * Return all matches, not just the first. 
	 */
	public static var FILEINFO_CONTINUE(get, never) : Int; private static inline function get_FILEINFO_CONTINUE() : Int return untyped __php__("FILEINFO_CONTINUE");

	/**
	 * If possible preserve the original access time. 
	 */
	public static var FILEINFO_PRESERVE_ATIME(get, never) : Int; private static inline function get_FILEINFO_PRESERVE_ATIME() : Int return untyped __php__("FILEINFO_PRESERVE_ATIME");

	/**
	 * Don't translate unprintable characters to a \ooo octal representation. 
	 */
	public static var FILEINFO_RAW(get, never) : Int; private static inline function get_FILEINFO_RAW() : Int return untyped __php__("FILEINFO_RAW");
	
	public static function scandir(directory:String, ?sorting_order:Int, ?context:Resource) : NativeArray
	{
		if (context == null)
		{
			if (sorting_order == null)
			{
				return untyped __call__('scandir', directory);
			}
			else
			{
				return untyped __call__('scandir', directory, sorting_order);
			}
		}
		else
		{
			return untyped __call__('scandir', directory, sorting_order, context);
		}
	}
	
	public static function finfo_buffer(finfo:Resource, ?str:String, ?options:Int, ?context:Resource) : String
	{
		if (context == null)
		{
			if (options == null)
			{
				return untyped __call__('finfo_buffer', finfo, str);
			}
			else
			{
				return untyped __call__('finfo_buffer', finfo, str, options);
			}
		}
		else
		{
			return untyped __call__('finfo_buffer', finfo, str, options, context);
		}
	}
	
	public static inline function finfo_close(finfo:Resource) : Bool return untyped __call__('finfo_close', finfo);
	
	public static function finfo_file(finfo:Resource, ?file_name:String, ?options:Int, ?context:Resource) : String
	{
		if (context == null)
		{
			if (options == null)
			{
				return untyped __call__('finfo_file', finfo, file_name);
			}
			else
			{
				return untyped __call__('finfo_file', finfo, file_name, options);
			}
		}
		else
		{
			return untyped __call__('finfo_file', finfo, file_name, options, context);
		}
	}
	
	public static function finfo_open(?options:Int, ?magic_file:String) : Resource
	{
		if (magic_file == null)
		{
			if (options == null)
			{
				return untyped __call__('finfo_open');
			}
			else
			{
				return untyped __call__('finfo_open', options);
			}
		}
		else
		{
			return untyped __call__('finfo_open', options, magic_file);
		}
	}
	
	public static inline function finfo_set_flags(finfo:Resource, options:Int) : Bool return untyped __call__('finfo_set_flags', finfo, options);
	
	public static inline function mime_content_type(filename:String) : String return untyped __call__('mime_content_type', filename);
}
