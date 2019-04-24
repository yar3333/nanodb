<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\generator\Tools as GeneratorTools;
use \nanodb\generator\PhpVar as GeneratorPhpVar;

class PhpClass {
	/**
	 * @var string
	 */
	public $baseFullClassName;
	/**
	 * @var mixed
	 */
	public $comments;
	/**
	 * @var mixed
	 */
	public $customs;
	/**
	 * @var string
	 */
	public $fullClassName;
	/**
	 * @var mixed
	 */
	public $imports;
	/**
	 * @var mixed
	 */
	public $methods;
	/**
	 * @var mixed
	 */
	public $vars;

	/**
	 * @param string $fullClassName
	 * @param string $baseFullClassName
	 * 
	 * @return void
	 */
	public function __construct ($fullClassName, $baseFullClassName = null) {
		$this->fullClassName = $fullClassName;
		$this->baseFullClassName = $baseFullClassName;
		$this1 = [];
		$this->comments = $this1;
		$this2 = [];
		$this->imports = $this2;
		$this3 = [];
		$this->vars = $this3;
		$this4 = [];
		$this->methods = $this4;
		$this5 = [];
		$this->customs = $this5;
	}

	/**
	 * @param string $text
	 * 
	 * @return void
	 */
	public function addComment ($text) {
		array_push($this->comments, $text);
	}

	/**
	 * @param string $code
	 * 
	 * @return void
	 */
	public function addCustom ($code) {
		array_push($this->customs, $code);
	}

	/**
	 * @param string $className
	 * 
	 * @return void
	 */
	public function addImport ($className) {
		array_push($this->imports, "use " . GeneratorTools::toPhpType($className) . ";");
	}

	/**
	 * @param string $name
	 * @param mixed $vars
	 * @param string $retType
	 * @param string $body
	 * @param string $access
	 * @param bool $isStatic
	 * 
	 * @return void
	 */
	public function addMethod ($name, $vars, $retType, $body, $access = "public", $isStatic = false) {
		if ($access === null) {
			$access = "public";
		}
		if ($isStatic === null) {
			$isStatic = false;
		}
		$header = (((($retType !== null) && (mb_strpos($retType, "[]") !== false) ? "/**\n\t * @return " . $retType . "\n\t */\n\t" : ""))??'null') . (($access . " ")??'null') . ((($isStatic ? "static " : ""))??'null') . "function " . $name . "(" . (implode(", ", array_map(function ($v) {
			return ((($v->haxeType !== null ? $v->haxeType . " " : ""))??'null') . "\$" . $v->haxeName . ((($v->haxeDefVal !== null ? "=" . $v->haxeDefVal : ""))??'null');
		}, $vars))??'null') . ")" . ((($retType !== null ? " : " . (((!(mb_strpos($retType, "[]") !== false) ? $retType : "array"))??'null') : ""))??'null');
		$s = $header . (((($body !== null) && (mb_strlen(trim($body, null)) > 0) ? "\n\t{\n" . ($this->indent(trim($body, null), "\t\t")??'null') . "\n\t}" : " {}"))??'null');
		array_push($this->methods, $s);
	}

	/**
	 * @param GeneratorPhpVar $v
	 * @param bool $isStatic
	 * 
	 * @return void
	 */
	public function addProperty ($v, $isStatic = false) {
		if ($isStatic === null) {
			$isStatic = false;
		}
		$this->addVar($v, "protected", $isStatic);
		$this->addMethod("get" . GeneratorTools::capitalize($v->haxeName), [], $v->haxeType, "{ return \$this->" . $v->haxeName . "; }", "public", $isStatic);
		$this->addMethod("set" . GeneratorTools::capitalize($v->haxeName), [new GeneratorPhpVar($v->haxeName, $v->haxeType)], $v->haxeType, "{ \$this->" . $v->haxeName . " = " . $v->haxeName . "; }", "public", $isStatic);
	}

	/**
	 * @param GeneratorPhpVar $v
	 * @param string $access
	 * @param bool $isStatic
	 * 
	 * @return void
	 */
	public function addVar ($v, $access = "public", $isStatic = false) {
		if ($access === null) {
			$access = "public";
		}
		if ($isStatic === null) {
			$isStatic = false;
		}
		if ($v !== null) {
			$s = ((($v->haxeType !== null ? "/**\n * @var " . $v->haxeType . "\n */\n" : ""))??'null') . (($access . " ")??'null') . ((($isStatic ? "static " : ""))??'null') . "\$" . $v->haxeName . ";";
			array_push($this->vars, $s);
		} else {
			array_push($this->vars, "");
		}
	}

	/**
	 * @param string $fullClassName
	 * 
	 * @return string
	 */
	public function getNamespaceName ($fullClassName) {
		if ((mb_strpos($fullClassName, ".") !== false)) {
			return mb_substr($fullClassName, 0, mb_strrpos($fullClassName, "."));
		}
		return "";
	}

	/**
	 * @param string $fullClassName
	 * 
	 * @return string
	 */
	public function getShortClassName ($fullClassName) {
		if ((mb_strpos($fullClassName, ".") !== false)) {
			return mb_substr($fullClassName, mb_strrpos($fullClassName, ".") + 1, null);
		}
		return $fullClassName;
	}

	/**
	 * @param string $text
	 * @param string $ind
	 * 
	 * @return string
	 */
	public function indent ($text, $ind = "\t") {
		if ($ind === null) {
			$ind = "\t";
		}
		if ($text === "") {
			return "";
		}
		return $ind . (str_replace("\n", "\n" . $ind, $text)??'null');
	}

	/**
	 * @return string
	 */
	public function toString () {
		$this1 = [];
		$varLines = $this1;
		$collection = $this->vars;
		foreach ($collection as $key => $value) {
			array_push($varLines, str_replace("\n", "\n\t", $value));
		}

		$s = "<?php\n\n" . (implode("\n", $this->comments)??'null') . (((count($this->comments) > 0 ? "\n\n" : ""))??'null') . "namespace " . (GeneratorTools::toPhpType($this->getNamespaceName($this->fullClassName), false)??'null') . ";\n" . "\n" . (implode("\n", $this->imports)??'null') . (((count($this->imports) > 0 ? "\n\n" : ""))??'null') . "class " . $this->getShortClassName($this->fullClassName) . ((($this->baseFullClassName !== null ? " extends " . GeneratorTools::toPhpType($this->baseFullClassName) : ""))??'null') . "\n" . "{\n" . (((count($this->vars) > 0 ? "\t" . (implode("\n\t\n\t", $varLines)??'null') . "\n\n" : ""))??'null') . (((count($this->methods) > 0 ? "\t" . (implode("\n\n\t", $this->methods)??'null') . "\n" : ""))??'null') . (((count($this->customs) > 0 ? "\t" . (implode("\n\n\t", $this->customs)??'null') . "\n" : ""))??'null') . "}";
		return $s;
	}

	public function __toString() {
		return $this->toString();
	}
}

