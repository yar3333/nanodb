package sys.db;

@:coreApi class Mysql
{
	public static function connect(
		params : {
			host : String,
			?port : Int,
			user : String,
			pass : String,
			?socket : String,
			?database : String
		}
	) : Connection
	{
		return new MysqlConnection(params);
	}
}
