package php;

class FilesystemNatives
{
	public static var SEEK_SET(get, never) : Int; private static inline function get_SEEK_SET() : Int return untyped __php__("SEEK_SET");
	public static var SEEK_CUR(get, never) : Int; private static inline function get_SEEK_CUR() : Int return untyped __php__("SEEK_CUR");
	public static var SEEK_END(get, never) : Int; private static inline function get_SEEK_END() : Int return untyped __php__("SEEK_END");
	public static var LOCK_SH(get, never) : Int; private static inline function get_LOCK_SH() : Int return untyped __php__("LOCK_SH");
	public static var LOCK_EX(get, never) : Int; private static inline function get_LOCK_EX() : Int return untyped __php__("LOCK_EX");
	public static var LOCK_UN(get, never) : Int; private static inline function get_LOCK_UN() : Int return untyped __php__("LOCK_UN");
	public static var LOCK_NB(get, never) : Int; private static inline function get_LOCK_NB() : Int return untyped __php__("LOCK_NB");
	public static var GLOB_BRACE(get, never) : Int; private static inline function get_GLOB_BRACE() : Int return untyped __php__("GLOB_BRACE");
	public static var GLOB_ONLYDIR(get, never) : Int; private static inline function get_GLOB_ONLYDIR() : Int return untyped __php__("GLOB_ONLYDIR");
	public static var GLOB_MARK(get, never) : Int; private static inline function get_GLOB_MARK() : Int return untyped __php__("GLOB_MARK");
	public static var GLOB_NOSORT(get, never) : Int; private static inline function get_GLOB_NOSORT() : Int return untyped __php__("GLOB_NOSORT");
	public static var GLOB_NOCHECK(get, never) : Int; private static inline function get_GLOB_NOCHECK() : Int return untyped __php__("GLOB_NOCHECK");
	public static var GLOB_NOESCAPE(get, never) : Int; private static inline function get_GLOB_NOESCAPE() : Int return untyped __php__("GLOB_NOESCAPE");
	public static var GLOB_AVAILABLE_FLAGS(get, never) : Int; private static inline function get_GLOB_AVAILABLE_FLAGS() : Int return untyped __php__("GLOB_AVAILABLE_FLAGS");
	public static var PATHINFO_DIRNAME(get, never) : Int; private static inline function get_PATHINFO_DIRNAME() : Int return untyped __php__("PATHINFO_DIRNAME");
	public static var PATHINFO_BASENAME(get, never) : Int; private static inline function get_PATHINFO_BASENAME() : Int return untyped __php__("PATHINFO_BASENAME");
	public static var PATHINFO_EXTENSION(get, never) : Int; private static inline function get_PATHINFO_EXTENSION() : Int return untyped __php__("PATHINFO_EXTENSION");

	/**
	 * Since PHP 5.2.0. 
	 */
	public static var PATHINFO_FILENAME(get, never) : Int; private static inline function get_PATHINFO_FILENAME() : Int return untyped __php__("PATHINFO_FILENAME");

	/**
	 * Search for filename in include_path (since PHP 5). 
	 */
	public static var FILE_USE_INCLUDE_PATH(get, never) : Int; private static inline function get_FILE_USE_INCLUDE_PATH() : Int return untyped __php__("FILE_USE_INCLUDE_PATH");
	
	public static var FILE_NO_DEFAULT_CONTEXT(get, never) : Int; private static inline function get_FILE_NO_DEFAULT_CONTEXT() : Int return untyped __php__("FILE_NO_DEFAULT_CONTEXT");

	/**
	 * Append content to existing file. 
	 */
	public static var FILE_APPEND(get, never) : Int; private static inline function get_FILE_APPEND() : Int return untyped __php__("FILE_APPEND");

	/**
	 * Strip EOL characters (since PHP 5). 
	 */
	public static var FILE_IGNORE_NEW_LINES(get, never) : Int; private static inline function get_FILE_IGNORE_NEW_LINES() : Int return untyped __php__("FILE_IGNORE_NEW_LINES");

	/**
	 * Skip empty lines (since PHP 5). 
	 */
	public static var FILE_SKIP_EMPTY_LINES(get, never) : Int; private static inline function get_FILE_SKIP_EMPTY_LINES() : Int return untyped __php__("FILE_SKIP_EMPTY_LINES");

	/**
	 * Binary mode (since PHP 5.2.7).
	 */
	public static var FILE_BINARY(get, never) : Int; private static inline function get_FILE_BINARY() : Int return untyped __php__("FILE_BINARY");

	/**
	 * Text mode (since PHP 5.2.7).
	 */
	public static var FILE_TEXT(get, never) : Int; private static inline function get_FILE_TEXT() : Int return untyped __php__("FILE_TEXT");

