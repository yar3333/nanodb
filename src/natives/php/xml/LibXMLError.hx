package php.xml;

@:native("libXMLError")
extern class LibXMLError
{
	var level : Int;
	var code : Int;
	var column : Int;
	var message : String;
	var file : String;
	var line : Int;
}
