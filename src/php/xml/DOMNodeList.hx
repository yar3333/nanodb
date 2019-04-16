package php.xml;

import php.interfaces.Traversable;

@:native("DOMNodeList")
extern class DOMNodeList implements Traversable
{
	var length(default, null) : Int;

	function item(index:Int) : DOMNode;
}
