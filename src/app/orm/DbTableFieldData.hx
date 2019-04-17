package orm;

class DbTableFieldData
{
	public var name : String;
	public var type : String;
	public var isNull : Bool;
	public var isKey : Bool;
	public var isAutoInc : Bool;
	
	public function new(name:String, type:String, isNull:Bool, isKey:Bool, isAutoInc:Bool)
	{
		this.name = name;
		this.type = type;
		this.isNull = isNull;
		this.isKey = isKey;
		this.isAutoInc = isAutoInc;
	}
}
