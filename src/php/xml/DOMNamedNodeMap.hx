package php.xml;

import php.interfaces.Traversable;

@:native("DOMNamedNodeMap")
extern class DOMNamedNodeMap implements Traversable
{
	var length(default, null) : Int;

	function getNamedItem(name:String) : DOMNode;
	function getNamedItemNS(namespaceURI:String, localName:String) : DOMNode;
	function item(index:Int) : DOMNode;
}
