package php;

class Tokens
{
	/**
	 * Syntax: abstract
	 * Reference: <a href="language.oop5.abstract.php">Class Abstraction</a> (available since PHP 5.0.0)
	 */
	public static var T_ABSTRACT(get, never) : Int; private static inline function get_T_ABSTRACT() : Int return untyped __php__("T_ABSTRACT");
	
	/**
	 * Syntax: &=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_AND_EQUAL(get, never) : Int; private static inline function get_T_AND_EQUAL() : Int return untyped __php__("T_AND_EQUAL");
	
	/**
	 * Syntax: array()
	 * Reference: <span><a href="function.array.php">array()</a></span>, <a href="language.types.array.php#language.types.array.syntax">array syntax</a>
	 */
	public static var T_ARRAY(get, never) : Int; private static inline function get_T_ARRAY() : Int return untyped __php__("T_ARRAY");
	
	/**
	 * Syntax: (array)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_ARRAY_CAST(get, never) : Int; private static inline function get_T_ARRAY_CAST() : Int return untyped __php__("T_ARRAY_CAST");
	
	/**
	 * Syntax: as
	 * Reference: <a href="control-structures.foreach.php">foreach</a>
	 */
	public static var T_AS(get, never) : Int; private static inline function get_T_AS() : Int return untyped __php__("T_AS");
	
	/**
	 * Syntax:
	 * Reference: anything below ASCII 32 except \t (0x09), \n (0x0a) and \r (0x0d)
	 */
	public static var T_BAD_CHARACTER(get, never) : Int; private static inline function get_T_BAD_CHARACTER() : Int return untyped __php__("T_BAD_CHARACTER");

	/**
	 * Syntax: &&
	 * Reference: <a href="language.operators.logical.php">logical operators</a>
	 */
	public static var T_BOOLEAN_AND(get, never) : Int; private static inline function get_T_BOOLEAN_AND() : Int return untyped __php__("T_BOOLEAN_AND");

	/**
	 * Syntax: ||
	 * Reference: <a href="language.operators.logical.php">logical operators</a>
	 */
	public static var T_BOOLEAN_OR(get, never) : Int; private static inline function get_T_BOOLEAN_OR() : Int return untyped __php__("T_BOOLEAN_OR");
	
	/**
	 * Syntax: (bool) or (boolean)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_BOOL_CAST(get, never) : Int; private static inline function get_T_BOOL_CAST() : Int return untyped __php__("T_BOOL_CAST");
	
	/**
	 * Syntax: break
	 * Reference: <a href="control-structures.break.php">break</a>
	 */
	public static var T_BREAK(get, never) : Int; private static inline function get_T_BREAK() : Int return untyped __php__("T_BREAK");
	
	/**
	 * Syntax: callable
	 * Reference: <a href="language.types.callable.php">callable</a>
	 */
	public static var T_CALLABLE(get, never) : Int; private static inline function get_T_CALLABLE() : Int return untyped __php__("T_CALLABLE");
	
	/**
	 * Syntax: case
	 * Reference: <a href="control-structures.switch.php">switch</a>
	 */
	public static var T_CASE(get, never) : Int; private static inline function get_T_CASE() : Int return untyped __php__("T_CASE");
	
	/**
	 * Syntax: catch
	 * Reference: <a href="language.exceptions.php">Exceptions</a> (available since PHP 5.0.0)
	 */
	public static var T_CATCH(get, never) : Int; private static inline function get_T_CATCH() : Int return untyped __php__("T_CATCH");

	/**
	 * Reference: not used anymore
	 */
	public static var T_CHARACTER(get, never) : Int; private static inline function get_T_CHARACTER() : Int return untyped __php__("T_CHARACTER");

	/**
	 * Syntax: class
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_CLASS(get, never) : Int; private static inline function get_T_CLASS() : Int return untyped __php__("T_CLASS");
	
	/**
	 * Syntax: __CLASS__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 */
	public static var T_CLASS_C(get, never) : Int; private static inline function get_T_CLASS_C() : Int return untyped __php__("T_CLASS_C");
	
	/**
	 * Syntax: clone
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_CLONE(get, never) : Int; private static inline function get_T_CLONE() : Int return untyped __php__("T_CLONE");
	
	/**
	 * Syntax: ?> or %>
	 * Reference: <a href="language.basic-syntax.phpmode.php">escaping from HTML</a>
	 */
	public static var T_CLOSE_TAG(get, never) : Int; private static inline function get_T_CLOSE_TAG() : Int return untyped __php__("T_CLOSE_TAG");
	
