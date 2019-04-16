package php.imap;

class ImapStatusFlags
{
	/**
	 * set $status->messages to the number of messages in the mailbox
	 */
	public static var SA_MESSAGES(get, never) : Int; private static inline function get_SA_MESSAGES() : Int return untyped __php__("SA_MESSAGES");

	/**
	 * set $status->recent to the number of recent messages in the mailbox
	 */
	public static var SA_RECENT(get, never) : Int; private static inline function get_SA_RECENT() : Int return untyped __php__("SA_RECENT");

	/**
	 * set $status->unseen to the number of unseen (new) messages in the mailbox
	 */
	public static var SA_UNSEEN(get, never) : Int; private static inline function get_SA_UNSEEN() : Int return untyped __php__("SA_UNSEEN");

	/**
	 * set $status->uidnext to the next uid to be used in the mailbox
	 */
	public static var SA_UIDNEXT(get, never) : Int; private static inline function get_SA_UIDNEXT() : Int return untyped __php__("SA_UIDNEXT");

	/**
	 * set $status->uidvalidity to a constant that changes when uids for the mailbox may no longer be valid
	 */
	public static var SA_UIDVALIDITY(get, never) : Int; private static inline function get_SA_UIDVALIDITY() : Int return untyped __php__("SA_UIDVALIDITY");

	/**
	 * set all of the above
	 */
	public static var SA_ALL(get, never) : Int; private static inline function get_SA_ALL() : Int return untyped __php__("SA_ALL");
}