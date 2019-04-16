package php.iterators;

import php.interfaces.SeekableIterator;

@:native("FilesystemIterator")
extern class FilesystemIterator extends DirectoryIterator implements SeekableIterator
{
	static var CURRENT_AS_PATHNAME(default, null) : Int;
	static var CURRENT_AS_FILEINFO(default, null) : Int;
	static var CURRENT_AS_SELF(default, null) : Int;
	static var CURRENT_MODE_MASK(default, null) : Int;
	static var KEY_AS_PATHNAME(default, null) : Int;
	static var KEY_AS_FILENAME(default, null) : Int;
	static var FOLLOW_SYMLINKS(default, null) : Int;
	static var KEY_MODE_MASK(default, null) : Int;
	static var NEW_CURRENT_AND_KEY(default, null) : Int;
	static var SKIP_DOTS(default, null) : Int;
	static var UNIX_PATHS(default, null) : Int;

	function new(path:String, ?flags:Int) : Void;
	function getFlags() : Int;
	function setFlags(?flags:Int) : Void;
}
