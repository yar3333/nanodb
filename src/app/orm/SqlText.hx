package orm;

class SqlText
{
	public var text : String;

	private inline function new(text : String)
	{
		this.text = text;
	}
	
	public static function raw(sqlText:String) return new SqlTextRaw(sqlText);
	public static function field(fieldName:String) return new SqlTextField(fieldName);
}