package php.xml;

@:native("DOMProcessingInstruction")
extern class DOMProcessingInstruction extends DOMNode
{
	var target(default, null) : String;
	var data : String;

	function new(name:String, ?value:String) : Void;
}