	/**
	 * Syntax: // or #, and /*
	 * Reference: <a href="language.basic-syntax.comments.php">comments</a>
	 */
	public static var T_COMMENT(get, never) : Int; private static inline function get_T_COMMENT() : Int return untyped __php__("T_COMMENT");
	
	/**
	 * Syntax: .=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_CONCAT_EQUAL(get, never) : Int; private static inline function get_T_CONCAT_EQUAL() : Int return untyped __php__("T_CONCAT_EQUAL");
	
	/**
	 * Syntax: const
	 * Reference: <a href="language.constants.php">class constants</a>
	 */
	public static var T_CONST(get, never) : Int; private static inline function get_T_CONST() : Int return untyped __php__("T_CONST");
	
	/**
	 * Syntax: "foo" or 'bar'
	 * Reference: <a href="language.types.string.php#language.types.string.syntax">string syntax</a>
	 */
	public static var T_CONSTANT_ENCAPSED_STRING(get, never) : Int; private static inline function get_T_CONSTANT_ENCAPSED_STRING() : Int return untyped __php__("T_CONSTANT_ENCAPSED_STRING");
	
	/**
	 * Syntax: continue
	 * Reference: <a href="control-structures.continue.php">continue</a>
	 */
	public static var T_CONTINUE(get, never) : Int; private static inline function get_T_CONTINUE() : Int return untyped __php__("T_CONTINUE");
	
	/**
	 * Syntax: {$
	 * Reference: <a href="language.types.string.php#language.types.string.parsing.complex">complex variable parsed syntax</a>
	 */
	public static var T_CURLY_OPEN(get, never) : Int; private static inline function get_T_CURLY_OPEN() : Int return untyped __php__("T_CURLY_OPEN");
	
	/**
	 * Syntax: --
	 * Reference: <a href="language.operators.increment.php">incrementing/decrementing operators</a>
	 */
	public static var T_DEC(get, never) : Int; private static inline function get_T_DEC() : Int return untyped __php__("T_DEC");
	
	/**
	 * Syntax: declare
	 * Reference: <a href="control-structures.declare.php">declare</a>
	 */
	public static var T_DECLARE(get, never) : Int; private static inline function get_T_DECLARE() : Int return untyped __php__("T_DECLARE");
	
	/**
	 * Syntax: default
	 * Reference: <a href="control-structures.switch.php">switch</a>
	 */
	public static var T_DEFAULT(get, never) : Int; private static inline function get_T_DEFAULT() : Int return untyped __php__("T_DEFAULT");
	
	/**
	 * Syntax: __DIR__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 * (available since PHP 5.3.0)
	 */
	public static var T_DIR(get, never) : Int; private static inline function get_T_DIR() : Int return untyped __php__("T_DIR");
	
	/**
	 * Syntax: /=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_DIV_EQUAL(get, never) : Int; private static inline function get_T_DIV_EQUAL() : Int return untyped __php__("T_DIV_EQUAL");
	
	/**
	 * Syntax: 0.12, etc.
	 * Reference: <a href="language.types.float.php">floating point numbers</a>
	 */
	public static var T_DNUMBER(get, never) : Int; private static inline function get_T_DNUMBER() : Int return untyped __php__("T_DNUMBER");
	
	/**
	 * Syntax: /**
	 * Reference: <a href="language.basic-syntax.comments.php">PHPDoc style comments</a>
	 */
	public static var T_DOC_COMMENT(get, never) : Int; private static inline function get_T_DOC_COMMENT() : Int return untyped __php__("T_DOC_COMMENT");
	
	/**
	 * Syntax: do
	 * Reference: <a href="control-structures.do.while.php">do..while</a>
	 */
	public static var T_DO(get, never) : Int; private static inline function get_T_DO() : Int return untyped __php__("T_DO");
	
	/**
	 * Syntax: ${
	 * Reference: <a href="language.types.string.php#language.types.string.parsing.complex">complex variable parsed syntax</a>
	 */
	public static var T_DOLLAR_OPEN_CURLY_BRACES(get, never) : Int; private static inline function get_T_DOLLAR_OPEN_CURLY_BRACES() : Int return untyped __php__("T_DOLLAR_OPEN_CURLY_BRACES");
	
	/**
	 * Syntax: =>
	 * Reference: <a href="language.types.array.php#language.types.array.syntax">array syntax</a>
	 */
	public static var T_DOUBLE_ARROW(get, never) : Int; private static inline function get_T_DOUBLE_ARROW() : Int return untyped __php__("T_DOUBLE_ARROW");
	
