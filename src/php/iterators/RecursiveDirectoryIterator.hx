package php.iterators;
import php.interfaces.RecursiveIterator;
import php.interfaces.SeekableIterator;

@:native("RecursiveDirectoryIterator")
extern class RecursiveDirectoryIterator extends FilesystemIterator implements SeekableIterator implements RecursiveIterator
{
	function new(path:String, ?flags:Int) : Void;
	function getChildren() : Dynamic;
	function getSubPath() : String;
	function getSubPathname() : String;
	function hasChildren(/*?allow_links:Bool*/) : Bool;
}
