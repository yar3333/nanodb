package php;

import php.imap.*;

class ImapNatives
{
	public static inline function imap_8bit(str:String) : String return untyped __call__('imap_8bit', str);
	
	public static inline function imap_alerts() : NativeArray return untyped __call__('imap_alerts');
	
	public static function imap_append(imap_stream:ImapStream, mailbox:String, message:String, ?options:String, ?internal_date:String) : Bool
	{
		if (internal_date == null)
		{
			if (options == null)
			{
				return untyped __call__('imap_append', imap_stream, mailbox, message);
			}
			else
			{
				return untyped __call__('imap_append', imap_stream, mailbox, message, options);
			}
		}
		else
		{
			return untyped __call__('imap_append', imap_stream, mailbox, message, options, internal_date);
		}
	}

	
	public static inline function imap_base64(text:String) : String return untyped __call__('imap_base64', text);
	
	public static inline function imap_binary(str:String) : String return untyped __call__('imap_binary', str);
	
	public static inline function imap_body(imap_stream:ImapStream, msg_number:Int, options=0) : String return untyped __call__('imap_body', imap_stream, msg_number, options);
	
	public static inline function imap_bodystruct(imap_stream:ImapStream, msg_number:Int, section:String) : Dynamic return untyped __call__('imap_bodystruct', imap_stream, msg_number, section);
	
	public static inline function imap_check(imap_stream:ImapStream) : Dynamic return untyped __call__('imap_check', imap_stream);
	
	public static inline function imap_clearflag_full(imap_stream:ImapStream, sequence:String, flag:String, options=0) : Bool return untyped __call__('imap_clearflag_full', imap_stream, sequence, flag, options);
	
	public static inline function imap_close(imap_stream:ImapStream, flag=0) : Bool return untyped __call__('imap_close', imap_stream, flag);
	
	public static inline function imap_createmailbox(imap_stream:ImapStream, mailbox:String) : Bool return untyped __call__('imap_createmailbox', imap_stream, mailbox);
	
	public static inline function imap_delete(imap_stream:ImapStream, msg_number:Int, options=0) : Bool return untyped __call__('imap_delete', imap_stream, msg_number, options);
	
	public static inline function imap_deletemailbox(imap_stream:ImapStream, mailbox:String) : Bool return untyped __call__('imap_deletemailbox', imap_stream, mailbox);
	
	public static inline function imap_errors() : NativeArray return untyped __call__('imap_errors');
	
	public static inline function imap_expunge(imap_stream:ImapStream) : Bool return untyped __call__('imap_expunge', imap_stream);
	
	public static inline function imap_fetch_overview(imap_stream:ImapStream, sequence:String, options=0) : TypedArray<Int,ImapOverview> return untyped __call__('imap_fetch_overview', imap_stream, sequence, options);
	
	public static inline function imap_fetchbody(imap_stream:ImapStream, msg_number:Int, section:String, options=0) : String return untyped __call__('imap_fetchbody', imap_stream, msg_number, section, options);
	
	public static inline function imap_fetchheader(imap_stream:ImapStream, msg_number:Int, options=0) : String return untyped __call__('imap_fetchheader', imap_stream, msg_number, options);
	
	public static inline function imap_fetchmime(imap_stream:ImapStream, msg_number:Int, section:String, options=0) : String return untyped __call__('imap_fetchmime', imap_stream, msg_number, section, options);
	
	public static inline function imap_fetchstructure(imap_stream:ImapStream, msg_number:Int, options=0) : MailStructure return untyped __call__('imap_fetchstructure', imap_stream, msg_number, options);
	
	public static inline function imap_gc(imap_stream:ImapStream, caches:Int) : Bool return untyped __call__('imap_gc', imap_stream, caches);
	
	public static inline function imap_get_quota(imap_stream:ImapStream, quota_root:String) : NativeArray return untyped __call__('imap_get_quota', imap_stream, quota_root);
	
	public static inline function imap_get_quotaroot(imap_stream:ImapStream, quota_root:String) : NativeArray return untyped __call__('imap_get_quotaroot', imap_stream, quota_root);
	
	public static inline function imap_getacl(imap_stream:ImapStream, mailbox:String) : NativeArray return untyped __call__('imap_getacl', imap_stream, mailbox);
	
	public static inline function imap_getmailboxes(imap_stream:ImapStream, ref:String, pattern:String) : NativeArray return untyped __call__('imap_getmailboxes', imap_stream, ref, pattern);
	
