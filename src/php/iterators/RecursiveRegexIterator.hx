package php.iterators;

import php.interfaces.RecursiveIterator;

@:native("RecursiveRegexIterator")
extern class RecursiveRegexIterator extends RegexIterator implements RecursiveIterator
{
	function new(iterator:RecursiveIterator, regex:String, ?mode:Int, ?flags:Int, ?preg_flags:Int) : Void;
	function getChildren() : RecursiveRegexIterator;
	function hasChildren() : Bool;
}
