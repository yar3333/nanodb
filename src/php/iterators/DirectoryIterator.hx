package php.iterators;

import php.interfaces.SeekableIterator;

@:native("DirectoryIterator")
extern class DirectoryIterator extends SplFileInfo implements SeekableIterator
{
	function new(path:String) : Void;
	function current() : DirectoryIterator;
	function isDot() : Bool;
	function key() : String;
	function next() : Void;
	function rewind() : Void;
	function seek(position:Int) : Void;
	function valid() : Bool;
}
