<?php

namespace nanodb\generator;

class PhpClass
{
	/**
	 * @var string
	 */
	public $baseFullClassName;

	/**
	 * @var mixed
	 */
	public $classComments;

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
	public $globalComments;

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
	 * @return void
	 */
	public function __construct ($fullClassName, $baseFullClassName = null)
    {
		$this->fullClassName = $fullClassName;
		$this->baseFullClassName = $baseFullClassName;
		$this->globalComments = [];
		$this->classComments = [];
		$this->imports = [];
		$this->vars = [];
		$this->methods = [];
		$this->customs = [];
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public function addClassComment($text)
    {
		$this->classComments[] = $text;
	}

	/**
	 * @param string $code
	 * @return void
	 */
	public function addCustom($code)
    {
		$this->customs[] = $code;
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public function addGlobalComment($text)
    {
		$this->globalComments[] = $text;
	}

	/**
	 * @param string $className
	 * @return void
	 */
	public function addImport ($className)
    {
		$this->imports[] = 'use ' . Tools::toPhpType($className) . ';';
	}

	/**
	 * @param string $name
	 * @param mixed $vars
	 * @param string $retType
	 * @param string $body
	 * @param string $access
	 * @param bool $isStatic
	 * @return void
	 */
	public function addMethod ($name, $vars, $retType, $body, $access = 'public', $isStatic = false)
    {
		if ($access === null) $access = 'public';
		if ($isStatic === null) $isStatic = false;

		$header = $this->getMethodComment($vars, $retType) . "$access " . ($isStatic ? 'static ' : '') . 'function ' . $name . '(' . implode(', ', array_map(function($v) {
			return (($v->haxeType !== null ? $this->renderPhpType($v->haxeType) . ' ' : '')) . '$' . $v->haxeName . ((($v->haxeDefVal !== null ? '=' . $v->haxeDefVal : ''))??'null');
		}, $vars)) . ')' . (($retType !== null ? ' : ' . $this->renderPhpType($retType) : ''));
		$s = $header . (($body !== null && trim($body) !== '' ? "\n\t{\n" . $this->indent(trim($body), "\t\t") . "\n\t}" : ' {}'));
		$this->methods[] = $s;
	}

	/**
	 * @param PhpVar $v
	 * @param bool $isStatic
	 * @return void
	 */
	public function addProperty($v, $isStatic = false)
    {
		if ($isStatic === null) $isStatic = false;
		$this->addVar($v, 'protected', $isStatic);
		$this->addMethod('get' . Tools::capitalize($v->haxeName), [], $v->haxeType, '{ return $this->' . $v->haxeName . '; }', 'public', $isStatic);
		$this->addMethod('set' . Tools::capitalize($v->haxeName), [new PhpVar($v->haxeName, $v->haxeType)], $v->haxeType, '{ $this->' . $v->haxeName . ' = ' . $v->haxeName . '; }', 'public', $isStatic);
	}

	/**
	 * @param PhpVar $v
	 * @param string $access
	 * @param bool $isStatic
	 * @return void
	 */
	public function addVar ($v, $access = 'public', $isStatic = false)
    {
		if ($access === null) {
			$access = 'public';
		}
		if ($isStatic === null) {
			$isStatic = false;
		}
		if ($v !== null) {
			$s = ((($v->haxeType !== null ? "/**\n * @var " . $this->processPhpDocType($v->haxeType) . "\n */\n" : ''))??'null') . (($access . ' ')??'null') . ((($isStatic ? 'static ' : ''))??'null') . '$' . $v->haxeName . ((($v->haxeDefVal !== null ? ' = ' . $v->haxeDefVal : ''))??'null') . ';';
			$this->vars[] = $s;
		} else {
			$this->vars[] = '';
		}
	}

	/**
	 * @param mixed $vars
	 * @param string $retType
	 * @return string
	 */
	public function getMethodComment($vars, $retType)
    {
		if (!current(array_filter($vars, static function($x) { return mb_strpos($x->haxeType??'', '[]') !== false; })) && mb_strpos($retType??'', '[]') === false) return '';

		$r = "/**\n";
		$_g = 0;
		while ($_g < \count($vars)) {
			$v = $vars[$_g];
			++$_g;
			$r .= "\t * @param " . $this->processPhpDocType($v->haxeType) . ' $' . $v->haxeName . "\n";
		}

		$r .= "\t * @return " . $this->processPhpDocType($retType) . "\n";
		$r .= "\t */\n\t";
		return $r;
	}

	/**
	 * @param string $fullClassName
	 * @return string
	 */
	public function getNamespaceName($fullClassName)
    {
		if (mb_strpos($fullClassName, '.') !== false) {
			return mb_substr($fullClassName, 0, mb_strrpos($fullClassName, '.'));
		}
		return '';
	}

	/**
	 * @param string $fullClassName
	 * @return string
	 */
	public function getShortClassName($fullClassName)
    {
		if (mb_strpos($fullClassName, '.') !== false) {
			return mb_substr($fullClassName, mb_strrpos($fullClassName, '.') + 1, null);
		}
		return $fullClassName;
	}

	/**
	 * @param string $text
	 * @param string $ind
	 * @return string
	 */
	public function indent($text, $ind = "\t")
    {
		if ($ind === null) $ind = "\t";
		if ($text === '') return '';
		return $ind . str_replace("\n", "\n" . $ind, $text);
	}

	/**
	 * @param string $type
	 * @return string
	 */
	public function processPhpDocType($type)
    {
		if (strncmp($type, '?', 1) === 0) {
			return mb_substr($type, 1, null) . '|null';
		}
		return $type;
	}

	/**
	 * @param string $type
	 * @return string
	 */
	public function renderPhpType($type)
    {
        return mb_strpos($type, '[]') !== false ? 'array' : $type;
	}

	/**
	 * @return string
	 */
	public function toString()
    {
		$varLines = [];
		$collection = $this->vars;
		foreach ($collection as $key => $value) {
			$varLines[] = str_replace("\n", "\n\t", $value);
		}

        return "<?php\n\n"
. implode("\n", $this->globalComments)
. (\count($this->globalComments) > 0 ? "\n\n" : '')
. 'namespace ' . Tools::toPhpType($this->getNamespaceName($this->fullClassName), false) . ";\n"
. "\n"
. implode("\n", $this->imports)
. (\count($this->imports) > 0 ? "\n\n" : '')
. implode("\n", $this->classComments)
. (\count($this->classComments) > 0 ? "\n" : '')
. 'class ' . $this->getShortClassName($this->fullClassName) . ($this->baseFullClassName !== null ? ' extends ' . Tools::toPhpType($this->baseFullClassName) : '')
. "\n"
. "{\n"
. (\count($this->vars) > 0 ? "\t" . implode("\n\t\n\t", $varLines) . "\n\n" : '')
. (\count($this->methods) > 0 ? "\t" . implode("\n\n\t", $this->methods) . "\n" : '')
. (\count($this->customs) > 0 ? "\t" . implode("\n\n\t", $this->customs) . "\n" : '')
. '}';
	}

	public function __toString()
    {
		return $this->toString();
	}
}

