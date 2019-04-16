package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.Traversable;

@:native("InfiniteIterator")
extern class InfiniteIterator extends IteratorIterator implements OuterIterator
{
}
