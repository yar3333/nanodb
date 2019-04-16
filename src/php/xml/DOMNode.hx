package php.xml;

@:native("DOMNode")
extern class DOMNode
{
	var nodeName(default, null) : String;
	var nodeValue : String;
	var nodeType(default, null) : Int;
	var parentNode(default, null) : DOMNode;
	var childNodes(default, null) : DOMNodeList;
	var firstChild(default, null) : DOMNode;
	var lastChild(default, null) : DOMNode;
	var previousSibling(default, null) : DOMNode;
	var nextSibling(default, null) : DOMNode;
	var attributes(default, null) : DOMNamedNodeMap;
	var ownerDocument(default, null) : DOMDocument;
	var namespaceURI(default, null) : String;
	var prefix : String;
	var localName(default, null) : String;
	var baseURI(default, null) : String;
	var textContent : String;

	function appendChild(newnode:DOMNode) : DOMNode;
	function C14N(?exclusive:Bool, ?with_comments:Bool, ?xpath:NativeArray, ?ns_prefixes:NativeArray) : String;
	function C14NFile(uri:String, ?exclusive:Bool, ?with_comments:Bool, ?xpath:NativeArray, ?ns_prefixes:NativeArray) : Int;
	function cloneNode(?deep:Bool) : DOMNode;
	function getLineNo() : Int;
	function getNodePath() : String;
	function hasAttributes() : Bool;
	function hasChildNodes() : Bool;
	function insertBefore(newnode:DOMNode, ?refnode:DOMNode) : DOMNode;
	function isDefaultNamespace(namespaceURI:String) : Bool;
	function isSameNode(node:DOMNode) : Bool;
	function isSupported(feature:String, version:String) : Bool;
	function lookupNamespaceURI(prefix:String) : String;
	function lookupPrefix(namespaceURI:String) : String;
	function normalize() : Void;
	function removeChild(oldnode:DOMNode) : DOMNode;
	function replaceChild(newnode:DOMNode, oldnode:DOMNode) : DOMNode;
}
