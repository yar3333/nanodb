<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\php\Boot;
use \nanodb\generator\Log as GeneratorLog;
use \nanodb\generator\OrmGenerator as GeneratorOrmGenerator;
use \nanodb\generator\CmdOptions as GeneratorCmdOptions;
use \nanodb\orm\Db;
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;

class Main {
	/**
	 * @param string $message
	 * 
	 * @return void
	 */
	static public function fail ($message = null) {
		if ($message !== null) {
			echo("ERROR: " . $message . "\x0A");
		}
		exit(1);
	}

	/**
	 * @return void
	 */
	static public function main () {
		GeneratorLog::$instance->depthLimit = 2;
		$args = $GLOBALS["argv"];
		$args = array_slice($args, 1, null);
		$options = new GeneratorCmdOptions();
		$options->add("databaseConnectionString", "", null, "Database connecting string like 'mysql://user:pass@localhost/mydb'.");
		$options->add("autogenPackage", "models.autogenerated", ["-a", "--autogenerated-package"], "Package name for autogenerated classes.\x0A" . "Default is 'models.autogenerated'.");
		$options->add("customPackage", "models", ["-c", "--custom-package"], "Package name for your custom classes.\x0A" . "Default is 'models'.");
		$options->add("srcPath", "", ["-s", "--src-path"], "Path to your source files directory.\x0A" . "This is a base path for generated files.\x0A" . "Read last src path from the project file if not specified.");
		$options->addRepeatable("ignoreTables", "string", ["-i", "--ignore-table"], "Table name to ignore.");
		$options->addRepeatable("noInstantiateManagers", "string", ["-nim", "--no-instantiate-manager"], "Table name to skip manager creating in autogenerated Orm class.\x0A" . "You can use this switch for your managers with a custom constructors.\x0A" . "In this case you must instantiate these managers manually\x0A" . "(in regular case - in your custom Orm constructor).");
		$options->addRepeatable("positions", "string", ["-pf", "--position-field"], "Field name treated as record number (1, 2, 3, ...).\x0A" . "Values of such fields will be autocalculated on records creating.\x0A" . "Can be specified in next forms:\x0A" . "\x09`field` or `*.field` - to specify fields in any table;\x0A" . "\x09`table.field` - to specify field in specified table only.\x0A" . "Default is `position`.");
		$options->parse($args);
		if (count($args) > 0) {
			$srcPath = $options->get("srcPath");
			$databaseConnectionString = $options->get("databaseConnectionString");
			if ($databaseConnectionString !== "") {
				GeneratorLog::start("Generate object related mapping classes");
				$positions = $options->get("positions");
				if (count($positions) === 0) {
					$positions = ["position"];
				}
				(new GeneratorOrmGenerator($srcPath))->generate(new Db($databaseConnectionString), $options->get("autogenPackage"), $options->get("customPackage"), $options->get("ignoreTables"), $options->get("noInstantiateManagers"), new GeneratorOrmPositions($positions));
				GeneratorLog::finishSuccess();
			} else {
				Main::fail("Database connection string must be specified.");
			}
		} else {
			echo("Generating set of the php classes from database tables.\x0A");
			echo("\x0AUsage:\x0A\x09bin\\nanodb <databaseConnectionString> [options]\x0A");
			echo("\x0AOptions:\x0A\x0A");
			echo(($options->getHelpMessage()??'null') . "\x0A");
		}
		exit(0);
	}
}

Boot::registerClass(Main::class, 'generator.Main');
