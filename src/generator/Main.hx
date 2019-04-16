package generator;

import php.Exception;
import php.Lib;
import orm.Db;
import php.Syntax;
import php.TypedArray;

class Main 
{
	static function main()
	{
		Log.instance.depthLimit = 2;
		
		var args : TypedArray<String> = untyped __php__("$argv");
		args = args.slice(1);
		
		var options = new CmdOptions();
		
		options.add("databaseConnectionString", "", null,
			"Database connecting string like 'mysql://user:pass@localhost/mydb'.");
		
		options.add("autogenPackage", "models.autogenerated", Syntax.arrayDecl("-a", "--autogenerated-package"),
			  "Package name for autogenerated classes.\n"
			+ "Default is 'models.autogenerated'.");
		
		options.add("customPackage", "models", Syntax.arrayDecl("-c", "--custom-package"),
			  "Package name for your custom classes.\n"
			+ "Default is 'models'.");
		
		options.add("srcPath", "", Syntax.arrayDecl("-s", "--src-path"),
			  "Path to your source files directory.\n"
			+ "This is a base path for generated files.\n"
			+ "Read last src path from the project file if not specified.");
		
		options.addRepeatable("ignoreTables", "string", Syntax.arrayDecl("-i", "--ignore-table"),
			  "Table name to ignore.");
		
		options.addRepeatable("noInstantiateManagers", "string", Syntax.arrayDecl("-nim", "--no-instantiate-manager"),
			  "Table name to skip manager creating in autogenerated Orm class.\n"
			+ "You can use this switch for your managers with a custom constructors.\n"
			+ "In this case you must instantiate these managers manually\n"
			+ "(in regular case - in your custom Orm constructor).");
		
		options.addRepeatable("positions", "string", Syntax.arrayDecl("-pf", "--position-field"),
			  "Field name treated as record number (1, 2, 3, ...).\n"
			+ "Values of such fields will be autocalculated on records creating.\n"
			+ "Can be specified in next forms:\n"
			+ "\t`field` or `*.field` - to specify fields in any table;\n"
			+ "\t`table.field` - to specify field in specified table only.\n"
			+ "Default is `position`.");
		
		options.parse(args);
        
		if (args.length > 0)
		{
			try
			{
				var srcPath = options.get("srcPath");
				
				var databaseConnectionString = options.get("databaseConnectionString");
				if (databaseConnectionString != "")
				{
					Log.start("Generate object related mapping classes");
					
					var positions : TypedArray<String> = options.get("positions");
					if (positions.length == 0) positions = Syntax.arrayDecl("position");
					
					new OrmGenerator(srcPath).generate(new Db(databaseConnectionString), options.get("autogenPackage"), options.get("customPackage"), options.get("ignoreTables"), options.get("noInstantiateManagers"), new OrmPositions(positions));
					
					Log.finishSuccess();
				}
				else
				{
					fail("Database connection string must be specified.");
				}
					
			}
			catch (e:Exception)
			{
				Log.echo(e.getMessage());
				fail();
			}
        }
		else
		{
			
			Lib.println("Generating set of the haxe classes from database tables.");
			Lib.println("\nUsage:\n\thaxelib run orm <databaseConnectionString> [options]");
			Lib.println("\nOptions:\n");
			Lib.println(options.getHelpMessage());
		}
        
        Sys.exit(0);
	}
	
	static function fail(?message:String)
	{
		if (message != null)
		{
			Lib.println("ERROR: " + message);
		}
		Sys.exit(1);
	}
}