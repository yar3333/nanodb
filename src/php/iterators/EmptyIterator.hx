package php.iterators;

@:native("EmptyIterator")
extern class EmptyIterator implements php.interfaces.Iterator
{
	function current() : Dynamic;
	function key() : Dynamic;
	function next() : Void;
	function rewind() : Void;
	function valid() : Bool;
}
