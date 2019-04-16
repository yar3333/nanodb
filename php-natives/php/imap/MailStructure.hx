package php.imap;

typedef MailStructure =
{
	/**
	 * Primary body type
	 */
	var type : Int;
	
	/**
	 * Body transfer encoding
	 */
	var encoding : Int;
	
	/**
	 * TRUE if there is a subtype string
	 */
	var ifsubtype : Bool;
	
	/**
	 * MIME subtype
	 */
	var subtype : String;
	
	/**
	 * TRUE if there is a description string
	 */
	var ifdescription : Bool;
	
	/**
	 * Content description string
	 */
	var description : String;
	
	/**
	 * TRUE if there is an identification string
	 */
	var ifid : Bool;
	
	/**
	 * Identification string
	 */
	var id : String;
	
	/**
	 * Number of lines
	 */
	var lines : Int;
	
	/**
	 * Number of bytes
	 */
	var bytes : Int;
	
	/**
	 * TRUE if there is a disposition string
	 */
	var ifdisposition : Bool;
	
	/**
	 * Disposition string
	 */
	var disposition : String;
	
	/**
	 * TRUE if the dparameters array exists
	 */
	var ifdparameters : Bool;
	
	/**
	 * An array of objects where each object has an "attribute" and a "value" property corresponding to the parameters on the Content-disposition MIME header.
	 */
	var dparameters : TypedArray<{ attribute:String, value:Dynamic }>;
	
	/**
	 * TRUE if the parameters array exists
	 */
	var ifparameters : Bool;
	
	/**
	 * An array of objects where each object has an "attribute" and a "value" property.
	 */
	var parameters : TypedArray<{ attribute:String, value:Dynamic }>;
	
	/**
	 * An array of objects identical in structure to the top-level object, each of which corresponds to a MIME body part.
	 */
	var parts : TypedArray<Dynamic>;
}