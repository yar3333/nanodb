package php.iterators;

@:native("CachingIterator")
extern class CachingIterator extends IteratorIterator implements php.interfaces.OuterIterator implements php.interfaces.ArrayAccess implements php.interfaces.Countable
{
	static var CALL_TOSTRING(default, null) : Int;
	static var CATCH_GET_CHILD(default, null) : Int;
	static var TOSTRING_USE_KEY(default, null) : Int;
	static var TOSTRING_USE_CURRENT(default, null) : Int;
	static var TOSTRING_USE_INNER(default, null) : Int;
	static var FULL_CACHE(default, null) : Int;

	function new(iterator:php.interfaces.Iterator, ?flags:Int) : Void;
	function count() : Int;
	function getCache() : NativeArray;
	function getFlags() : Int;
	function hasNext() : Void;
	function offsetExists(index:String) : Bool;
	function offsetGet(index:String) : Int;
	function offsetSet(index:String, newval:String) : Void;
	function offsetUnset(index:String) : Void;
	function setFlags(flags:Int) : Void;
	function __toString() : Void;
}
