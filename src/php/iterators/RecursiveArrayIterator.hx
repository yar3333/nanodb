package php.iterators;

import php.interfaces.RecursiveIterator;

@:native("RecursiveArrayIterator")
extern class RecursiveArrayIterator extends ArrayIterator implements RecursiveIterator
{
	function getChildren() : RecursiveArrayIterator;
	function hasChildren() : Bool;
}
