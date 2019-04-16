package php.interfaces;

@:native("Iterator")
extern interface Iterator extends Traversable
{
	function current() : Dynamic;
    function key() : Dynamic;
    function next() : Void;
    function rewind() : Void;
    function valid() : Bool;
}