	/**
	 * Normal INI scanner mode (since PHP 5.3). 
	 */
	public static var INI_SCANNER_NORMAL(get, never) : Int; private static inline function get_INI_SCANNER_NORMAL() : Int return untyped __php__("INI_SCANNER_NORMAL");

	/**
	 * Raw INI scanner mode (since PHP 5.3). 
	 */
	public static var INI_SCANNER_RAW(get, never) : Int; private static inline function get_INI_SCANNER_RAW() : Int return untyped __php__("INI_SCANNER_RAW");

	/**
	 * Typed INI scanner mode (since PHP 5.6.1). 
	 */
	public static var INI_SCANNER_TYPED(get, never) : Int; private static inline function get_INI_SCANNER_TYPED() : Int return untyped __php__("INI_SCANNER_TYPED");

	/**
	 * Disable backslash escaping. 
	 */
	public static var FNM_NOESCAPE(get, never) : Int; private static inline function get_FNM_NOESCAPE() : Int return untyped __php__("FNM_NOESCAPE");

	/**
	 * Slash in string only matches slash in the given pattern. 
	 */
	public static var FNM_PATHNAME(get, never) : Int; private static inline function get_FNM_PATHNAME() : Int return untyped __php__("FNM_PATHNAME");

	/**
	 * Leading period in string must be exactly matched by period in the given pattern. 
	 */
	public static var FNM_PERIOD(get, never) : Int; private static inline function get_FNM_PERIOD() : Int return untyped __php__("FNM_PERIOD");

	/**
	 * Caseless match. Part of the GNU extension. 
	 */
	public static var FNM_CASEFOLD(get, never) : Int; private static inline function get_FNM_CASEFOLD() : Int return untyped __php__("FNM_CASEFOLD");
	
	
	public static function basename(path:String, ?suffix:String) : String
	{
		if (suffix == null)
		{
			return untyped __call__('basename', path);
		}
		else
		{
			return untyped __call__('basename', path, suffix);
		}
	}
	
	public static inline function chgrp(filename:String, group:Dynamic) : Bool return untyped __call__('chgrp', filename, group);
	
	public static inline function chmod(filename:String, mode:Int) : Bool return untyped __call__('chmod', filename, mode);
	
	public static inline function chown(filename:String, user:Dynamic) : Bool return untyped __call__('chown', filename, user);
	
	public static function clearstatcache(clear_realpath_cache=false, ?filename:String) : Void
	{
		if (filename == null)
		{
			untyped __call__('clearstatcache', clear_realpath_cache);
		}
		else
		{
			untyped __call__('clearstatcache', clear_realpath_cache, filename);
		}
	}
	
	public static function copy(source:String, dest:String, ?context:Resource) : Bool
	{
		if (context == null)
		{
			return untyped __call__('copy', source, dest);
		}
		else
		{
			return untyped __call__('copy', source, dest, context);
		}
	}
	
	public static inline function dirname(path:String, levels=1) : String return untyped __call__('dirname', path, levels);
	
	public static inline function disk_free_space(directory:String) : Float return untyped __call__('disk_free_space', directory);
	
	public static inline function disk_total_space(directory:String) : Float return untyped __call__('disk_total_space', directory);
	
	public static inline function fclose(handle:Resource) : Bool return untyped __call__('fclose', handle);
	
	public static inline function feof(handle:Resource) : Bool return untyped __call__('feof', handle);
	
	public static inline function fflush(handle:Resource) : Bool return untyped __call__('fflush', handle);
	
	public static inline function fgetc(handle:Resource) : String return untyped __call__('fgetc', handle);
	
	public static inline function fgetcsv(handle:Resource, length=0, delimiter=",", enclosure='"', escape="\\") : NativeArray return untyped __call__('fgetcsv', handle, length, delimiter, enclosure, escape);
	
	public static function fgets(handle:Resource, ?length:Int) : String
	{
		if (length == null)
		{
			return untyped __call__('fgets', handle);
		}
		else
		{
			return untyped __call__('fgets', handle, length);
		}
	}
	
	public static function fgetss(handle:Resource, ?length:Int, ?allowable_tags:String) : String
	{
		if (allowable_tags == null)
		{
			if (length == null)
			{
				return untyped __call__('fgetss', handle);
			}
			else
			{
				return untyped __call__('fgetss', handle, length);
			}
		}
		else
		{
			return untyped __call__('fgetss', handle, length, allowable_tags);
		}
	}
	
	public static inline function file_exists(filename:String) : Bool return untyped __call__('file_exists', filename);
	
