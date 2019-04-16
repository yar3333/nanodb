package php.xml;

@:native("DOMDocumentType")
extern class DOMDocumentType extends DOMNode
{
	var publicId(default, null) : String;
	var systemId(default, null) : String;
	var name(default, null) : String;
	var entities(default, null) : DOMNamedNodeMap;
	var notations(default, null) : DOMNamedNodeMap;
	var internalSubset(default, null) : String;
}
