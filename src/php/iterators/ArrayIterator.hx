package php.iterators;

import php.interfaces.Countable;
import php.interfaces.SeekableIterator;
import php.interfaces.Serializable;
import php.interfaces.Traversable;
import php.interfaces.ArrayAccess;

@:native("ArrayIterator")
extern class ArrayIterator implements ArrayAccess implements SeekableIterator implements Countable implements Serializable
{
	function append(value:Dynamic) : Void;
	function asort() : Void;
	function new(arr:Dynamic, ?flags:Int) : Void;
	function count() : Int;
	function current() : Dynamic;
	function getArrayCopy() : NativeArray;
	function getFlags() : Void;
	function key() : Dynamic;
	function ksort() : Void;
	function natcasesort() : Void;
	function natsort() : Void;
	function next() : Void;
	function offsetExists(index:Dynamic) : Bool;
	function offsetGet(index:Dynamic) : Dynamic;
	function offsetSet(index:Dynamic, newval:Dynamic) : Void;
	function offsetUnset(index:Dynamic) : Void;
	function rewind() : Void;
	function seek(position:Int) : Void;
	function serialize() : String;
	function setFlags(flags:String) : Void;
	function uasort(cmp_function:String) : Void;
	function uksort(cmp_function:String) : Void;
	function unserialize(serialized:String) : Dynamic;
	function valid() : Bool;
}