	public static inline function imap_getsubscribed(imap_stream:ImapStream, ref:String, pattern:String) : NativeArray return untyped __call__('imap_getsubscribed', imap_stream, ref, pattern);
	
	public static function imap_headerinfo(imap_stream:ImapStream, msg_number:Int, fromlength=0, subjectlength=0, ?defaulthost:String) : Dynamic
	{
		if (defaulthost == null)
		{
			return untyped __call__('imap_headerinfo', imap_stream, msg_number, fromlength, subjectlength);
		}
		else
		{
			return untyped __call__('imap_headerinfo', imap_stream, msg_number, fromlength, subjectlength, defaulthost);
		}
	}

	
	public static inline function imap_headers(imap_stream:ImapStream) : NativeArray return untyped __call__('imap_headers', imap_stream);
	
	public static inline function imap_last_error() : String return untyped __call__('imap_last_error');
	
	public static inline function imap_list(imap_stream:ImapStream, ref:String, pattern:String) : TypedArray<Int,String> return untyped __call__('imap_list', imap_stream, ref, pattern);
	
	public static inline function imap_listscan(imap_stream:ImapStream, ref:String, pattern:String, content:String) : NativeArray return untyped __call__('imap_listscan', imap_stream, ref, pattern, content);
	
	public static inline function imap_lsub(imap_stream:ImapStream, ref:String, pattern:String) : NativeArray return untyped __call__('imap_lsub', imap_stream, ref, pattern);
	
	public static inline function imap_mail_compose(envelope:NativeArray, body:NativeArray) : String return untyped __call__('imap_mail_compose', envelope, body);
	
	public static inline function imap_mail_copy(imap_stream:ImapStream, msglist:String, mailbox:String, options=0) : Bool return untyped __call__('imap_mail_copy', imap_stream, msglist, mailbox, options);
	
	public static inline function imap_mail_move(imap_stream:ImapStream, msglist:String, mailbox:String, options=0) : Bool return untyped __call__('imap_mail_move', imap_stream, msglist, mailbox, options);
	
	public static function imap_mail(to:String, subject:String, message:String, ?additional_headers:String, ?cc:String, ?bcc:String, ?rpath:String) : Bool
	{
		if (rpath == null)
		{
			if (bcc == null)
			{
				if (cc == null)
				{
					if (additional_headers == null)
					{
						return untyped __call__('imap_mail', to, subject, message);
					}
					else
					{
						return untyped __call__('imap_mail', to, subject, message, additional_headers);
					}
				}
				else
				{
					return untyped __call__('imap_mail', to, subject, message, additional_headers, cc);
				}
			}
			else
			{
				return untyped __call__('imap_mail', to, subject, message, additional_headers, cc, bcc);
			}
		}
		else
		{
			return untyped __call__('imap_mail', to, subject, message, additional_headers, cc, bcc, rpath);
		}
	}

	
	public static inline function imap_mailboxmsginfo(imap_stream:ImapStream) : MailboxInfo return untyped __call__('imap_mailboxmsginfo', imap_stream);
	
	public static inline function imap_mime_header_decode(text:String) : TypedArray<Int, { charset:String, text:String }> return untyped __call__('imap_mime_header_decode', text);
	
	public static inline function imap_msgno(imap_stream:ImapStream, uid:Int) : Int return untyped __call__('imap_msgno', imap_stream, uid);
	
	public static inline function imap_num_msg(imap_stream:ImapStream) : Int return untyped __call__('imap_num_msg', imap_stream);
	
	public static inline function imap_num_recent(imap_stream:ImapStream) : Int return untyped __call__('imap_num_recent', imap_stream);
	
	public static inline function imap_open(mailbox:String, username:String, password:String, options=0, n_retries=0, ?params:NativeArray) : ImapStream return untyped __call__('@imap_open', mailbox, username, password, options, n_retries, params);
	
	public static inline function imap_ping(imap_stream:ImapStream) : Bool return untyped __call__('imap_ping', imap_stream);
	
	public static inline function imap_qprint(str:String) : String return untyped __call__('imap_qprint', str);
	
	public static inline function imap_renamemailbox(imap_stream:ImapStream, old_mbox:String, new_mbox:String) : Bool return untyped __call__('imap_renamemailbox', imap_stream, old_mbox, new_mbox);
	
