package php.imap;

typedef MailboxInfo =
{
	var Date : Int;
	var Driver : String;
	var Mailbox : String;
	var Nmsgs : Int;
	var Recent: Int;
	var Unread : Int;
	var Deleted : Int;
	var Size : Int;
}