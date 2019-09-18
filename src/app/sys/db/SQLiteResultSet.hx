package sys.db;

import php.*;
import php.db.*;
import sys.db.*;

class SQLiteResultSet implements ResultSet
{
	public var length(default, null) : Int = 0;
	public var nfields(default, null) : Int = 0;

	var loaded:Bool = false;
	var currentIndex:Int = 0;
	var rows:NativeIndexedArray<TypedAssoc<String, Dynamic>>;
	var result:SQLite3Result;
	var fetchedRow:NativeArray;
	var fieldsInfo:NativeAssocArray<Int>;

	public function new( result:SQLite3Result ) {
		this.result = result;
	}

	public function hasNext() : Bool {
		if (!loaded) load();
		return currentIndex < length;
	}

	public function next() : TypedAssoc<String, Dynamic> {
		if (!loaded) load();
		var next:Dynamic = rows[currentIndex++];
		return correctArrayTypes(next);
	}

	public function results() : TypedArray<TypedAssoc<String, Dynamic>> {
		if (!loaded) load();
		var list = new TypedArray<TypedAssoc<String, Dynamic>>();
		Syntax.foreach(rows, function(_, row) list.push(correctArrayTypes(row)));
		return list;
	}

	public function getResult( n : Int ) : String {
		if (!loaded) load();
		if (!hasNext()) return null;
		return Global.array_values(rows[currentIndex])[n];
	}

	public function getIntResult(n:Int) : Int 
	{
		return Syntax.int(getResult(n));
	}

	public function getFloatResult(n:Int) : Float 
	{
		return Syntax.float(getResult(n));
	}

	public function getFieldsNames() : TypedArray<String> 
	{
		var fieldsInfo = getFieldsInfo();
		return Global.array_keys(fieldsInfo);
	}
	
	public function free() : Void
	{
		result.finalize();
	}

	function correctArrayTypes(row:NativeAssocArray<String>) : TypedAssoc<String, Dynamic> 
	{
		var fieldsInfo = getFieldsInfo();
		Syntax.foreach(row, function(field:String, value:String) {
			row[field] = correctType(value, fieldsInfo[field]);
		});
		return cast row;
	}

	inline function getFieldsInfo():NativeAssocArray<Int> {
		if (fieldsInfo == null) {
			fieldsInfo = cast Syntax.arrayDecl();
			for(i in 0...nfields) {
				fieldsInfo[result.columnName(i)] = result.columnType(i);
			}
		}
		return fieldsInfo;
	}

	function load() {
		loaded = true;
		nfields = result.numColumns();
		getFieldsInfo();
		fetchAll();
	}

	function correctType(value:String, type:Int):Scalar {
		if (value == null) return null;
		if (type == Const.SQLITE3_INTEGER) return Syntax.int(value);
		if (type == Const.SQLITE3_FLOAT) return Syntax.float(value);
		return value;
	}

	function fetchAll() {
		rows = Syntax.arrayDecl();
		var index = 0;
		var row = result.fetchArray(Const.SQLITE3_ASSOC);
		while(row != false) {
			rows[index] = correctArrayTypes(row);
			row = result.fetchArray(Const.SQLITE3_ASSOC);
			index++;
		}
		length = index;
	}
}
