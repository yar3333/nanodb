package php.interfaces;

@:native("ArrayAccess")
extern interface ArrayAccess
{
	function offsetExists(offset:Dynamic) : Bool;
	function offsetGet(offset:Dynamic) : Dynamic;
	function offsetSet(offset:Dynamic, value:Dynamic) : Void;
	function offsetUnset(offset:Dynamic) : Void;
}
