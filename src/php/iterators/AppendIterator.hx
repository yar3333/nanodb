package php.iterators;

import php.interfaces.Iterator;
import php.interfaces.OuterIterator;
import php.interfaces.Traversable;

@:native("AppendIterator")
extern class AppendIterator extends IteratorIterator implements OuterIterator
{
	function new(?iterator:Traversable) : Void;
	function append(iterator:Iterator) : Void;
	function getArrayIterator() : Void;
	function getIteratorIndex() : Int;
}
