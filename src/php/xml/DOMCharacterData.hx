package php.xml;

@:native("DOMCharacterData")
extern class DOMCharacterData extends DOMNode
{
	var data : String;
	var length(default, null) : Int;

	function appendData(data:String) : Void;
	function deleteData(offset:Int, count:Int) : Void;
	function insertData(offset:Int, data:String) : Void;
	function replaceData(offset:Int, count:Int, data:String) : Void;
	function substringData(offset:Int, count:Int) : String;
}
