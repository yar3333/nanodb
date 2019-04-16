package php.files;

import php.interfaces.RecursiveIterator;
import php.interfaces.SeekableIterator;

@:native("SplTempFileObject")
extern class SplTempFileObject extends SplFileObject implements SeekableIterator implements RecursiveIterator
{
	function new(?max_memory:Int) : Void;
}
