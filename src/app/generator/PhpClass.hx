package generator;

import php.Syntax;
import php.TypedArray;
using php.StringToolsNative;

class PhpClass
{
	var fullClassName : String;
	var baseFullClassName : String;
	
	var comments : TypedArray<String>;
	var imports : TypedArray<String>;
	var vars : TypedArray<String>;
	var methods : TypedArray<String>;
	var customs : TypedArray<String>;
	
	public function new(fullClassName:String, baseFullClassName:String=null) : Void
	{
		this.fullClassName = fullClassName;
		this.baseFullClassName = baseFullClassName;
		
		this.comments = new TypedArray<String>();
		this.imports = new TypedArray<String>();
		this.vars = new TypedArray<String>();
		this.methods = new TypedArray<String>();
		this.customs = new TypedArray<String>();
	}
	
	public function addImport(className:String) : Void
	{
		imports.push("use " + Tools.toPhpType(className) + ";");
	}
	
	public function addVar(v:PhpVar, access:String="public", isStatic:Bool=false) : Void
	{
		if (v != null)
		{
			var s = (v.haxeType != null ? "/**\n * @var " + v.haxeType + "\n */\n" : "")
				  + (access + " ")
				  + (isStatic ? "static " : "")
				  + "$" + v.haxeName
				  + ";";
			vars.push(s);
		}
		else
		{
			vars.push("");
		}
 	}
	
	public function addProperty(v:PhpVar, isStatic = false) : Void
	{
		addVar(v, "protected", isStatic);
		
		addMethod(
			"get" + Tools.capitalize(v.haxeName),
			Syntax.arrayDecl(),
			v.haxeType,
			"{ return $this->" + v.haxeName + "; }",
			"public",
			isStatic
		);
		
		addMethod(
			"set" + Tools.capitalize(v.haxeName),
			Syntax.arrayDecl(
				new PhpVar(v.haxeName, v.haxeType)
			),
			v.haxeType,
			"{ $this->" + v.haxeName + " = " + v.haxeName + "; }",
			"public",
			isStatic
		);
		
	}
	
	public function addMethod(name:String, vars:TypedArray<PhpVar>, retType:String, body:String, access="public", isStatic=false) : Void
	{
		var header = getMethodComment(vars, retType)
				   + (access + " ")
				   + (isStatic ? 'static ' : '')
				   + 'function ' + name + '('
				   + vars.map(function(v:PhpVar) { return (v.haxeType != null ? renderPhpType(v.haxeType) + " " : "") + "$" + v.haxeName + (v.haxeDefVal != null ? '=' + v.haxeDefVal : ''); } ).join(', ')
				   + ')'
				   + (retType != null ? " : " + renderPhpType(retType) : "");
		var s = header + (body != null && body.trim().length > 0 ? '\n\t{\n' + indent(body.trim(), '\t\t') + '\n\t}' : " {}");
		methods.push(s);
 	}
	
	function getMethodComment(vars:TypedArray<PhpVar>, retType:String) : String
	{
		if (!vars.exists(function(x) return x.haxeType.contains("[]")) && !retType.contains("[]")) return "";
		
		var r = "/**\n";
		for (v in vars)
		{
			r += "\t * @param " + v.haxeType + " $" + v.haxeName + "\n";
		}
		r += "\t * @return " + retType + "\n";
		r += "\t */\n\t";
		
		return r;
	}
	
	function renderPhpType(type:String) return type.contains("[]") ? "array" : type;
	
	public function addCustom(code:String) : Void
	{
		customs.push(code);
	}
	
	public function addComment(text:String) : Void
	{
		comments.push(text);
	}
	
	public function toString() : String
	{
		var varLines = new TypedArray<String>();
		Syntax.foreach(vars, function(_, v:String)
		{
			varLines.push(v.replace("\n", "\n\t"));
		});
		
		var s = '<?php\n\n'
			  + comments.join("\n") + (comments.length > 0 ? '\n\n' : '')
			  + 'namespace ' + Tools.toPhpType(getNamespaceName(fullClassName), false) + ';\n'
			  + '\n'
			  + imports.join('\n') + (imports.length > 0 ? '\n\n' : '')
			  + 'class ' + getShortClassName(fullClassName) + (baseFullClassName != null ? ' extends ' + Tools.toPhpType(baseFullClassName) : '') + '\n'
			  + '{\n'
			  + (vars.length > 0 ? '\t' + varLines.join('\n\t\n\t') + '\n\n' : '')
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
	
	function getShortClassName(fullClassName:String) : String
	{
		if (fullClassName.contains('.'))
		{
			return  fullClassName.substr(fullClassName.lastIndexOfNative('.') + 1);
		}
		return fullClassName;
	}
	
	function getNamespaceName(fullClassName:String) : String
	{
		if (fullClassName.contains('.'))
		{
			return fullClassName.substr(0, fullClassName.lastIndexOfNative('.'));
		}
		return '';
	}
}