	/**
	 * Syntax: (real), (double) or (float)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_DOUBLE_CAST(get, never) : Int; private static inline function get_T_DOUBLE_CAST() : Int return untyped __php__("T_DOUBLE_CAST");
	
	/**
	 * Syntax: ::
	 * Reference: see <strong><code>T_PAAMAYIM_NEKUDOTAYIM</code></strong> below
	 */
	public static var T_DOUBLE_COLON(get, never) : Int; private static inline function get_T_DOUBLE_COLON() : Int return untyped __php__("T_DOUBLE_COLON");
	
	/**
	 * Syntax: echo
	 * Reference: <span><a href="function.echo.php">echo</a></span>
	 */
	public static var T_ECHO(get, never) : Int; private static inline function get_T_ECHO() : Int return untyped __php__("T_ECHO");
	
	/**
	 * Syntax: ...
	 * Reference: <a href="functions.arguments.php#functions.variable-arg-list.new">function arguments</a>
	 * (available since PHP 5.6.0)
	 */
	public static var T_ELLIPSIS(get, never) : Int; private static inline function get_T_ELLIPSIS() : Int return untyped __php__("T_ELLIPSIS");
	
	/**
	 * Syntax: else
	 * Reference: <a href="control-structures.else.php">else</a>
	 */
	public static var T_ELSE(get, never) : Int; private static inline function get_T_ELSE() : Int return untyped __php__("T_ELSE");
	
	/**
	 * Syntax: elseif
	 * Reference: <a href="control-structures.elseif.php">elseif</a>
	 */
	public static var T_ELSEIF(get, never) : Int; private static inline function get_T_ELSEIF() : Int return untyped __php__("T_ELSEIF");
	
	/**
	 * Syntax: empty
	 * Reference: <span><a href="function.empty.php">empty()</a></span>
	 */
	public static var T_EMPTY(get, never) : Int; private static inline function get_T_EMPTY() : Int return untyped __php__("T_EMPTY");
	
	/**
	 * Syntax: " $a"
	 * Reference: <a href="language.types.string.php#language.types.string.parsing">constant part of
	string with variables</a>
	 */
	public static var T_ENCAPSED_AND_WHITESPACE(get, never) : Int; private static inline function get_T_ENCAPSED_AND_WHITESPACE() : Int return untyped __php__("T_ENCAPSED_AND_WHITESPACE");
	
	/**
	 * Syntax: enddeclare
	 * Reference: <a href="control-structures.declare.php">declare</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDDECLARE(get, never) : Int; private static inline function get_T_ENDDECLARE() : Int return untyped __php__("T_ENDDECLARE");
	
	/**
	 * Syntax: endfor
	 * Reference: <a href="control-structures.for.php">for</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDFOR(get, never) : Int; private static inline function get_T_ENDFOR() : Int return untyped __php__("T_ENDFOR");
	
	/**
	 * Syntax: endforeach
	 * Reference: <a href="control-structures.foreach.php">foreach</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDFOREACH(get, never) : Int; private static inline function get_T_ENDFOREACH() : Int return untyped __php__("T_ENDFOREACH");
	
	/**
	 * Syntax: endif
	 * Reference: <a href="control-structures.if.php">if</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDIF(get, never) : Int; private static inline function get_T_ENDIF() : Int return untyped __php__("T_ENDIF");
	
	/**
	 * Syntax: endswitch
	 * Reference: <a href="control-structures.switch.php">switch</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDSWITCH(get, never) : Int; private static inline function get_T_ENDSWITCH() : Int return untyped __php__("T_ENDSWITCH");
	
	/**
	 * Syntax: endwhile
	 * Reference: <a href="control-structures.while.php">while</a>, <a href="control-structures.alternative-syntax.php">alternative syntax</a>
	 */
	public static var T_ENDWHILE(get, never) : Int; private static inline function get_T_ENDWHILE() : Int return untyped __php__("T_ENDWHILE");
	
	/**
	 * Reference: <a href="language.types.string.php#language.types.string.syntax.heredoc">heredoc syntax</a>
	 */
	public static var T_END_HEREDOC(get, never) : Int; private static inline function get_T_END_HEREDOC() : Int return untyped __php__("T_END_HEREDOC");

