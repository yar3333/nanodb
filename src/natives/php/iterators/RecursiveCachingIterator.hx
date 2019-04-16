package php.iterators;

import php.interfaces.Countable;
import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;

@:native("RecursiveCachingIterator")
extern class RecursiveCachingIterator extends CachingIterator implements Countable implements php.interfaces.ArrayAccess implements OuterIterator implements RecursiveIterator
{
	function getChildren() : RecursiveCachingIterator;
	function hasChildren() : Bool;
}
