package php.iterators;

import php.interfaces.Countable;
import php.interfaces.SeekableIterator;

@:native("GlobIterator")
extern class GlobIterator extends FilesystemIterator implements SeekableIterator implements Countable
{
	function count() : Int;
}
