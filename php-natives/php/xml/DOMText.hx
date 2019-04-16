package php.xml;

@:native("DOMText")
extern class DOMText extends DOMCharacterData
{
	var wholeText(default, null) : String;

	function new(?value:String) : Void;
	function isWhitespaceInElementContent() : Bool;
	function splitText(offset:Int) : DOMText;
}