	/**
	 * Syntax: eval()
	 * Reference: <span><a href="function.eval.php">eval()</a></span>
	 */
	public static var T_EVAL(get, never) : Int; private static inline function get_T_EVAL() : Int return untyped __php__("T_EVAL");
	
	/**
	 * Syntax: exit or die
	 * Reference: <span><a href="function.exit.php">exit()</a></span>, <span><a href="function.die.php">die()</a></span>
	 */
	public static var T_EXIT(get, never) : Int; private static inline function get_T_EXIT() : Int return untyped __php__("T_EXIT");
	
	/**
	 * Syntax: extends
	 * Reference: <a href="language.oop5.basic.php#language.oop5.basic.extends">extends</a>, <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_EXTENDS(get, never) : Int; private static inline function get_T_EXTENDS() : Int return untyped __php__("T_EXTENDS");
	
	/**
	 * Syntax: __FILE__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 */
	public static var T_FILE(get, never) : Int; private static inline function get_T_FILE() : Int return untyped __php__("T_FILE");
	
	/**
	 * Syntax: final
	 * Reference: <a href="language.oop5.final.php">Final Keyword</a>
	 */
	public static var T_FINAL(get, never) : Int; private static inline function get_T_FINAL() : Int return untyped __php__("T_FINAL");
	
	/**
	 * Syntax: finally
	 * Reference: <a href="language.exceptions.php">Exceptions</a> (available since PHP 5.5.0)
	 */
	public static var T_FINALLY(get, never) : Int; private static inline function get_T_FINALLY() : Int return untyped __php__("T_FINALLY");
	
	/**
	 * Syntax: for
	 * Reference: <a href="control-structures.for.php">for</a>
	 */
	public static var T_FOR(get, never) : Int; private static inline function get_T_FOR() : Int return untyped __php__("T_FOR");
	
	/**
	 * Syntax: foreach
	 * Reference: <a href="control-structures.foreach.php">foreach</a>
	 */
	public static var T_FOREACH(get, never) : Int; private static inline function get_T_FOREACH() : Int return untyped __php__("T_FOREACH");
	
	/**
	 * Syntax: function or cfunction
	 * Reference: <a href="language.functions.php">functions</a>
	 */
	public static var T_FUNCTION(get, never) : Int; private static inline function get_T_FUNCTION() : Int return untyped __php__("T_FUNCTION");
	
	/**
	 * Syntax: __FUNCTION__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 */
	public static var T_FUNC_C(get, never) : Int; private static inline function get_T_FUNC_C() : Int return untyped __php__("T_FUNC_C");
	
	/**
	 * Syntax: global
	 * Reference: <a href="language.variables.scope.php">variable scope</a>
	 */
	public static var T_GLOBAL(get, never) : Int; private static inline function get_T_GLOBAL() : Int return untyped __php__("T_GLOBAL");
	
	/**
	 * Syntax: goto
	 * Reference: <a href="control-structures.goto.php"> (available since PHP 5.3.0)</a>
	 */
	public static var T_GOTO(get, never) : Int; private static inline function get_T_GOTO() : Int return untyped __php__("T_GOTO");
	
	/**
	 * Syntax: __halt_compiler()
	 * Reference: <a href="function.halt-compiler.php">__halt_compiler</a> (available since PHP 5.1.0)
	 */
	public static var T_HALT_COMPILER(get, never) : Int; private static inline function get_T_HALT_COMPILER() : Int return untyped __php__("T_HALT_COMPILER");
	
	/**
	 * Syntax: if
	 * Reference: <a href="control-structures.if.php">if</a>
	 */
	public static var T_IF(get, never) : Int; private static inline function get_T_IF() : Int return untyped __php__("T_IF");
	
	/**
	 * Syntax: implements
	 * Reference: <a href="language.oop5.interfaces.php">Object Interfaces</a>
	 */
	public static var T_IMPLEMENTS(get, never) : Int; private static inline function get_T_IMPLEMENTS() : Int return untyped __php__("T_IMPLEMENTS");
	
	/**
	 * Syntax: ++
	 * Reference: <a href="language.operators.increment.php">incrementing/decrementing operators</a>
	 */
	public static var T_INC(get, never) : Int; private static inline function get_T_INC() : Int return untyped __php__("T_INC");
	
	/**
	 * Syntax: include()
	 * Reference: <span><a href="function.include.php">include</a></span>
	 */
	public static var T_INCLUDE(get, never) : Int; private static inline function get_T_INCLUDE() : Int return untyped __php__("T_INCLUDE");
	
