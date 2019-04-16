<?php
use \nanodb\generator\Main;

set_include_path(get_include_path().PATH_SEPARATOR.__DIR__.'/lib');
spl_autoload_register(
	function($class){
		$file = stream_resolve_include_path(str_replace('\\', '/', $class) .'.php');
		if ($file) {
			include_once $file;
		}
	}
);
\nanodb\php\Boot::__hx__init();
Main::main();
