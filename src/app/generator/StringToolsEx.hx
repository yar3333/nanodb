package generator;

class StringToolsEx
{
	public static function capitalize(s:String) : String return s == "" ? s : s.substr(0, 1).toUpperCase() + s.substr(1);
}
