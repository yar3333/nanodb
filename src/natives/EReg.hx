import haxe.extern.EitherType;
import php.*;
using php.StringToolsNative;

class EReg {

	var r : Dynamic;
	var last : String;
	var global : Bool;
	var pattern : String;
	var options : String;
	var re : String;
	var matches : NativeIndexedArray<NativeIndexedArray<EitherType<Int,String>>>;

	public function new( r : String, opt : String ) : Void {
		this.pattern = r;
		options = Global.str_replace('g', '', opt);
		global = options != opt;
		this.re = '"' + Global.str_replace('"', '\\"', r) + '"u' + options;
	}

	public function match( s : String ) : Bool {
		var p : Int = Global.preg_match(re, s, matches, Const.PREG_OFFSET_CAPTURE);

		if (p > 0) {
			last = s;
		} else {
			last = null;
		}
		return p > 0;
	}

	public function matched( n : Int ) : String {
		if (matches == null ||  n < 0) throw "EReg::matched";
		// we can't differenciate between optional groups at the end of a match
		// that have not been matched and invalid groups
		if (n >= Global.count(matches)) return null;
		if ((matches[n][1]:Int) < 0) return null;
		return matches[n][0];
	}

	public function matchedLeft() : String {
		if (Global.count(matches) == 0) throw "No string matched";
		return Global.substr(last, 0, matches[0][1]);
	}

	public function matchedRight() : String {
		if (Global.count(matches) == 0) throw "No string matched";
		var x : Int = (matches[0][1]:Int) + Global.strlen(matches[0][0]);
		return Global.substr(last, x);
	}

	public function matchedPosAssoc() : TypedAssoc<String, Int> { // { pos : Int, len : Int }
		return cast Syntax.assocDecl({
			pos : Global.mb_strlen(Global.substr(last, 0, matches[0][1])),
			len : Global.mb_strlen(matches[0][0])
		});
	}

	public function matchSub( s : String, pos : Int, len : Int = -1):Bool {
		var subject = len < 0 ? s : s.substrNative(0, pos + len);
		var p : Int = Global.preg_match(re, subject, matches, Const.PREG_OFFSET_CAPTURE, pos);
		if(p > 0) {
			last = s;
		}
		else {
			last = null;
		}
		return p > 0;
	}

	public function splitAssoc( s : String ) : TypedArray<String> {
		return cast Global.preg_split(re, s, (global ? -1 : 2));
	}

	public function replace( s : String, by : String ) : String {
		by = Global.str_replace("\\$", "\\\\$", by);
		by = Global.str_replace("$$", "\\$", by);
		if (!Global.preg_match('/\\\\([^?].*?\\\\)/', re)) {
			by = Global.preg_replace('/\\$(\\d+)/', '\\$\\1', by);
		}
		return Global.preg_replace(re, by, s, global ? -1 : 1);
	}

	public function map( s : String, f : EReg -> String ) : String {
		var offset = 0;
		var buf = "";
		var length = s.length;
		do {
			if (offset >= length) {
				break;
			} else if (!matchSub(s, offset)) {
				buf += s.substrNative(offset);
				break;
			}
			var p = matchedPosAssoc();
			buf += s.substr(offset, p['pos'] - offset);
			buf += f(this);
			if (p['len'] == 0) {
				buf += s.substrNative(p['pos'], 1);
				offset = p['pos'] + 1;
			}
			else {
				offset = p['pos'] + p['len'];
			}
		} while (global);
		if (!global && offset > 0 && offset < length) {
			buf += s.substrNative(offset);
		}
		return buf;
	}

	public static inline function escape( s : String ) : String {
		return Global.preg_quote(s);
	}
}
