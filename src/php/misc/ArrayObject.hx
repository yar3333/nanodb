package php.misc;

import haxe.Constraints.Function;
import php.interfaces.ArrayAccess;
import php.interfaces.Countable;
import php.interfaces.IteratorAggregate;
import php.interfaces.Serializable;
import php.iterators.ArrayIterator;

@:native("ArrayObject")
extern class ArrayObject implements IteratorAggregate implements ArrayAccess implements Serializable implements Countable
{
	static var STD_PROP_LIST(default, null) : Int;
	static var ARRAY_AS_PROPS(default, null) : Int;

	function new(?input:Dynamic, ?flags:Int, ?iterator_class:String) : Void;
	function append(value:Dynamic) : Void;
	function asort() : Void;
	function count() : Int;
	function exchangeArray(input:Dynamic) : NativeArray;
	function getArrayCopy() : NativeArray;
	function getFlags() : Int;
	function getIterator() : ArrayIterator;
	function getIteratorClass() : String;
	function ksort() : Void;
	function natcasesort() : Void;
	function natsort() : Void;
	function offsetExists(index:Dynamic) : Bool;
	function offsetGet(index:Dynamic) : Dynamic;
	function offsetSet(index:Dynamic, newval:Dynamic) : Void;
	function offsetUnset(index:Dynamic) : Void;
	function serialize() : String;
	function setFlags(flags:Int) : Void;
	function setIteratorClass(iterator_class:String) : Void;
	function uasort(cmp_function:Function) : Void;
	function uksort(cmp_function:Function) : Void;
	function unserialize(serialized:String) : Dynamic;
}
