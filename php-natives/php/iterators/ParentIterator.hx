package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;

@:native("ParentIterator")
extern class ParentIterator extends RecursiveFilterIterator implements RecursiveIterator implements OuterIterator
{
	function new(iterator:RecursiveIterator) : Void;
}