	/**
	 * Syntax: include_once()
	 * Reference: <span><a href="function.include-once.php">include_once</a></span>
	 */
	public static var T_INCLUDE_ONCE(get, never) : Int; private static inline function get_T_INCLUDE_ONCE() : Int return untyped __php__("T_INCLUDE_ONCE");
	
	/**
	 * Syntax: 
	 * Reference: <a href="language.basic-syntax.phpmode.php">text outside PHP</a>
	 */
	public static var T_INLINE_HTML(get, never) : Int; private static inline function get_T_INLINE_HTML() : Int return untyped __php__("T_INLINE_HTML");

	/**
	 * Syntax: instanceof
	 * Reference: <a href="language.operators.type.php">type operators</a>
	 */
	public static var T_INSTANCEOF(get, never) : Int; private static inline function get_T_INSTANCEOF() : Int return untyped __php__("T_INSTANCEOF");
	
	/**
	 * Syntax: insteadof
	 * Reference: <a href="language.oop5.traits.php">Traits</a> (available since PHP 5.4.0)
	 */
	public static var T_INSTEADOF(get, never) : Int; private static inline function get_T_INSTEADOF() : Int return untyped __php__("T_INSTEADOF");
	
	/**
	 * Syntax: (int) or (integer)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_INT_CAST(get, never) : Int; private static inline function get_T_INT_CAST() : Int return untyped __php__("T_INT_CAST");
	
	/**
	 * Syntax: interface
	 * Reference: <a href="language.oop5.interfaces.php">Object Interfaces</a>
	 */
	public static var T_INTERFACE(get, never) : Int; private static inline function get_T_INTERFACE() : Int return untyped __php__("T_INTERFACE");
	
	/**
	 * Syntax: isset()
	 * Reference: <span><a href="function.isset.php">isset()</a></span>
	 */
	public static var T_ISSET(get, never) : Int; private static inline function get_T_ISSET() : Int return untyped __php__("T_ISSET");
	
	/**
	 * Syntax: ==
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_EQUAL(get, never) : Int; private static inline function get_T_IS_EQUAL() : Int return untyped __php__("T_IS_EQUAL");
	
	/**
	 * Syntax: >=
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_GREATER_OR_EQUAL(get, never) : Int; private static inline function get_T_IS_GREATER_OR_EQUAL() : Int return untyped __php__("T_IS_GREATER_OR_EQUAL");
	
	/**
	 * Syntax: ===
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_IDENTICAL(get, never) : Int; private static inline function get_T_IS_IDENTICAL() : Int return untyped __php__("T_IS_IDENTICAL");
	
	/**
	 * Syntax: != or <>
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_NOT_EQUAL(get, never) : Int; private static inline function get_T_IS_NOT_EQUAL() : Int return untyped __php__("T_IS_NOT_EQUAL");
	
	/**
	 * Syntax: !==
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_NOT_IDENTICAL(get, never) : Int; private static inline function get_T_IS_NOT_IDENTICAL() : Int return untyped __php__("T_IS_NOT_IDENTICAL");
	
	/**
	 * Syntax: <=
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 */
	public static var T_IS_SMALLER_OR_EQUAL(get, never) : Int; private static inline function get_T_IS_SMALLER_OR_EQUAL() : Int return untyped __php__("T_IS_SMALLER_OR_EQUAL");
	
	/**
	 * Syntax: <=>
	 * Reference: <a href="language.operators.comparison.php">comparison operators</a>
	 * (available since PHP 7.0.0)
	 */
	public static var T_SPACESHIP(get, never) : Int; private static inline function get_T_SPACESHIP() : Int return untyped __php__("T_SPACESHIP");
	
	/**
	 * Syntax: __LINE__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 */
	public static var T_LINE(get, never) : Int; private static inline function get_T_LINE() : Int return untyped __php__("T_LINE");
	
	/**
	 * Syntax: list()
	 * Reference: <span><a href="function.list.php">list()</a></span>
	 */
	public static var T_LIST(get, never) : Int; private static inline function get_T_LIST() : Int return untyped __php__("T_LIST");
	
	/**
	 * Syntax: 123, 012, 0x1ac, etc.
	 * Reference: <a href="language.types.integer.php">integers</a>
	 */
	public static var T_LNUMBER(get, never) : Int; private static inline function get_T_LNUMBER() : Int return untyped __php__("T_LNUMBER");
	
