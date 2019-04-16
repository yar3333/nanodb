package php.xml;

@:native("DOMDocument")
extern class DOMDocument extends DOMNode
{
	var actualEncoding(default, null) : String;
	//var config(default, null) : DOMConfiguration;
	var doctype(default, null) : DOMDocumentType;
	var documentElement(default, null) : DOMElement;
	var documentURI : String;
	var encoding : String;
	var formatOutput : Bool;
	var implementation(default, null) : DOMImplementation;
	var preserveWhiteSpace : Bool;
	var recover : Bool;
	var resolveExternals : Bool;
	var standalone : Bool;
	var strictErrorChecking : Bool;
	var substituteEntities : Bool;
	var validateOnParse : Bool;
	var version : String;
	var xmlEncoding(default, null) : String;
	var xmlStandalone : Bool;
	var xmlVersion : String;

	function new(?version:String, ?encoding:String) : Void;
	function createAttribute(name:String) : DOMAttr;
	function createAttributeNS(namespaceURI:String, qualifiedName:String) : DOMAttr;
	function createCDATASection(data:String) : DOMCdataSection;
	function createComment(data:String) : DOMComment;
	function createDocumentFragment() : DOMDocumentFragment;
	function createElement(name:String, ?value:String) : DOMElement;
	function createElementNS(namespaceURI:String, qualifiedName:String, ?value:String) : DOMElement;
	function createEntityReference(name:String) : DOMEntityReference;
	function createProcessingInstruction(target:String, ?data:String) : DOMProcessingInstruction;
	function createTextNode(content:String) : DOMText;
	function getElementById(elementId:String) : DOMElement;
	function getElementsByTagName(name:String) : DOMNodeList;
	function getElementsByTagNameNS(namespaceURI:String, localName:String) : DOMNodeList;
	function importNode(importedNode:DOMNode, ?deep:Bool) : DOMNode;
	function load(filename:String, ?options:Int) : Dynamic;
	function loadHTML(source:String, ?options:Int) : Bool;
	function loadHTMLFile(filename:String, ?options:Int) : Bool;
	function loadXML(source:String, ?options:Int) : Dynamic;
	function normalizeDocument() : Void;
	function registerNodeClass(baseclass:String, extendedclass:String) : Bool;
	function relaxNGValidate(filename:String) : Bool;
	function relaxNGValidateSource(source:String) : Bool;
	function save(filename:String, ?options:Int) : Int;
	function saveHTML(?node:DOMNode) : String;
	function saveHTMLFile(filename:String) : Int;
	function saveXML(?node:DOMNode, ?options:Int) : String;
	function schemaValidate(filename:String, ?flags:Int) : Bool;
	function schemaValidateSource(source:String, ?flags:Int) : Bool;
	function validate() : Bool;
	function xinclude(?options:Int) : Int;
}
