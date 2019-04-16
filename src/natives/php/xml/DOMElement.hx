package php.xml;

@:native("DOMElement")
extern class DOMElement extends DOMNode
{
	var schemaTypeInfo(default, null) : Bool;
	var tagName(default, null) : String;

	function new(name:String, ?value:String, ?namespaceURI:String) : Void;
	function getAttribute(name:String) : String;
	function getAttributeNode(name:String) : DOMAttr;
	function getAttributeNodeNS(namespaceURI:String, localName:String) : DOMAttr;
	function getAttributeNS(namespaceURI:String, localName:String) : String;
	function getElementsByTagName(name:String) : DOMNodeList;
	function getElementsByTagNameNS(namespaceURI:String, localName:String) : DOMNodeList;
	function hasAttribute(name:String) : Bool;
	function hasAttributeNS(namespaceURI:String, localName:String) : Bool;
	function removeAttribute(name:String) : Bool;
	function removeAttributeNode(oldnode:DOMAttr) : Bool;
	function removeAttributeNS(namespaceURI:String, localName:String) : Bool;
	function setAttribute(name:String, value:String) : DOMAttr;
	function setAttributeNode(attr:DOMAttr) : DOMAttr;
	function setAttributeNodeNS(attr:DOMAttr) : DOMAttr;
	function setAttributeNS(namespaceURI:String, qualifiedName:String, value:String) : Void;
	function setIdAttribute(name:String, isId:Bool) : Void;
	function setIdAttributeNode(attr:DOMAttr, isId:Bool) : Void;
	function setIdAttributeNS(namespaceURI:String, localName:String, isId:Bool) : Void;
}
