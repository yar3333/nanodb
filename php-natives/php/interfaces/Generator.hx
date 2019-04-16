package php.interfaces;

@:native("Generator")
extern class Generator implements php.interfaces.Iterator
{
	function current() : Dynamic;
	function getReturn() : Dynamic;
	function key() : Dynamic;
	function next() : Void;
	function rewind() : Void;
	function send(value:Dynamic) : Dynamic;
	//function throw(exception:Exception) : Dynamic;
	function valid() : Bool;
	function __wakeup() : Void;
}