	public static inline function imap_reopen(imap_stream:ImapStream, mailbox:String, options=0, n_retries=0) : Bool return untyped __call__('imap_reopen', imap_stream, mailbox, options, n_retries);
	
	public static inline function imap_rfc822_parse_adrlist(address:String, default_host:String) : NativeArray return untyped __call__('imap_rfc822_parse_adrlist', address, default_host);
	
	public static inline function imap_rfc822_parse_headers(headers:String, defaulthost="UNKNOWN") : ImapHeaders return untyped __call__('imap_rfc822_parse_headers', headers, defaulthost);
	
	public static inline function imap_rfc822_write_address(mailbox:String, host:String, personal:String) : String return untyped __call__('imap_rfc822_write_address', mailbox, host, personal);
	
	public static inline function imap_savebody(imap_stream:ImapStream, file:Dynamic, msg_number:Int, part_number="", options=0) : Bool return untyped __call__('imap_savebody', imap_stream, file, msg_number, part_number, options);
	
	public static function imap_search(imap_stream:ImapStream, criteria:String, ?options:Int, ?charset:String) : NativeArray
	{
		if (charset == null)
		{
			if (options == null)
			{
				return untyped __call__('imap_search', imap_stream, criteria);
			}
			else
			{
				return untyped __call__('imap_search', imap_stream, criteria, options);
			}
		}
		else
		{
			return untyped __call__('imap_search', imap_stream, criteria, options, charset);
		}
	}
	
	public static inline function imap_set_quota(imap_stream:ImapStream, quota_root:String, quota_limit:Int) : Bool return untyped __call__('imap_set_quota', imap_stream, quota_root, quota_limit);
	
	public static inline function imap_setacl(imap_stream:ImapStream, mailbox:String, id:String, rights:String) : Bool return untyped __call__('imap_setacl', imap_stream, mailbox, id, rights);
	
	public static function imap_setflag_full(imap_stream:ImapStream, sequence:String, flag:String, ?options:Int) : Bool
	{
		if (options == null)
		{
			return untyped __call__('imap_setflag_full', imap_stream, sequence, flag);
		}
		else
		{
			return untyped __call__('imap_setflag_full', imap_stream, sequence, flag, options);
		}
	}
	
	public static function imap_sort(imap_stream:ImapStream, criteria:Int, reverse:Int, options=0, ?search_criteria:String, ?charset:String) : NativeArray
	{
		if (charset == null)
		{
			if (search_criteria == null)
			{
				return untyped __call__('imap_sort', imap_stream, criteria, reverse, options);
			}
			else
			{
				return untyped __call__('imap_sort', imap_stream, criteria, reverse, options, search_criteria);
			}
		}
		else
		{
			return untyped __call__('imap_sort', imap_stream, criteria, reverse, options, search_criteria, charset);
		}
	}

	
	public static inline function imap_status(imap_stream:ImapStream, mailbox:String, options:Int) : Dynamic return untyped __call__('imap_status', imap_stream, mailbox, options);
	
	public static inline function imap_subscribe(imap_stream:ImapStream, mailbox:String) : Bool return untyped __call__('imap_subscribe', imap_stream, mailbox);
	
	public static function imap_thread(imap_stream:ImapStream, ?options:Int) : NativeArray
	{
		if (options == null)
		{
			return untyped __call__('imap_thread', imap_stream);
		}
		else
		{
			return untyped __call__('imap_thread', imap_stream, options);
		}
	}
	
	public static inline function imap_timeout(timeout_type:Int, ?timeout:Int=-1) : Dynamic return untyped __call__('imap_timeout', timeout_type, timeout);
	
	public static inline function imap_uid(imap_stream:ImapStream, msg_number:Int) : Int return untyped __call__('imap_uid', imap_stream, msg_number);
	
	public static inline function imap_undelete(imap_stream:ImapStream, msg_number:Int, flags=0) : Bool return untyped __call__('imap_undelete', imap_stream, msg_number, flags);
	
	public static inline function imap_unsubscribe(imap_stream:ImapStream, mailbox:String) : Bool return untyped __call__('imap_unsubscribe', imap_stream, mailbox);
	
	public static inline function imap_utf7_decode(text:String) : String return untyped __call__('imap_utf7_decode', text);
	
	public static inline function imap_utf7_encode(data:String) : String return untyped __call__('imap_utf7_encode', data);
	
	public static inline function imap_utf8(mime_encoded_text:String) : String return untyped __call__('imap_utf8', mime_encoded_text);
}
