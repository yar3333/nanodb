package php.iterators;

import haxe.Constraints.Function;
import php.interfaces.OuterIterator;

@:native("CallbackFilterIterator")
extern class CallbackFilterIterator extends FilterIterator implements OuterIterator
{
	function new(iterator:php.interfaces.Iterator, ?callback:Function) : Void;
}
