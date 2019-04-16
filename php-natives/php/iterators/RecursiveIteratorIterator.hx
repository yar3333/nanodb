package php.iterators;

import php.interfaces.Iterator;
import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;
import php.interfaces.Traversable;

@:native("RecursiveIteratorIterator")
extern class RecursiveIteratorIterator implements OuterIterator
{
	static var LEAVES_ONLY(default, null) : Int;
	static var SELF_FIRST(default, null) : Int;
	static var CHILD_FIRST(default, null) : Int;
	static var CATCH_GET_CHILD(default, null) : Int;

	function beginChildren() : Void;
	function beginIteration() : Void;
	function callGetChildren() : RecursiveIterator;
	function callHasChildren() : Bool;
	function new(iterator:Traversable, ?mode:Int, ?flags:Int) : Void;
	function current() : Dynamic;
	function endChildren() : Void;
	function endIteration() : Void;
	function getDepth() : Int;
	function getInnerIterator() : Iterator;
	function getMaxDepth() : Dynamic;
	function getSubIterator(?level:Int) : RecursiveIterator;
	function key() : Dynamic;
	function next() : Void;
	function nextElement() : Void;
	function rewind() : Void;
	function setMaxDepth(?max_depth:String) : Void;
	function valid() : Bool;
}
