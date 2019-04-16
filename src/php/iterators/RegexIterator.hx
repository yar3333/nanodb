package php.iterators;

import php.interfaces.Iterator;

@:native("RegexIterator")
extern class RegexIterator extends FilterIterator
{
	static var MATCH(default, null) : Int;
	static var GET_MATCH(default, null) : Int;
	static var ALL_MATCHES(default, null) : Int;
	static var SPLIT(default, null) : Int;
	static var REPLACE(default, null) : Int;
	static var USE_KEY(default, null) : Int;

	function new(iterator:Iterator, regex:String, ?mode:Int, ?flags:Int, ?preg_flags:Int) : Void;
	function getFlags() : Int;
	function getMode() : Int;
	function getPregFlags() : Int;
	function getRegex() : String;
	function setFlags(flags:Int) : Void;
	function setMode(mode:Int) : Void;
	function setPregFlags(preg_flags:Int) : Void;
}
