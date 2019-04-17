package generator;

using php.StringToolsNative;

class OrmTable
{
	public var tableName(default, null) : String;
	public var varName(default, null) : String;
	
	public var autogenManagerClassName(default, null) : String;
	public var customManagerClassName(default, null) : String;
	
	public var autogenModelClassName(default, null) : String;
	public var customModelClassName(default, null) : String;
	
	public var queryClassName(default, null) : String;
	
	public function new(tableName:String, autogenPackage:String, customPackage:String)
	{
		this.tableName = tableName;
		this.varName = getVarName();
		
		var className = Tools.pluralToSingular(getClassName());
		
		this.autogenManagerClassName = autogenPackage + "." + className + "Manager";
		this.customManagerClassName = customPackage + "." + className + "Manager";
		
		this.autogenModelClassName = autogenPackage + "." + className;
		this.customModelClassName = customPackage + "." + className;
		
		this.queryClassName = autogenPackage + "." + className + "Query";
	}
	
	function getVarName() : String
	{
		var s = "";
		
		var packs = tableName.toLowerCase().splitNative("__");
		while (packs.length > 1)
		{
			var pack = packs.shift();
			var words = pack.splitNative("_");
			s += words.shift();
			s += words.map(function(v) return Tools.capitalize(v)).join("");
			s += "_";
		}
		
		var parts = packs[0].splitNative("_");
		
		s += parts[0] + parts.slice(1).map(function(w) return Tools.capitalize(w)).join("");
		
		return s;
	}
	
	function getClassName() : String
    {
		var s = "";
		
		var packs = tableName.toLowerCase().splitNative("__");
		while (packs.length > 1)
		{
			var pack = packs.shift();
			var words = pack.splitNative("_");
			s += words.shift();
			s += words.map(function(x) return Tools.capitalize(x)).join("");
			s += ".";
		}
		
		s += packs[0].splitNative("_").map(function(x) return Tools.capitalize(x)).join("");
		
		return s;
    }
}