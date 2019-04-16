package php.interfaces;

@:native("Serializable")
extern interface Serializable
{
	function serialize() : String;
	function unserialize(serialized:String) : Dynamic;
}