	/**
	 * Syntax: and
	 * Reference: <a href="language.operators.logical.php">logical operators</a>
	 */
	public static var T_LOGICAL_AND(get, never) : Int; private static inline function get_T_LOGICAL_AND() : Int return untyped __php__("T_LOGICAL_AND");
	
	/**
	 * Syntax: or
	 * Reference: <a href="language.operators.logical.php">logical operators</a>
	 */
	public static var T_LOGICAL_OR(get, never) : Int; private static inline function get_T_LOGICAL_OR() : Int return untyped __php__("T_LOGICAL_OR");
	
	/**
	 * Syntax: xor
	 * Reference: <a href="language.operators.logical.php">logical operators</a>
	 */
	public static var T_LOGICAL_XOR(get, never) : Int; private static inline function get_T_LOGICAL_XOR() : Int return untyped __php__("T_LOGICAL_XOR");
	
	/**
	 * Syntax: __METHOD__
	 * Reference: <a href="language.constants.predefined.php">magic constants</a>
	 */
	public static var T_METHOD_C(get, never) : Int; private static inline function get_T_METHOD_C() : Int return untyped __php__("T_METHOD_C");
	
	/**
	 * Syntax: -=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_MINUS_EQUAL(get, never) : Int; private static inline function get_T_MINUS_EQUAL() : Int return untyped __php__("T_MINUS_EQUAL");

	/**
	 * Syntax: %=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_MOD_EQUAL(get, never) : Int; private static inline function get_T_MOD_EQUAL() : Int return untyped __php__("T_MOD_EQUAL");

	/**
	 * Syntax: *=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_MUL_EQUAL(get, never) : Int; private static inline function get_T_MUL_EQUAL() : Int return untyped __php__("T_MUL_EQUAL");

	/**
	 * Syntax: namespace
	 * Reference: <a href="language.namespaces.php">namespaces</a> (available since PHP 5.3.0)
	 */
	public static var T_NAMESPACE(get, never) : Int; private static inline function get_T_NAMESPACE() : Int return untyped __php__("T_NAMESPACE");

	/**
	 * Syntax: __NAMESPACE__
	 * Reference: <a href="language.namespaces.php">namespaces</a>
	 * (available since PHP 5.3.0)
	 */
	public static var T_NS_C(get, never) : Int; private static inline function get_T_NS_C() : Int return untyped __php__("T_NS_C");

	/**
	 * Syntax: \
	 * Reference: <a href="language.namespaces.php">namespaces</a>
	 * (available since PHP 5.3.0)
	 */
	public static var T_NS_SEPARATOR(get, never) : Int; private static inline function get_T_NS_SEPARATOR() : Int return untyped __php__("T_NS_SEPARATOR");

	/**
	 * Syntax: new
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_NEW(get, never) : Int; private static inline function get_T_NEW() : Int return untyped __php__("T_NEW");

	/**
	 * Syntax: "$a[0]"
	 * Reference: <a href="language.types.string.php#language.types.string.parsing">numeric array index inside string</a>
	 */
	public static var T_NUM_STRING(get, never) : Int; private static inline function get_T_NUM_STRING() : Int return untyped __php__("T_NUM_STRING");

	/**
	 * Syntax: (object)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_OBJECT_CAST(get, never) : Int; private static inline function get_T_OBJECT_CAST() : Int return untyped __php__("T_OBJECT_CAST");
	
	/**
	 * Syntax: ->
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_OBJECT_OPERATOR(get, never) : Int; private static inline function get_T_OBJECT_OPERATOR() : Int return untyped __php__("T_OBJECT_OPERATOR");

	/**
	 * Syntax: <?php, <? or <%
	 * Reference: <a href="language.basic-syntax.phpmode.php">escaping from HTML</a>
	 */
	public static var T_OPEN_TAG(get, never) : Int; private static inline function get_T_OPEN_TAG() : Int return untyped __php__("T_OPEN_TAG");

	/**
	 * Syntax: <?= or <%=
	 * Reference: <a href="language.basic-syntax.phpmode.php">escaping	from HTML</a>
	 */
	public static var T_OPEN_TAG_WITH_ECHO(get, never) : Int; private static inline function get_T_OPEN_TAG_WITH_ECHO() : Int return untyped __php__("T_OPEN_TAG_WITH_ECHO");

