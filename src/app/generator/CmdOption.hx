package generator;

import php.TypedArray;

class CmdOption
{
	public var name : String;
	public var defaultValue : Dynamic;
	public var type : String;
	public var switches : TypedArray<String>;
	public var help : String;
	public var repeatable : Bool;
	
	public function new(name:String, defaultValue:Dynamic, type:String, switches:TypedArray<String>, help:String, repeatable:Bool)
	{
		this.name = name;
		this.defaultValue = defaultValue;
		this.type = type;
		this.switches = switches;
		this.help = help;
		this.repeatable = repeatable;
	}
}