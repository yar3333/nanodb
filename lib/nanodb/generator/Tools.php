<?php

namespace nanodb\generator;

class Tools
{
	/**
	 * @param string $s
	 * @return string
	 */
	static public function capitalize($s)
    {
		if ($s === "") return $s;
    	return mb_strtoupper(mb_substr($s, 0, 1)) . mb_substr($s, 1, null);
	}

	/**
	 * @param string $field
	 * @return string
	 */
	static public function fieldAsFunctionNamePart($field)
    {
		return Tools::capitalize(preg_replace_callback("/_[a-z]/", function ($arr) {
			return (function ()  use (&$arr) {
				$_this = mb_substr($arr[0], 1, null);
				return mb_strtoupper($_this);
			})();
		}, $field, -1));
	}

	/**
	 * @param string $fullClassName
	 * @return string
	 */
	static public function getNamespace($fullClassName)
    {
		$parts = explode(".", $fullClassName);
		if (count($parts) <= 1) return "";
		return implode(".", array_slice($parts, 0, count($parts) - 1));
	}

	/**
	 * @param string $path
	 * @return void
	 */
	static public function mkdir($path)
    {
		if (!file_exists($path)) mkdir($path, 511, true);
	}

	/**
	 * @param string $word
	 * @return string
	 */
	static public function pluralToSingular($word)
    {
		if ($word === "person") return "people";

		if (substr($word, -mb_strlen("xes")) === "xes" || substr($word, -mb_strlen("ses")) === "ses" || substr($word, -mb_strlen("zes")) === "zes" || substr($word, -mb_strlen("shes")) === "shes" || substr($word, -mb_strlen("ches")) === "ches") {
			return mb_substr($word, 0, mb_strlen($word) - 2);
		}
		if (substr($word, -mb_strlen("ies")) === "ies") {
			return mb_substr($word, 0, mb_strlen($word) - 3) . "y";
		}
		if (substr($word, -mb_strlen("s")) === "s") {
			return mb_substr($word, 0, mb_strlen($word) - 1);
		}
		return $word;
	}

	/**
	 * @param string $longType
	 * @param bool $fromRoot
	 * @return string
	 */
	static public function toPhpType ($longType, $fromRoot = true)
    {
		if ($fromRoot === null) $fromRoot = true;
		return ($fromRoot ? "\\" : "") . str_replace(".", "\\", $longType);
	}
}
