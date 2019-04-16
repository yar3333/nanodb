package php.xml;

import php.interfaces.Traversable;

@:native("SimpleXMLElement")
extern class SimpleXMLElement implements Traversable
{
	function new(data:String, ?options:Int, ?data_is_url:Bool, ?ns:String, ?is_prefix:Bool) : Void;
	function addAttribute(name:String, ?value:String, ?namespace:String) : Void;
	function addChild(name:String, ?value:String, ?namespace:String) : SimpleXMLElement;
	function asXML(?filename:String) : Dynamic;
	function attributes(?ns:String, ?is_prefix:Bool) : SimpleXMLElement;
	function children(?ns:String, ?is_prefix:Bool) : SimpleXMLElement;
	function count() : Int;
	function getDocNamespaces(?recursive:Bool, ?from_root:Bool) : NativeArray;
	function getName() : String;
	function getNamespaces(?recursive:Bool) : NativeArray;
	function registerXPathNamespace(prefix:String, ns:String) : Bool;
	function __toString() : String;
	function xpath(path:String) : NativeArray;
}
