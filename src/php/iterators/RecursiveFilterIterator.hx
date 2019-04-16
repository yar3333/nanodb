package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;

@:native("RecursiveFilterIterator")
extern class RecursiveFilterIterator extends FilterIterator implements OuterIterator implements RecursiveIterator
{
	function new(iterator:php.interfaces.Iterator) : Void;
	function getChildren() : RecursiveFilterIterator;
	function hasChildren() : Bool;
}
