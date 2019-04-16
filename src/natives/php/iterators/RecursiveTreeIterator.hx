package php.iterators;

import php.interfaces.OuterIterator;
import php.interfaces.RecursiveIterator;
import php.interfaces.Traversable;

@:native("RecursiveTreeIterator")
extern class RecursiveTreeIterator extends RecursiveIteratorIterator implements OuterIterator
{
	static var BYPASS_CURRENT(default, null) : Int;
	static var BYPASS_KEY(default, null) : Int;
	static var PREFIX_LEFT(default, null) : Int;
	static var PREFIX_MID_HAS_NEXT(default, null) : Int;
	static var PREFIX_MID_LAST(default, null) : Int;
	static var PREFIX_END_HAS_NEXT(default, null) : Int;
	static var PREFIX_END_LAST(default, null) : Int;
	static var PREFIX_RIGHT(default, null) : Int;

	function new(it:Traversable, ?flags:Int, ?cit_flags:Int, ?mode:Int) : Void;
	function getEntry() : String;
	function getPostfix() : Void;
	function getPrefix() : String;
	function setPrefixPart(part:Int, value:String) : Void;
}
