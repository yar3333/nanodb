package orm;

import php.Exception;

class DbException extends php.Exception
{
	public static function errorOnQuery(sql:String, e:Exception) : DbException
	{
		return new DbException(sql, e.getCode(), e);
	}
}