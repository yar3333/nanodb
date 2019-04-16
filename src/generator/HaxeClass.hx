package generator;

import php.TypedArray;
using php.StringToolsNative;

class HaxeClass
{
	var fullClassName : String;
	var baseFullClassName : String;
	
	var imports : TypedArray<String>;
	var vars : TypedArray<String>;
	var methods : TypedArray<String>;
	var customs : TypedArray<String>;
	
	public function new(fullClassName:String, baseFullClassName:String=null) : Void
	{
		this.fullClassName = fullClassName;
		this.baseFullClassName = baseFullClassName;
		this.imports = new TypedArray<String>();
		this.vars = new TypedArray<String>();
		this.methods = new TypedArray<String>();
		this.customs = new TypedArray<String>();
	}
	
	public function addImport(packageName:String) : Void
	{
		imports.push("import " + packageName + ";");
	}
	
	public function addVar(v:HaxeVar, isPrivate=false, isStatic=false, isReadOnlyProperty=false, ?allows:TypedArray<String>) : Void
	{
		if (v != null)
		{
			var s = (allows != null && allows.length > 0 ? allows.map(function(s) return "@:allow(" + s + ")\n").join("") : "")
				  + (isPrivate ? "" : "public ")
				  + (isStatic ? "static " : "")
				  + "var " + v.haxeName + (isReadOnlyProperty ? "(default, null)" : "") + " : " + v.haxeType
				  + ";";
			vars.push(s);
		}
		else
		{
			vars.push("");
		}
 	}
	
	public function addVarGetter(v:HaxeVarGetter, isPrivate = false, isStatic = false, isInline = false) : Void
	{
		var s = "\n\t"
		      + (isPrivate ? "" : "public ")
			  + (isStatic ? "static " : "")
			  + "var " + v.haxeName + "(" + v.haxeName + "_getter, null)" + " : " + v.haxeType
			  + ";\n";
		
		s += (isInline ? "\tinline " : "\t")
		   + "function " + v.haxeName + "_getter() : " + v.haxeType + "\n"
		   + "\t{\n"
		   + indent(v.haxeBody.trim(), "\t\t") + "\n"
		   + "\t}";
		
		vars.push(s);
	}
	
	public function addMethod(name:String, vars:TypedArray<HaxeVar>, retType:String, body:String, isPrivate=false, isStatic=false) : Void
	{
		var header = 
				(isPrivate ? '' : 'public ')
			  + (isStatic ? 'static  ' : '')
			  + 'function ' + name + '('
			  + vars.map(function(v:HaxeVar) { return v.haxeName + ":" + v.haxeType + (v.haxeDefVal != null ? '=' + v.haxeDefVal : ''); } ).join(', ')
			  + ') : ' + retType;
		var s = header + '\n'
			  + '\t{\n'
			  + indent(body.trim(), '\t\t') + '\n'
			  + '\t}';
		methods.push(s);
 	}
	
	public function addCustom(code:String) : Void
	{
		customs.push(code);
	}
	
	public function toString() : String
	{
		var clas = splitFullClassName(fullClassName);
		
		var varLines = new TypedArray<String>();
		for (v in vars)
		{
			varLines.push(v.replace("\n", "\n\t"));
		}
		
		var s = 'package ' + clas.packageName + ';\n'
			  + '\n'
			  + imports.join('\n') + (imports.length > 0 ? '\n\n' : '')
			  + 'class ' + clas.className + (baseFullClassName != null ? ' extends ' + baseFullClassName : '') + '\n'
			  + '{\n'
			  + (vars.length > 0 ? '\t' + varLines.join('\n\t') + '\n\n' : '')
			  + (methods.length > 0 ? '\t' + methods.join('\n\n\t') + '\n' : '')
			  + (customs.length > 0 ? '\t' + customs.join('\n\n\t') + '\n' : '')
			  + '}';
		return s;
	}
	
	function indent(text:String, ind = "\t") : String
    {
        if (text == '') return '';
		return ind + text.replace("\n", "\n" + ind);
    }
	
	function splitFullClassName(fullClassName:String) : { packageName:String, className:String }
	{
		var packageName = '';
		var className = fullClassName;
		
		if (fullClassName.lastIndexOf('.') != -1)
		{
			packageName = fullClassName.substr(0, fullClassName.lastIndexOf('.'));
			className = fullClassName.substr(fullClassName.lastIndexOf('.') + 1);
		}
		
		return { packageName:packageName, className:className };
	}
}