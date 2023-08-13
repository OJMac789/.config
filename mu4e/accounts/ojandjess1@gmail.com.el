(add-to-list 'mu4e-contexts
(make-mu4e-context
  :name "ojandjess1@gmail.com"
  :match-func (lambda (msg)
                (when msg
                  (mu4e-message-contact-field-matches msg
                     :to "ojandjess1@gmail.com")))
  :vars '((user-mail-address                . "ojandjess1@gmail.com")
          (message-sendmail-extra-arguments . ("-a" "ojandjess1@gmail.com"))
          (mu4e-sent-messages-behavior      . delete)
          (mu4e-drafts-folder               . "/ojandjess1@gmail.com/[Gmail].Drafts")
          (mu4e-trash-folder                . "/ojandjess1@gmail.com/[Gmail].Trash")
          (mu4e-sent-folder                 . "/ojandjess1@gmail.com/[Gmail].Sent Mail")
          (mu4e-maildir-shortcuts           . (("/ojandjess1@gmail.com/INBOX" . ?i)
                                               ("/ojandjess1@gmail.com/[Gmail].Drafts"         . ?d)
                                               ("/ojandjess1@gmail.com/[Gmail].Sent Mail" . ?s)))
          (user-full-name                   . "Oliver MacDonald"))))
