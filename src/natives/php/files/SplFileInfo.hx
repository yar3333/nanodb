package php.files;

@:native("SplFileInfo")
extern class SplFileInfo
{
	function new(file_name:String) : Void;
	function getATime() : Int;
	function getBasename(?suffix:String) : String;
	function getCTime() : Int;
	function getExtension() : String;
	function getFileInfo(?class_name:String) : SplFileInfo;
	function getFilename() : String;
	function getGroup() : Int;
	function getInode() : Int;
	function getLinkTarget() : String;
	function getMTime() : Int;
	function getOwner() : Int;
	function getPath() : String;
	function getPathInfo(?class_name:String) : SplFileInfo;
	function getPathname() : String;
	function getPerms() : Int;
	function getRealPath() : String;
	function getSize() : Int;
	function getType() : String;
	function isDir() : Bool;
	function isExecutable() : Bool;
	function isFile() : Bool;
	function isLink() : Bool;
	function isReadable() : Bool;
	function isWritable() : Bool;
	function openFile(?open_mode:String, ?use_include_path:Bool, ?context:Resource) : SplFileObject;
	function setFileClass(?class_name:String) : Void;
	function setInfoClass(?class_name:String) : Void;
	function __toString() : Void;
}
