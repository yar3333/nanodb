package generator;
import php.Global;

class Tools
{
	public static function capitalize(s:String) : String
	{
		return s == "" ? s : s.substr(0, 1).toUpperCase() + s.substr(1);
	}
	
	public static function mkdir(path:String) : Void
	{
		if (!Global.file_exists(path))
		{
			Global.mkdir(path, 511, true);
		}
	}
}
