package php.files;

import php.interfaces.RecursiveIterator;
import php.interfaces.SeekableIterator;

@:native("SplFileObject")
extern class SplFileObject extends SplFileInfo implements RecursiveIterator implements SeekableIterator
{
	static var DROP_NEW_LINE(default, null) : Int;
	static var READ_AHEAD(default, null) : Int;
	static var SKIP_EMPTY(default, null) : Int;
	static var READ_CSV(default, null) : Int;

	/**
	 * @return string | array
	 */
	function current() : Dynamic;
	function eof() : Bool;
	function fflush() : Bool;
	function fgetc() : String;
	function fgetcsv(?delimiter:String, ?enclosure:String, ?escape:String) : NativeArray;
	function fgets() : String;
	function fgetss(?allowable_tags:String) : String;
	function flock(operation:Int, ?wouldblock:Int) : Bool;
	function fpassthru() : Int;
	function fputcsv(fields:NativeArray, ?delimiter:String, ?enclosure:String, ?escape:String) : Int;
	function setFlags(flags:Int) : Void;
	function setMaxLineLen(max_len:Int) : Void;
	function valid() : Bool;
	
	function seek(position:Int) : Void;
    function key() : Dynamic;
    function next() : Void;
    function rewind() : Void;
	function getChildren() : RecursiveIterator;
	function hasChildren() : Bool;
}
