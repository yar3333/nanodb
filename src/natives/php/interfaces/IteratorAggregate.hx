package php.interfaces;

@:native("IteratorAggregate")
extern interface IteratorAggregate extends Traversable
{
	function getIterator() : Traversable;
}
