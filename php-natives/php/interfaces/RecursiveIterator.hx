package php.interfaces;

@:native("RecursiveIterator")
extern interface RecursiveIterator extends php.interfaces.Iterator
{
	function getChildren() : RecursiveIterator;
	function hasChildren() : Bool;
}
