package generator;

import php.Global;
using php.StringToolsNative;

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
	
	public static function toPhpType(longType:String, fromRoot=true) : String
	{
		return (fromRoot ? "\\" : "") + longType.replace(".", "\\");
	}
	
	public static function fieldAsFunctionNamePart(field:String): String
	{
		return capitalize(~/_[a-z]/g.map(field, function(re:EReg)
		{
			return re.matched(0).substring(1).toUpperCase();
		}));
	}
	
	public static function pluralToSingular(word:String) : String
	{
		// This is not easy: each language has its own rules for forming plurals of nouns.
		// In English it tends to be that you put "-s" on the end of a word,
		// unless it ends in "-x", "-s", "-z", "-sh", "-ch" in which case you add "-es".
		// But then there's "mouse"=>"mice", "sheep"=>"sheep" etc.
		
		if (word == "person") return "people";
		
		if (word.endsWith("xes")
		 || word.endsWith("ses")
		 || word.endsWith("zes")
		 || word.endsWith("shes")
		 || word.endsWith("ches")
		) return word.substring(0, word.length - 2);
		
		if (word.endsWith("s")) return word.substring(0, word.length - 1);
		
		return word;
	}
}
