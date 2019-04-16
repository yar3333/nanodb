package php.xml;

@:native("DOMAttr")
extern class DOMAttr extends DOMNode
{
	var name(default, null) : String;
	var ownerElement(default, null) : DOMElement;
	var schemaTypeInfo(default, null) : Bool;
	var specified(default, null) : Bool;
	var value : String;

	function new(name:String, ?value:String) : Void;
	function isId() : Bool;
}
