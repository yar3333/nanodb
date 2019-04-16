package php.xml;

@:native("DOMNotation")
extern class DOMNotation extends DOMNode
{
	var publicId(default, null) : String;
	var systemId(default, null) : String;
}
