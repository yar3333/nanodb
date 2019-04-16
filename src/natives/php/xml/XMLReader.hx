package php.xml;

@:native("XMLReader")
extern class XMLReader
{
	static var NONE(default, null) : Int;
	static var ELEMENT(default, null) : Int;
	static var ATTRIBUTE(default, null) : Int;
	static var TEXT(default, null) : Int;
	static var CDATA(default, null) : Int;
	static var ENTITY_REF(default, null) : Int;
	static var ENTITY(default, null) : Int;
	static var PI(default, null) : Int;
	static var COMMENT(default, null) : Int;
	static var DOC(default, null) : Int;
	static var DOC_TYPE(default, null) : Int;
	static var DOC_FRAGMENT(default, null) : Int;
	static var NOTATION(default, null) : Int;
	static var WHITESPACE(default, null) : Int;
	static var SIGNIFICANT_WHITESPACE(default, null) : Int;
	static var END_ELEMENT(default, null) : Int;
	static var END_ENTITY(default, null) : Int;
	static var XML_DECLARATION(default, null) : Int;
	static var LOADDTD(default, null) : Int;
	static var DEFAULTATTRS(default, null) : Int;
	static var VALIDATE(default, null) : Int;
	static var SUBST_ENTITIES(default, null) : Int;
	var attributeCount(default, null) : Int;
	var baseURI(default, null) : String;
	var depth(default, null) : Int;
	var hasAttributes(default, null) : Bool;
	var hasValue(default, null) : Bool;
	var isDefault(default, null) : Bool;
	var isEmptyElement(default, null) : Bool;
	var localName(default, null) : String;
	var name(default, null) : String;
	var namespaceURI(default, null) : String;
	var nodeType(default, null) : Int;
	var prefix(default, null) : String;
	var value(default, null) : String;
	var xmlLang(default, null) : String;

	function close() : Bool;
	function expand(?basenode:DOMNode) : DOMNode;
	function getAttribute(name:String) : String;
	function getAttributeNo(index:Int) : String;
	function getAttributeNs(localName:String, namespaceURI:String) : String;
	function getParserProperty(property:Int) : Bool;
	function isValid() : Bool;
	function lookupNamespace(prefix:String) : String;
	function moveToAttribute(name:String) : Bool;
	function moveToAttributeNo(index:Int) : Bool;
	function moveToAttributeNs(localName:String, namespaceURI:String) : Bool;
	function moveToElement() : Bool;
	function moveToFirstAttribute() : Bool;
	function moveToNextAttribute() : Bool;
	function next(?localname:String) : Bool;
	function open(URI:String, ?encoding:String, ?options:Int) : Bool;
	function read() : Bool;
	function readInnerXML() : String;
	function readOuterXML() : String;
	function readString() : String;
	function setParserProperty(property:Int, value:Bool) : Bool;
	function setRelaxNGSchema(filename:String) : Bool;
	function setRelaxNGSchemaSource(source:String) : Bool;
	function setSchema(filename:String) : Bool;
	function xml(source:String, ?encoding:String, ?options:Int) : Bool;
}