	/**
	 * Syntax: |=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_OR_EQUAL(get, never) : Int; private static inline function get_T_OR_EQUAL() : Int return untyped __php__("T_OR_EQUAL");

	/**
	 * Syntax: ::
	 * Reference: <a href="language.oop5.paamayim-nekudotayim.php">::</a>. Also defined as
	 * <strong><code>T_DOUBLE_COLON</code></strong>.
	 */
	public static var T_PAAMAYIM_NEKUDOTAYIM(get, never) : Int; private static inline function get_T_PAAMAYIM_NEKUDOTAYIM() : Int return untyped __php__("T_PAAMAYIM_NEKUDOTAYIM");

	/**
	 * Syntax: +=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_PLUS_EQUAL(get, never) : Int; private static inline function get_T_PLUS_EQUAL() : Int return untyped __php__("T_PLUS_EQUAL");

	/**
	 * Syntax: **
	 * Reference: <a href="language.operators.arithmetic.php">arithmetic operators</a>
	 * (available since PHP 5.6.0)
	 */
	public static var T_POW(get, never) : Int; private static inline function get_T_POW() : Int return untyped __php__("T_POW");

	/**
	 * Syntax: **=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 * (available since PHP 5.6.0)
	 */
	public static var T_POW_EQUAL(get, never) : Int; private static inline function get_T_POW_EQUAL() : Int return untyped __php__("T_POW_EQUAL");

	/**
	 * Syntax: print()
	 * Reference: <span><a href="function.print.php">print</a></span>
	 */
	public static var T_PRINT(get, never) : Int; private static inline function get_T_PRINT() : Int return untyped __php__("T_PRINT");

	/**
	 * Syntax: private
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_PRIVATE(get, never) : Int; private static inline function get_T_PRIVATE() : Int return untyped __php__("T_PRIVATE");

	/**
	 * Syntax: public
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_PUBLIC(get, never) : Int; private static inline function get_T_PUBLIC() : Int return untyped __php__("T_PUBLIC");

	/**
	 * Syntax: protected
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_PROTECTED(get, never) : Int; private static inline function get_T_PROTECTED() : Int return untyped __php__("T_PROTECTED");

	/**
	 * Syntax: require()
	 * Reference: <span><a href="function.require.php">require</a></span>
	 */
	public static var T_REQUIRE(get, never) : Int; private static inline function get_T_REQUIRE() : Int return untyped __php__("T_REQUIRE");

	/**
	 * Syntax: require_once()
	 * Reference: <span><a href="function.require-once.php">require_once</a></span>
	 */
	public static var T_REQUIRE_ONCE(get, never) : Int; private static inline function get_T_REQUIRE_ONCE() : Int return untyped __php__("T_REQUIRE_ONCE");

	/**
	 * Syntax: return
	 * Reference: <a href="functions.returning-values.php">returning values</a>
	 */
	public static var T_RETURN(get, never) : Int; private static inline function get_T_RETURN() : Int return untyped __php__("T_RETURN");

	/**
	 * Syntax: <<
	 * Reference: <a href="language.operators.bitwise.php">bitwise operators</a>
	 */
	public static var T_SL(get, never) : Int; private static inline function get_T_SL() : Int return untyped __php__("T_SL");

	/**
	 * Syntax: <<=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_SL_EQUAL(get, never) : Int; private static inline function get_T_SL_EQUAL() : Int return untyped __php__("T_SL_EQUAL");

	/**
	 * Syntax: >>
	 * Reference: <a href="language.operators.bitwise.php">bitwise operators</a>
	 */
	public static var T_SR(get, never) : Int; private static inline function get_T_SR() : Int return untyped __php__("T_SR");

	/**
	 * Syntax: >>=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_SR_EQUAL(get, never) : Int; private static inline function get_T_SR_EQUAL() : Int return untyped __php__("T_SR_EQUAL");

	/**
	 * Syntax: <<<
	 * Reference: <a href="language.types.string.php#language.types.string.syntax.heredoc">heredoc syntax</a>
	 */
	public static var T_START_HEREDOC(get, never) : Int; private static inline function get_T_START_HEREDOC() : Int return untyped __php__("T_START_HEREDOC");

	/**
	 * Syntax: static
	 * Reference: <a href="language.variables.scope.php">variable scope</a>
	 */
	public static var T_STATIC(get, never) : Int; private static inline function get_T_STATIC() : Int return untyped __php__("T_STATIC");

	/**
	 * Syntax: parent, self, etc.
	 * Reference: identifiers, e.g. keywords like <em>parent</em> and <em>self</em>,
	 * function names, class names and more are matched.
	 * See also <strong><code>T_CONSTANT_ENCAPSED_STRING</code></strong>.
	 */
	public static var T_STRING(get, never) : Int; private static inline function get_T_STRING() : Int return untyped __php__("T_STRING");

