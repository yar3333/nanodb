package php.xml;

@:native("DOMEntity")
extern class DOMEntity extends DOMNode
{
	var publicId(default, null) : String;
	var systemId(default, null) : String;
	var notationName(default, null) : String;
	var actualEncoding : String;
	var encoding(default, null) : String;
	var version(default, null) : String;
}
