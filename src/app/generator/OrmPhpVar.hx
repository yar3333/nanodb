package generator;

typedef OrmPhpVar =
{>PhpVar,
	var table: String;
	var name : String;
	var type : String;
	var isNull : Bool;
	var isKey : Bool;
	var isAutoInc : Bool;
}
