<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

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
			echo("ERROR: " . $message . "\n");
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
		$options->add("databaseConnectionString", "", null, "Database connecting string like 'mysql://<user>:<password>@<host>/<database_name>'.");
		$options->add("autogeneratedPackage", "models\\autogenerated", ["-a", "--autogenerated-package"], "Package name for autogenerated classes.\n" . "Default is 'models.autogenerated'.");
		$options->add("customPackage", "models", ["-c", "--custom-package"], "Package name for your custom classes.\n" . "Default is 'models'.");
		$options->add("outPath", "", ["-o", "--out-path"], "This is a base directory path for generated files.");
		$options->addRepeatable("ignoreTables", "string", ["-i", "--ignore-table"], "Table name to ignore.");
		$options->addRepeatable("noInstantiateManagers", "string", ["-nim", "--no-instantiate-manager"], "Table name to skip manager creating in autogenerated Orm class.\n" . "You can use this switch for your managers with a custom constructors.\n" . "In this case you must instantiate these managers manually\n" . "(in regular case - in your custom Orm constructor).");
		$options->addRepeatable("positions", "string", ["-pf", "--position-field"], "Field name treated as record number (1, 2, 3, ...).\n" . "Values of such fields will be autocalculated on records creating.\n" . "Can be specified in next forms:\n" . "\t`field` or `*.field` - to specify fields in any table;\n" . "\t`table.field` - to specify field in specified table only.\n" . "Default is `position`.");
		$options->parse($args);
		if (count($args) > 0) {
			$outPath = $options->get("outPath");
			$databaseConnectionString = $options->get("databaseConnectionString");
			if ($databaseConnectionString !== "") {
				GeneratorLog::start("Generate object related mapping classes");
				$positions = $options->get("positions");
				if (count($positions) === 0) {
					$positions = ["position"];
				}
				(new GeneratorOrmGenerator($outPath))->generate(new Db($databaseConnectionString), str_replace("\\", ".", ltrim($options->get("autogeneratedPackage"), "\\")), str_replace("\\", ".", ltrim($options->get("customPackage"), "\\")), $options->get("ignoreTables"), $options->get("noInstantiateManagers"), new GeneratorOrmPositions($positions));
				GeneratorLog::finishSuccess();
			} else {
				Main::fail("Database connection string must be specified.");
			}
		} else {
			echo("Generating set of the php classes from database tables.\n");
			echo("\nUsage:\n\tbin\\nanodb <databaseConnectionString> [options]\n");
			echo("\nOptions:\n\n");
			echo($options->getHelpMessage() . "\n");
		}
		exit(0);
	}
}

