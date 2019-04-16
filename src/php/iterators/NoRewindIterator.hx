package php.iterators;

import php.interfaces.Iterator;
import php.interfaces.Traversable;

@:native("NoRewindIterator")
extern class NoRewindIterator extends IteratorIterator
{
	function new(iterator:Traversable) : Void;
}
