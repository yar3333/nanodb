package sys.db;

import php.*;
import php.db.Mysqli_result;

class MysqlResultSet implements ResultSet
{
	static var hxAnonClassName = Boot.getHxAnon().phpClassName;

	public var length(get,null) : Int;
	public var nfields(get,null) : Int;

	var result:Mysqli_result;
	var fetchedRow:NativeAssocArray<Scalar>;
	var fieldsInfo:NativeAssocArray<MysqliFieldInfo>;

	public function new( result:Mysqli_result ) {
		this.result = result;
	}

	public function hasNext() : Bool {
		if (fetchedRow == null) fetchNext();
		return fetchedRow != null;
	}

	public function next() : Dynamic {
		if (fetchedRow == null) fetchNext();
		return withdrawFetched();
	}

	public function results() : TypedArray<Int, Dynamic> {
		var list = new TypedArray<Int, Dynamic>();

		result.data_seek(0);
		var row = result.fetch_object(hxAnonClassName);
		while (row != null) {
			row = correctObjectTypes(row);
			list.push(row);
			row = result.fetch_object(hxAnonClassName);
		}

		return list;
	}

	public function getResult( n : Int ) : String {
		if (fetchedRow == null) fetchNext();
		return Global.array_values(fetchedRow)[n];
	}

	public function getIntResult( n : Int ) : Int {
		return Syntax.int(getResult(n));
	}

	public function getFloatResult( n : Int ) : Float {
		return Syntax.float(getResult(n));
	}

	public function getFieldsNames() : TypedArray<Int, String> {
		var fields : TypedArray<Int, MysqliFieldInfo> = cast result.fetch_fields();
		return fields.map(function(x) return x.name);
	}

	function fetchNext() {
		var row = result.fetch_assoc();
		if (row != null) fetchedRow = correctArrayTypes(row);
	}

	function withdrawFetched() : Dynamic {
		if (fetchedRow == null) return null;
		var row = fetchedRow;
		fetchedRow = null;
		return Boot.createAnon(row);
	}

	function correctArrayTypes(row:NativeAssocArray<String>):NativeAssocArray<Scalar> {
		var fieldsInfo = getFieldsInfo();
		Syntax.foreach(row, function(field:String, value:String) {
			row[field] = correctType(value, fieldsInfo[field].type);
		});
		return cast row;
	}

	function correctObjectTypes(row:{}):{} {
		var fieldsInfo = getFieldsInfo();
		Syntax.foreach(row, function(field:String, value:String) {
			value = correctType(value, fieldsInfo[field].type);
			Syntax.setField(row, field, value);
		});
		return row;
	}

	inline function getFieldsInfo():NativeAssocArray<MysqliFieldInfo> {
		if (fieldsInfo == null) {
			fieldsInfo = cast Syntax.arrayDecl();
			Syntax.foreach(result.fetch_fields(), function(_, info) {
				fieldsInfo[info.name] = info;
			});
		}
		return fieldsInfo;
	}

	function correctType(value:String, type:Int):Scalar {
		if (value == null) return null;
		if (
			type == Const.MYSQLI_TYPE_BIT
			|| type == Const.MYSQLI_TYPE_TINY
			|| type == Const.MYSQLI_TYPE_SHORT
			|| type == Const.MYSQLI_TYPE_LONG
			|| type == Const.MYSQLI_TYPE_INT24
			|| type == Const.MYSQLI_TYPE_CHAR
		) {
			return Syntax.int(value);
		}
		if (
			type == Const.MYSQLI_TYPE_DECIMAL
			|| type == Const.MYSQLI_TYPE_NEWDECIMAL
			|| type == Const.MYSQLI_TYPE_FLOAT
			|| type == Const.MYSQLI_TYPE_DOUBLE
		) {
			return Syntax.float(value);
		}
		return value;
	}

	function get_length() return result.num_rows;
	function get_nfields() return result.field_count;
}
