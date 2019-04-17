package generator;

import php.Global;
import php.Syntax;
import php.TypedAssoc;
import php.TypedArray;
using php.StringToolsNative;

/**
 * Usage example:
 * var parser = new CmdOptions();
 * parser.addOption('isRecursive', false, [ '-r', '--recursive']);
 * parser.addOption('count', 0, [ '-c', '--count']);
 * parser.addOption('file', 'bin');
 * parser.parse([ 'test', '-c', '10', '-r' ]);
 * // now: 
 * // parser.params = { 'c' => 10, 'r' => true, file => 'test' }
 */
class CmdOptions
{
	var options : TypedArray<CmdOption>;
	var args : TypedArray<String>;
	var paramWoSwitchIndex : Int;
	var params : TypedAssoc<String, Dynamic>;

	public function new()
	{
		options = new TypedArray<CmdOption>();
	}
	
	public function get(name:String) : Dynamic
	{
		return params.get(name);
	}
	
	public function add(name:String, defaultValue:Dynamic, ?switches:TypedArray<String>, help="")
	{
		var type = getValueType(defaultValue);
		if (type == null) type = "string";
		addInner(name, defaultValue, type, switches, help, false);
	}
	
	/**
	   @param type Next types are supported: string, int, float, bool.
	**/
	public function addRepeatable(name:String, type:String, ?switches:TypedArray<String>, help="")
	{
		if (type != "string" && type != "int" && type != "float")
		{
			throw "Type '" + type + "' can not be used for repeatable option '" + name + "'.";
		}
		
		addInner(name, Syntax.arrayDecl(), type, switches, help, true);
	}
	
	function addInner(name:String, defaultValue:Dynamic, type:String, switches:TypedArray<String>, help:String, repeatable:Bool)
	{
		if (!hasOption(name))
		{
			options.push(new CmdOption(name, defaultValue, type, switches, help, repeatable));
		}
		else
		{
			throw "Option '" + name + "' already added.";
		}
	}
	
	public function getHelpMessage(prefix="\t") : String
	{
		var maxSwitchLength = 0;
		Syntax.foreach(options, function(_, opt:CmdOption)
		{
			if (opt.switches != null && opt.switches.length > 0)
			{
				maxSwitchLength = maxSwitchLength > opt.switches.join(", ").length ? maxSwitchLength : opt.switches.join(", ").length;
			}
			else
			{
				maxSwitchLength = maxSwitchLength > opt.name.length + 2 ? maxSwitchLength : opt.name.length + 2;
			}
		});
		
		var s = "";
		Syntax.foreach(options, function(_, opt:CmdOption) 
		{
			if (opt.switches != null && opt.switches.length > 0)
			{
				s += prefix + opt.switches.join(", ").rpad(" ", maxSwitchLength + 1);
			}
			else
			{
				s += prefix + ("<" + opt.name + ">").rpad(" ", maxSwitchLength + 1);
			}
			
			if (opt.help != null && opt.help != "") 
			{
				var helpLines = opt.help.splitNative("\n");
				s += helpLines.shift() + "\n";
				s += helpLines.map(function(s) return prefix + "".lpad(" ", maxSwitchLength + 1) + s + "\n").join("");
			}
			else
			{
				s += "\n";
			}
			
			s += "\n";
		});
		
		return s.rtrim() + "\n";
	}
	
	public function parse(args:TypedArray<String>) : TypedAssoc<String,Dynamic>
	{
		this.args = args.copy();
		paramWoSwitchIndex = 0;
		
		params = new TypedAssoc<String, Dynamic>();
		Syntax.foreach(options, function(_, opt:CmdOption)
		{
			params.set(opt.name, opt.defaultValue);
		});
		
		while (this.args.length > 0)
		{
			parseElement();
		}
		
		return params;
	}
	
	function parseElement()
	{
		var arg = args.shift();
		
		if (arg != "--")
		{
			if (arg.substr(0, 1) == "-" && arg != "-")
			{
				arg = ~/^(--?.+)=(.+)$/.map(arg, function(r)
				{
					args.unshift(r.matched(2));
					return r.matched(1);
				});
				
				for (opt in options)
				{
					if (opt.switches != null)
					{
						for (s in opt.switches)
						{
							if (s == arg)
							{
								parseValue(opt, arg);
								return;
							}
						}
					}
				}
				
				throw "Unknow switch '" + arg + "'.";
			}
			else
			{
				args.unshift(arg);
				parseValue(getNextNoSwitchOption(), args[0]);
			}
		}
		else
		{
			while (args.length > 0) parseValue(getNextNoSwitchOption(), args[0]);
		}
	}
	
	function parseValue(opt:CmdOption, s:String) : Void
	{
		switch (opt.type)
		{
			case "int":
				ensureValueExist(s);
				if (!opt.repeatable) params.set(opt.name, Syntax.int(args.shift()));
				else                 addRepeatableValue(opt.name, Syntax.int(args.shift()));
			
			case "float":
				ensureValueExist(s);
				if (!opt.repeatable) params.set(opt.name, Syntax.float(args.shift()));
				else                 addRepeatableValue(opt.name, Syntax.float(args.shift()));
				
			case "bool":
				params.set(opt.name, !opt.defaultValue);
			
			case "string":
				ensureValueExist(s);
				if (!opt.repeatable) params.set(opt.name, args.shift());
				else                 addRepeatableValue(opt.name, args.shift());
			
			default:
				throw "Option type '" + opt.type + "' not supported.";
		}
	}
	
	function hasOption(name:String) : Bool
	{
		return options.exists(function(opt) return opt.name == name);
	}
	
	function ensureValueExist(s:String) : Void
	{
		if (args.length == 0)
		{
			throw "Missing value after '" + s + "' switch.";
		}
	}
	
	function getNextNoSwitchOption() : CmdOption
	{
		for (i in paramWoSwitchIndex...options.length)
		{
			if (options[i].switches == null)
			{
				if (!options[i].repeatable) paramWoSwitchIndex = i + 1;
				return options[i];
			}
		}
		
		throw "Unexpected argument '" + args[0] + "'.";
		return null;
	}
	
	function addRepeatableValue(name:String, value:Dynamic)
	{
		if (params.get(name) == null) params.set(name, Syntax.arrayDecl());
		params.get(name).push(value);
	}
	
	function getValueType(v:Dynamic) : String
	{
		if (Global.is_int(v)) return "int";
		if (Global.is_float(v)) return "float";
		if (Global.is_string(v)) return "string";
		return null;
	}
}