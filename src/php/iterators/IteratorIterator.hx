package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.Traversable;

@:native("IteratorIterator")
extern class IteratorIterator implements OuterIterator
{
	function new(iterator:Traversable) : Void;
	function current() : Dynamic;
	function getInnerIterator() : Traversable;
	function key() : Dynamic;
	function next() : Void;
	function rewind() : Void;
	function valid() : Bool;
}
