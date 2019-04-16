package php.xml;

@:native("XSLTProcessor")
extern class XSLTProcessor
{
	function getParameter(namespaceURI:String, localName:String) : String;
	function getSecurityPrefs() : Int;
	function hasExsltSupport() : Bool;
	function importStylesheet(stylesheet:Dynamic) : Bool;
	function registerPHPFunctions(?restrict:Dynamic) : Void;
	function removeParameter(namespaceURI:String, localName:String) : Bool;
	function setParameter(namespace:String, name:String, value:String) : Bool;
	function setProfiling(filename:String) : Bool;
	function setSecurityPrefs(securityPrefs:Int) : Int;
	function transformToDoc(doc:DOMNode) : DOMDocument;
	function transformToURI(doc:DOMDocument, uri:String) : Int;
	function transformToXML(doc:Dynamic) : String;
}