	public static function file_get_contents(filename:String, use_include_path=false, ?context:Resource, offset=0, ?maxlen:Int) : String
	{
		if (maxlen == null)
		{
			if (context == null)
			{
				return untyped __call__('file_get_contents', filename, use_include_path);
			}
			else
			{
				return untyped __call__('file_get_contents', filename, use_include_path, context, offset);
			}
		}
		else
		{
			return untyped __call__('file_get_contents', filename, use_include_path, context, offset, maxlen);
		}
	}
	
	public static function file_put_contents(filename:String, data:Dynamic, flags=0, ?context:Resource) : Int
	{
		if (context == null)
		{
			return untyped __call__('file_put_contents', filename, data, flags);
		}
		else
		{
			return untyped __call__('file_put_contents', filename, data, flags, context);
		}
	}
	
	public static function file(filename:String, flags=0, ?context:Resource) : NativeArray
	{
		if (context == null)
		{
			return untyped __call__('file', filename, flags);
		}
		else
		{
			return untyped __call__('file', filename, flags, context);
		}
	}
	
	public static inline function fileatime(filename:String) : Int return untyped __call__('fileatime', filename);
	
	public static inline function filectime(filename:String) : Int return untyped __call__('filectime', filename);
	
	public static inline function filegroup(filename:String) : Int return untyped __call__('filegroup', filename);
	
	public static inline function fileinode(filename:String) : Int return untyped __call__('fileinode', filename);
	
	public static inline function filemtime(filename:String) : Int return untyped __call__('filemtime', filename);
	
	public static inline function fileowner(filename:String) : Int return untyped __call__('fileowner', filename);
	
	public static inline function fileperms(filename:String) : Int return untyped __call__('fileperms', filename);
	
	public static inline function filesize(filename:String) : Int return untyped __call__('filesize', filename);
	
	public static inline function filetype(filename:String) : String return untyped __call__('filetype', filename);
	
	public static function flock(handle:Resource, operation:Int, ?wouldblock:Int) : Bool
	{
		if (wouldblock == null)
		{
			return untyped __call__('flock', handle, operation);
		}
		else
		{
			return untyped __call__('flock', handle, operation, wouldblock);
		}
	}
	
	public static inline function fnmatch(pattern:String, str:String, flags=0) : Bool return untyped __call__('fnmatch', pattern, str, flags);
	
	public static function fopen(filename:String, mode:String, use_include_path=false, ?context:Resource) : Resource
	{
		if (context == null)
		{
			return untyped __call__('fopen', filename, mode, use_include_path);
		}
		else
		{
			return untyped __call__('fopen', filename, mode, use_include_path, context);
		}
	}
	
	public static inline function fpassthru(handle:Resource) : Int return untyped __call__('fpassthru', handle);
	
	public static inline function fputcsv(handle:Resource, fields:NativeArray, delimiter=", ", enclosure='"', escape_char="\\") : Int return untyped __call__('fputcsv', handle, fields, delimiter, enclosure, escape_char);
	
	public static inline function fread(handle:Resource, length:Int) : String return untyped __call__('fread', handle, length);
	
	public static function fscanf(handle:Resource, format:String, ?restArgs:Dynamic) : Dynamic
	{
		if (restArgs == null)
		{
			return untyped __call__('fscanf', handle, format);
		}
		else
		{
			return untyped __call__('fscanf', handle, format, restArgs);
		}
	}
	
	public static function fseek(handle:Resource, offset:Int, ?whence:Int) : Int
	{
		if (whence == null)
		{
			return untyped __call__('fseek', handle, offset);
		}
		else
		{
			return untyped __call__('fseek', handle, offset, whence);
		}
	}
	
	public static inline function fstat(handle:Resource) : NativeArray return untyped __call__('fstat', handle);
	
	public static inline function ftell(handle:Resource) : Int return untyped __call__('ftell', handle);
	
	public static inline function ftruncate(handle:Resource, size:Int) : Bool return untyped __call__('ftruncate', handle, size);
	
	public static function fwrite(handle:Resource, str:String, ?length:Int) : Int
	{
		if (length == null)
		{
			return untyped __call__('fwrite', handle, str);
		}
		else
		{
			return untyped __call__('fwrite', handle, str, length);
		}
	}
	
	public static inline function glob(pattern:String, flags=0) : NativeArray return untyped __call__('glob', pattern, flags);
	
	public static inline function is_dir(filename:String) : Bool return untyped __call__('is_dir', filename);
	
	public static inline function is_executable(filename:String) : Bool return untyped __call__('is_executable', filename);
	
	public static inline function is_file(filename:String) : Bool return untyped __call__('is_file', filename);
	
	public static inline function is_link(filename:String) : Bool return untyped __call__('is_link', filename);
	
	public static inline function is_readable(filename:String) : Bool return untyped __call__('is_readable', filename);
	
	public static inline function is_uploaded_file(filename:String) : Bool return untyped __call__('is_uploaded_file', filename);
	
