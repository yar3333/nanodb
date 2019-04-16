package php.iterators;

import php.interfaces.Iterator;

@:native("MultipleIterator")
extern class MultipleIterator implements Iterator
{
	static var MIT_NEED_ANY(default, null) : Int;
	static var MIT_NEED_ALL(default, null) : Int;
	static var MIT_KEYS_NUMERIC(default, null) : Int;
	static var MIT_KEYS_ASSOC(default, null) : Int;

	function new(?flags:Int) : Void;
	function attachIterator(iterator:Iterator, ?infos:String) : Void;
	function containsIterator(iterator:Iterator) : Bool;
	function countIterators() : Int;
	function current() : NativeArray;
	function detachIterator(iterator:Iterator) : Void;
	function getFlags() : Int;
	function key() : NativeArray;
	function next() : Void;
	function rewind() : Void;
	function setFlags(flags:Int) : Void;
	function valid() : Bool;
}
