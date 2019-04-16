package php.xml;

@:native("DOMImplementation")
extern class DOMImplementation
{
	function new() : Void;
	function createDocument(?namespaceURI:String, ?qualifiedName:String, ?doctype:DOMDocumentType) : DOMDocument;
	function createDocumentType(?qualifiedName:String, ?Id:String, ?systemId:String) : DOMDocumentType;
	function hasFeature(feature:String, version:String) : Bool;
}
