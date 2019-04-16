package php.imap;

typedef ImapOverview =
{
	var subject : String; // the mails subject
	var from : String; // who sent it
	var to : String; // recipient
	var date : String; // when was it sent
	var message_id : String; // Mail-ID
	var references : String; // is a reference to this mail id
	var in_reply_to : String; // is a reply to this mail id
	var size : Int; // size in bytes
	var uid : String; // UID the mail has in the mailbox
	var msgno : Int; // mail sequence number in the mailbox
	var recent : Bool; // this mail is flagged as recent
	var flagged : Bool; // this mail is flagged
	var answered : Bool; // this mail is flagged as answered
	var deleted : Bool; // this mail is flagged for deletion
	var seen : Bool; // this mail is flagged as already read
	var draft : Bool; // this mail is flagged as being a draft		
}