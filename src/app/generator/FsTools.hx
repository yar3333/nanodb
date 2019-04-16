package generator;
import php.Global;

class FsTools
{
	public static function mkdir(path:String)
	{
		if (!Global.file_exists(path))
		{
			Global.mkdir(path, 511, true);
		}
	}
}