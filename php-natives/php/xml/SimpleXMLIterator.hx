package php.xml;

import php.interfaces.Countable;
import php.interfaces.RecursiveIterator;

@:native("SimpleXMLIterator")
extern class SimpleXMLIterator extends SimpleXMLElement implements RecursiveIterator implements Countable
{
	function new(data:String, ?options:Int, ?data_is_url:Bool, ?ns:String, ?is_prefix:Bool) : Void;
	function current() : Dynamic;
	function getChildren() : SimpleXMLIterator;
	function hasChildren() : Bool;
	function key() : Dynamic;
	function next() : Void;
	function rewind() : Void;
	function valid() : Bool;
}