	/**
	 * Syntax: (string)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_STRING_CAST(get, never) : Int; private static inline function get_T_STRING_CAST() : Int return untyped __php__("T_STRING_CAST");

	/**
	 * Syntax: "${a
	 * Reference: <a href="language.types.string.php#language.types.string.parsing.complex">complex
	 * variable parsed syntax</a>
	 */
	public static var T_STRING_VARNAME(get, never) : Int; private static inline function get_T_STRING_VARNAME() : Int return untyped __php__("T_STRING_VARNAME");

	/**
	 * Syntax: switch
	 * Reference: <a href="control-structures.switch.php">switch</a>
	 */
	public static var T_SWITCH(get, never) : Int; private static inline function get_T_SWITCH() : Int return untyped __php__("T_SWITCH");

	/**
	 * Syntax: throw
	 * Reference: <a href="language.exceptions.php">Exceptions</a>
	 */
	public static var T_THROW(get, never) : Int; private static inline function get_T_THROW() : Int return untyped __php__("T_THROW");
	
	/**
	 * Syntax: trait
	 * Reference: <a href="language.oop5.traits.php">Traits</a> (available since PHP 5.4.0)
	 */
	public static var T_TRAIT(get, never) : Int; private static inline function get_T_TRAIT() : Int return untyped __php__("T_TRAIT");

	/**
	 * Syntax: __TRAIT__
	 * Reference: <a href="">__TRAIT__</a> (available since PHP 5.4.0)
	 */
	public static var T_TRAIT_C(get, never) : Int; private static inline function get_T_TRAIT_C() : Int return untyped __php__("T_TRAIT_C");

	/**
	 * Syntax: try
	 * Reference: <a href="language.exceptions.php">Exceptions</a>
	 */
	public static var T_TRY(get, never) : Int; private static inline function get_T_TRY() : Int return untyped __php__("T_TRY");

	/**
	 * Syntax: unset()
	 * Reference: <span><a href="function.unset.php">unset()</a></span>
	 */
	public static var T_UNSET(get, never) : Int; private static inline function get_T_UNSET() : Int return untyped __php__("T_UNSET");

	/**
	 * Syntax: (unset)
	 * Reference: <a href="language.types.type-juggling.php#language.types.typecasting">type-casting</a>
	 */
	public static var T_UNSET_CAST(get, never) : Int; private static inline function get_T_UNSET_CAST() : Int return untyped __php__("T_UNSET_CAST");

	/**
	 * Syntax: use
	 * Reference: <a href="language.namespaces.php">namespaces</a>
	 * (available since PHP 5.3.0; reserved since PHP 4.0.0)
	 */
	public static var T_USE(get, never) : Int; private static inline function get_T_USE() : Int return untyped __php__("T_USE");

	/**
	 * Syntax: var
	 * Reference: <a href="language.oop5.php">classes and objects</a>
	 */
	public static var T_VAR(get, never) : Int; private static inline function get_T_VAR() : Int return untyped __php__("T_VAR");

	/**
	 * Syntax: $foo
	 * Reference: <a href="language.variables.php">variables</a>
	 */
	public static var T_VARIABLE(get, never) : Int; private static inline function get_T_VARIABLE() : Int return untyped __php__("T_VARIABLE");

	/**
	 * Syntax: while
	 * Reference: <a href="control-structures.while.php">while</a>, <a href="control-structures.do.while.php">do..while</a>
	 */
	public static var T_WHILE(get, never) : Int; private static inline function get_T_WHILE() : Int return untyped __php__("T_WHILE");
	
	/**
	 * Syntax: ^=
	 * Reference: <a href="language.operators.assignment.php">assignment operators</a>
	 */
	public static var T_XOR_EQUAL(get, never) : Int; private static inline function get_T_XOR_EQUAL() : Int return untyped __php__("T_XOR_EQUAL");
	
	/**
	 * Syntax: \t \r\n
	 */
	public static var T_WHITESPACE(get, never) : Int; private static inline function get_T_WHITESPACE() : Int return untyped __php__("T_WHITESPACE");
	
	/**
	 * Syntax: yield
	 * Reference: <a href="language.generators.syntax.php#control-structures.yield">generators</a> (available since PHP 5.5.0)
	 */
	public static var T_YIELD(get, never) : Int; private static inline function get_T_YIELD() : Int return untyped __php__("T_YIELD");
}