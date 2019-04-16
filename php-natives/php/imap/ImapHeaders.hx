package php.imap;

typedef ImapHeaders =
{
	var toaddress : String;
	var to : TypedArray<MailAddress>;
	var fromaddress : String;
	var from : TypedArray<MailAddress>; // an array of objects from the From: line, with the following properties: personal, adl, mailbox, and host
	var ccaddress : String;
	var cc : TypedArray<MailAddress>;
	var bccaddress : String; // full bcc: line, up to 1024 characters
	var bcc : TypedArray<MailAddress>;
	var reply_toaddress : String;
	var reply_to : TypedArray<MailAddress>;
	var senderaddress : String;
	var sender : TypedArray<MailAddress>;
	var return_pathaddress : String;
	var return_path : TypedArray<MailAddress>;
	var remail : String;
	var date : String;
	var Date : String; // Same as date
	var subject : String;
	var Subject : String; // Same as subject
	var in_reply_to : String;
	var message_id : String;
	var newsgroups : String;
	var followup_to : String;
	var references : String;
	var Recent : String; // R if recent and seen, N if recent and not seen, ' ' if not recent.
	var Unseen : String; // U if not seen AND not recent, ' ' if seen OR not seen and recent
	var Flagged : String; // F if flagged, ' ' if not flagged
	var Answered : String; // A if answered, ' ' if unanswered
	var Deleted : String; // D if deleted, ' ' if not deleted
	var Draft : String; // X if draft, ' ' if not draft
	var Msgno : Int; // The message number
	var MailDate : String;
	var Size : Int; // The message size
	var udate : String; // mail message date in Unix time
	var fetchfrom : String; // from line formatted to fit fromlength characters
	var fetchsubject : String; // subject line formatted to fit subjectlength characters
}