package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;

@:native("RecursiveCallbackFilterIterator")
extern class RecursiveCallbackFilterIterator extends CallbackFilterIterator implements OuterIterator implements RecursiveIterator
{
	function new(iterator:RecursiveIterator, callback:String) : Void;
	function getChildren() : RecursiveCallbackFilterIterator;
	function hasChildren() : Bool;
}
