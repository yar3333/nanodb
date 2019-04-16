package php.iterators;

import php.interfaces.OuterIterator;

@:native("LimitIterator")
extern class LimitIterator extends IteratorIterator implements OuterIterator
{
	function new(iterator:php.interfaces.Iterator, ?offset:Int, ?count:Int) : Void;
	function getPosition() : Int;
	function seek(position:Int) : Int;
}
