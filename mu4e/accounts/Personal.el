(add-to-list 'mu4e-contexts
(make-mu4e-context
  :name "Personal"
  :match-func (lambda (msg)
                (when msg
                  (mu4e-message-contact-field-matches msg
                     :to "ojandjess1@gmail.com")))
  :vars '((user-mail-address                . "ojandjess1@gmail.com")
          (message-sendmail-extra-arguments . ("-a" "Personal"))
          (mu4e-sent-messages-behavior      . delete)
          (mu4e-drafts-folder               . "/Personal/Drafts")
          (mu4e-trash-folder                . "/Personal/Trash")
          (mu4e-sent-folder                 . "/Personal/Sent")
          (mu4e-maildir-shortcuts           . (("/Personal/INBOX" . ?i)
                                               ("/Personal/Drafts"         . ?d)
                                               ("/Personal/Sent" . ?s)))
          (user-full-name                   . "Oliver MacDonald"))))
