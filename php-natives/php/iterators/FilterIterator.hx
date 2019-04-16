package php.iterators;

@:native("FilterIterator")
extern class FilterIterator extends IteratorIterator implements php.interfaces.OuterIterator
{
	function accept() : Bool;
	function new(iterator:php.interfaces.Iterator) : Void;
}
