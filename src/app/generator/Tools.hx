package generator;

import php.Global;
import php.PcreNatives;
import php.TypedArray;
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
		return capitalize(PcreNatives.preg_replace_callback('/_[a-z]/', function(arr:TypedArray<String>)
		{
			return arr[0].substrNative(1).toUpperCase();
		}, field));
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
		) return word.substrNative(0, word.length - 2);
		
		if (word.endsWith("ies")) return word.substrNative(0, word.length - 3) + "y";
		
		if (word.endsWith("s")) return word.substrNative(0, word.length - 1);
		
		return word;
	}
	
	public static function getNamespace(fullClassName:String) : String
	{
		var parts = fullClassName.splitNative(".");
		if (parts.length <= 1) return "";
		return parts.slice(0, parts.length - 1).join(".");
	}
}
