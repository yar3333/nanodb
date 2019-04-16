package php.interfaces;

@:native("SeekableIterator")
extern interface SeekableIterator extends php.interfaces.Iterator
{
	function seek(position:Int) : Void;
}
