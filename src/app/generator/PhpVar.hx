package generator;

class PhpVar
{
	public var haxeName : String;
	public var haxeType : String;
	public var haxeDefVal : String;
	
	public function new(haxeName:String, haxeType:String, ?haxeDefVal:String)
	{
		this.haxeName = haxeName;
		this.haxeType = haxeType;
		this.haxeDefVal = haxeDefVal;
	}
}