	public static inline function is_writable(filename:String) : Bool return untyped __call__('is_writable', filename);
	
	public static inline function lchgrp(filename:String, group:Dynamic) : Bool return untyped __call__('lchgrp', filename, group);
	
	public static inline function lchown(filename:String, user:Dynamic) : Bool return untyped __call__('lchown', filename, user);
	
	public static inline function link(target:String, link:String) : Bool return untyped __call__('link', target, link);
	
	public static inline function linkinfo(path:String) : Int return untyped __call__('linkinfo', path);
	
	public static inline function lstat(filename:String) : NativeArray return untyped __call__('lstat', filename);
	
	public static function mkdir(pathname:String, mode=0x1FF, recursive=false, ?context:Resource) : Bool
	{
		if (context == null)
		{
			return untyped __call__('mkdir', pathname, mode, recursive);
		}
		else
		{
			return untyped __call__('mkdir', pathname, mode, recursive, context);
		}
	}
	
	public static inline function move_uploaded_file(filename:String, destination:String) : Bool return untyped __call__('move_uploaded_file', filename, destination);
	
	public static function parse_ini_file(filename:String, process_sections=false, ?scanner_mode:Int) : NativeArray
	{
		if (scanner_mode == null)
		{
			return untyped __call__('parse_ini_file', filename, process_sections);
		}
		else
		{
			return untyped __call__('parse_ini_file', filename, process_sections, scanner_mode);
		}
	}
	
	public static function parse_ini_string(ini:String, process_sections=false, ?scanner_mode:Int) : NativeArray
	{
		if (scanner_mode == null)
		{
			return untyped __call__('parse_ini_string', ini, process_sections);
		}
		else
		{
			return untyped __call__('parse_ini_string', ini, process_sections, scanner_mode);
		}
	}
	
	public static function pathinfo(path:String, ?options:Int) : Dynamic
	{
		if (options == null)
		{
			return untyped __call__('pathinfo', path);
		}
		else
		{
			return untyped __call__('pathinfo', path, options);
		}
	}
	
	public static inline function pclose(handle:Resource) : Int return untyped __call__('pclose', handle);
	
	public static inline function popen(command:String, mode:String) : Resource return untyped __call__('popen', command, mode);
	
	public static function readfile(filename:String, use_include_path=false, ?context:Resource) : Int
	{
		if (context == null)
		{
			return untyped __call__('readfile', filename, use_include_path);
		}
		else
		{
			return untyped __call__('readfile', filename, use_include_path, context);
		}
	}
	
	public static inline function readlink(path:String) : String return untyped __call__('readlink', path);
	
	public static inline function realpath_cache_get() : NativeArray return untyped __call__('realpath_cache_get');
	
	public static inline function realpath_cache_size() : Int return untyped __call__('realpath_cache_size');
	
	public static inline function realpath(path:String) : String return untyped __call__('realpath', path);
	
	public static function rename(oldname:String, newname:String, ?context:Resource) : Bool
	{
		if (context == null)
		{
			return untyped __call__('rename', oldname, newname);
		}
		else
		{
			return untyped __call__('rename', oldname, newname, context);
		}
	}
	
	public static inline function rewind(handle:Resource) : Bool return untyped __call__('rewind', handle);
	
	public static function rmdir(dirname:String, ?context:Resource) : Bool
	{
		if (context == null)
		{
			return untyped __call__('rmdir', dirname);
		}
		else
		{
			return untyped __call__('rmdir', dirname, context);
		}
	}
	
	public static inline function stat(filename:String) : NativeArray return untyped __call__('stat', filename);
	
	public static inline function symlink(target:String, link:String) : Bool return untyped __call__('symlink', target, link);
	
	public static inline function tempnam(dir:String, prefix:String) : String return untyped __call__('tempnam', dir, prefix);
	
	public static inline function tmpfile() : Resource return untyped __call__('tmpfile');
	
	public static function touch(filename:String, ?time:Int, ?atime:Int) : Bool
	{
		if (atime == null)
		{
			if (time == null)
			{
				return untyped __call__('touch', filename);
			}
			else
			{
				return untyped __call__('touch', filename, time);
			}
		}
		else
		{
			return untyped __call__('touch', filename, time, atime);
		}
	}
	
	public static function umask(?mask:Int) : Int
	{
		if (mask == null)
		{
			return untyped __call__('umask');
		}
		else
		{
			return untyped __call__('umask', mask);
		}
	}
	
	public static function unlink(filename:String, ?context:Resource) : Bool
	{
		if (context == null)
		{
			return untyped __call__('unlink', filename);
		}
		else
		{
			return untyped __call__('unlink', filename, context);
		}
	}
}
