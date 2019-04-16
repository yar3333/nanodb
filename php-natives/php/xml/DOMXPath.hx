package php.xml;

@:native("DOMXPath")
extern class DOMXPath
{
	var document : DOMDocument;

	function new(doc:DOMDocument) : Void;
	function evaluate(expression:String, ?contextnode:DOMNode, ?registerNodeNS:Bool) : Dynamic;
	function query(expression:String, ?contextnode:DOMNode, ?registerNodeNS:Bool) : DOMNodeList;
	function registerNamespace(prefix:String, namespaceURI:String) : Bool;
	function registerPhpFunctions(?restrict:Dynamic) : Void;
}
