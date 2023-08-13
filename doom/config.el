;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; WELCOME TO MY CUSTOM DOOM EMACS CONFIG!

;; IMPORTANT PROGRAMS TO LOAD FIRST

;; Set User Identity
(setq user-full-name "Oliver MacDonald"
      user-mail-address "ojandjess1@gmail.com")

;; Set Themes
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doom-feather-light)
;;(setq doom-theme 'doom-laserwave)
;;(setq doom-theme 'doom-nord)
;;(setq doom-theme 'doom-nord-light)
;;(setq doom-theme 'doom-nova)
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doom-ephemeral)
;;(setq doom-theme 'doom-earl-grey)
(doom-themes-visual-bell-config)

;; Set Doom Modeline
(after! doom-modeline
  (setq all-the-icons-scale-factor 1.1
        doom-modeline-height 10
        auto-revert-check-vc-info t
        doom-modeline-major-mode-icon (display-graphic-p)
        doom-modeline-major-mode-color-icon (display-graphic-p)
        doom-modeline-buffer-file-name-style 'relative-to-project
        doom-modeline-github t
        doom-modeline-mu4e t
        doom-modeline-github-interval 60
        doom-modeline-vcs-max-length 60)
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode)
  (doom-modeline-def-modeline 'main
    '(bar modals workspace-name window-number persp-name buffer-position selection-info buffer-info matches remote-host debug vcs matches)
    '(github mu4e grip gnus checker misc-info repl lsp " ")))

;;
;; Set Doom Fonts
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 14))

(with-eval-after-load 'mu4e
  (setq shr-color-visible-luminance-min 80
        shr-use-colors nil
        shr-use-fonts t
        shr-width 100
        shr-font-size 15))

;; (setq doom-font (font-spec :family "DejaVu Sans Mono" :size 17 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 17))

;; (with-eval-after-load 'mu4e
;;   (setq shr-color-visible-luminance-min 80
;;         shr-use-colors nil
;;         shr-use-fonts t
;;         shr-width 100
;;         shr-font-size 17))
;;end

;;
;; Set Line Numbers && Global Word Wrap Mode
(setq display-line-numbers-type t)

(+global-word-wrap-mode +1)

;;
;; Set Beacon Mode
(beacon-mode 1)

;;
;; Set GPG
(setq epg-gpg-program "gpg")
(setq epg-gpg-home-directory "~/.gnupg/")

;;
;; Global Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f12>") 'org-agenda)
;;(global-set-key (kbd "<f11>") Full Screen set in Hyprland.
(global-set-key (kbd "<f10>") '+zen/toggle-fullscreen)
(global-set-key (kbd "<f5>") 'browse-url-generic)
(global-set-key (kbd "<f7>") 'mu4e)
(global-set-key (kbd "<f8>") 'org-roam-dailies-goto-today)
(global-set-key (kbd "<f6>") 'diary-insert-entry)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f4>") 'doom/reload)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c m b") 'mu4e-headers-search-bookmark)
(global-set-key (kbd "C-c m s") 'mu4e-headers-search)
(global-set-key (kbd "C-c h h") 'hyperbole)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c c") 'org-roam-capture)
(global-set-key (kbd "C-c r f") 'org-roam-find)
(global-set-key (kbd "C-c r f") 'org-roam-capture)
(global-set-key (kbd "C-c r g") 'org-roam-graph)
(global-set-key (kbd "C-c r i") 'org-roam-node-insert)
(global-set-key (kbd "C-c r t") 'org-roam-tag-add)

;;
;; Global Autorevet Mode
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;;
;; ALL THE ICONS
(use-package! all-the-icons
  :commands (all-the-icons-octicon
             all-the-icons-faicon
             all-the-icons-fileicon
             all-the-icons-wicon
             all-the-icons-material
             all-the-icons-alltheicon)
  :preface
  (add-hook! 'after-setting-font-hook
    (defun doom-init-all-the-icons-fonts-h ()
      (when (fboundp 'set-fontset-font)
        (dolist (font (list "Weather Icons"
                            "github-octicons"
                            "FontAwesome"
                            "all-the-icons"
                            "file-icons"
                            "Material Icons"))
          (set-fontset-font t 'unicode font nil 'append)))))
  :config
  (cond ((daemonp)
         (defadvice! doom--disable-all-the-icons-in-tty-a (fn &rest args)
           "Return a blank string in tty Emacs, which doesn't support multiple fonts."
           :around '(all-the-icons-octicon all-the-icons-material
                     all-the-icons-faicon all-the-icons-fileicon
                     all-the-icons-wicon all-the-icons-alltheicon)
           (if (or (not after-init-time) (display-multi-font-p))
               (apply fn args)
             "")))
        ((not (display-graphic-p))
         (defadvice! doom--disable-all-the-icons-in-tty-a (&rest _)
           "Return a blank string for tty users."
           :override '(all-the-icons-octicon all-the-icons-material
                       all-the-icons-faicon all-the-icons-fileicon
                       all-the-icons-wicon all-the-icons-alltheicon)
           ""))))

;;
;; BOOKMARKS
(map! :leader
      (:prefix ("B" "buffer")
       :desc "List bookmarks"                          "L" #'list-bookmarks
       :desc "Set bookmark"                            "m" #'bookmark-set
       :desc "Delete bookmark"                         "M" #'bookmark-set
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

;;
;; BUFFERS
(evil-define-key 'normal ibuffer-mode-map
  (kbd "f c") 'ibuffer-filter-by-content
  (kbd "f d") 'ibuffer-filter-by-directory
  (kbd "f f") 'ibuffer-filter-by-filename
  (kbd "f m") 'ibuffer-filter-by-mode
  (kbd "f n") 'ibuffer-filter-by-name
  (kbd "f x") 'ibuffer-filter-disable
  (kbd "g h") 'ibuffer-do-kill-lines
  (kbd "g H") 'ibuffer-update)

;;
;; DENOTE
;; (require 'denote)

;; ;; Remember to check the doc strings of those variables.
;; (setq denote-directory (expand-file-name "~/Documents/notes/"))
;; (setq denote-known-keywords '("emacs" "doom" "emotionsmatter" "gmba" "gwoht" "personal" "helm-posframe" "github"))
;; (setq denote-infer-keywords t)
;; (setq denote-sort-keywords t)
;; (setq denote-file-type nil) ; Org is the default, set others here
;; (setq denote-prompts '(title keywords))
;; (setq denote-excluded-directories-regexp nil)
;; (setq denote-excluded-keywords-regexp nil)

;; (setq denote-date-prompt-use-org-read-date t)

;; ;; Read this manual for how to specify `denote-templates'.  We do not
;; ;; include an example here to avoid potential confusion.

;; (setq denote-allow-multi-word-keywords t)

;; (setq denote-date-format nil) ; read doc string

;; (setq denote-backlinks-show-context t)

;; (add-hook 'find-file-hook #'denote-link-buttonize-buffer)

;; (setq denote-dired-directories
;;       (list denote-directory
;;             (thread-last denote-directory (expand-file-name "attachments"))
;;             (expand-file-name "~/Documents/books")))

;; ;;
;; ;; OR if only want it in `denote-dired-directories':
;; (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)

;; (defun my-denote-journal ()
;;   (interactive)
;;   (let* ((today (format-time-string "%A %e %B %Y"))
;;          (string (denote-sluggify today))
;;          (files (denote-directory-files-matching-regexp string)))
;;     (cond
;;      ((> (length files) 1)
;;       (find-file (completing-read "Select file: " files nil :require-match)))
;;      (files
;;       (find-file (car files)))
;;      (t
;;       (denote
;;        today
;;        '("journal"))))))

;; (let ((map global-map))
;;   (define-key map (kbd "C-c n j") #'my-denote-journal) ; our custom command
;;   (define-key map (kbd "C-c n n") #'denote)
;;   (define-key map (kbd "C-c n N") #'denote-type)
;;   (define-key map (kbd "C-c n d") #'denote-date)
;;   (define-key map (kbd "C-c n z") #'denote-signature) ; "zettelkasten" mnemonic
;;   (define-key map (kbd "C-c n s") #'denote-subdirectory)
;;   (define-key map (kbd "C-c n t") #'denote-template)
;;   ;; `markdown-mode-map', and/or `text-mode-map'.
;;   (define-key map (kbd "C-c n i") #'denote-link) ; "insert" mnemonic
;;   (define-key map (kbd "C-c n I") #'denote-add-links)
;;   (define-key map (kbd "C-c n b") #'denote-backlinks)
;;   (define-key map (kbd "C-c n f f") #'denote-find-link)
;;   (define-key map (kbd "C-c n f b") #'denote-find-backlink)
;;   ;; Note that `denote-rename-file' can work from any context, not just
;;   ;; Dired bufffers.  That is why we bind it here to the `global-map'.
;;   (define-key map (kbd "C-c n r") #'denote-rename-file)
;;   (define-key map (kbd "C-c n R") #'denote-rename-file-using-front-matter))

;; (let ((map dired-mode-map))
;;   (define-key map (kbd "C-c C-d C-i") #'denote-link-dired-marked-notes)
;;   (define-key map (kbd "C-c C-d C-r") #'denote-dired-rename-marked-files)
;;   (define-key map (kbd "C-c C-d C-R") #'denote-dired-rename-marked-files-using-front-matter))

;; ;; (with-eval-after-load 'org-capture
;; ;;   (setq denote-org-capture-specifiers "%l\n%i\n%?")
;; ;;   (add-to-list 'org-capture-templates
;; ;;                '("n" "New note (with denote.el)" plain
;; ;;                  (file denote-last-path)
;; ;;                  #'denote-org-capture
;; ;;                  :no-save t
;; ;;                  :immediate-finish nil
;; ;;                  :kill-buffer t
;; ;;                  :jump-to-captured t)))

;; ;; Also check the commands `denote-link-after-creating',
;; ;; `denote-link-or-create'.  You may want to bind them to keys as well.

;; ;; `context-menu-mode'.
;; (add-hook 'context-menu-functions #'denote-context-menu)

;;
;; EWW
(use-package! eww
  :init
  (setq eww-search-prefix "https://www.google.com/search?q=")
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-secondary-browser-function "generic")
  :config
  (defun eww-open-in-generic ()
    (interactive)
    (let ((browse-url-browser-function 'browse-url-generic))
      (eww-browse-with-external-browser)))
  (defun eww-browse-with-external-browser ()
    (interactive)
    (let ((url (eww-copy-page-url)))
      (browse-url-generic url))))

;;
;; Helm, Helm-Posframe, Helm-Projectile
;; Enable Helm

;; Enable Helm
(use-package! helm
  :config
  (helm-mode 1))

;; Add the custom repository to the load path
;;(add-to-list 'load-path "/home/zer0/helm-posframe")
(add-to-list 'load-path "/home/zer0/helm-posframe_myfork")
;; Configure and enable "helm-posframe"
(use-package! helm-posframe
  :after helm
  :demand t
  :if (and (window-system) (version<= "29.1" emacs-version))
  :config
  ;; Set the posframe configuration
  (setq helm-posframe-border-width 2)  ; Adjust border width as desired
  (setq helm-posframe-parameters
        '((left-fringe . 10)             ; Adjust left fringe
          (right-fringe . 10)))         ; Adjust right fringe
        (helm-posframe-enable))


;; MU4e
(use-package! mu4e
  :ensure nil
   ;;:load-path "/usr//home/olivers/mu-1.8.14/mu4e"
   :defer 20 ; Wait until 20 seconds after startup
  :config

  (setq mu4e-headers-buffer-name "*mu4e-headers*")

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 5 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-root-maildir "~/.mail")

  (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
  (setq mu4e-refile-folder "/[Gmail]/All Mail")
  (setq mu4e-trash-folder  "/[Gmail]/Trash")

(setq mu4e-maildir-shortcuts
  '((:maildir "/Inbox"    :key ?i)
    (:maildir "/[Gmail]/Sent Mail" :key ?s)
    (:maildir "/[Gmail]/Trash"     :key ?t)
    (:maildir "/[Gmail]/Drafts"    :key ?d)
    (:maildir "/[Gmail]/All Mail"  :key ?a))))

(setq +mu4e-gmail-accounts '(("ojandjess1@gmail.com" . "/ojandjess1")))

(setq +mu4e-compose-org-msg-toggle-next nil)

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("Google Mail" "smtp.gmail.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.gmail.com" 587 "ojandjess1@gmail.com" "qdtbbngcaeaydpzq"))
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587)
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; don't need to run cleanup after indexing for gmail
(setq mu4e-index-cleanup nil
      ;; because gmail uses labels as folders we can use lazy check since
      ;; messages don't really "move"
      mu4e-index-lazy-check nil)
;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)
;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads")
;; Make sure plain text mails flow correctly for recipients
(setq mu4e-compose-format-flowed t)

;; Run mu4e in the background to sync mail periodically
;;(mu4e t)
(setq byte-complile-warnings '(not cl-functions))
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

(after! mu4e
  (evil-set-initial-state 'mu4e-headers-mode 'normal)
  (evil-set-initial-state 'mu4e-view-mode 'normal)
  (evil-set-initial-state 'mu4e-compose-mode 'insert))

;; Optionally, if you want to use "j" and "k" for navigation
(setq mu4e-headers-next-function 'evil-next-line)
(setq mu4e-headers-prev-function 'evil-previous-line)

;;
;; NOTIFICATIONS
(require 'notifications)

(ednc-mode 1)

(defun show-notification-in-buffer (old new)
  (let ((name (format "Notification %d" (ednc-notification-id (or old new)))))
    (with-current-buffer (get-buffer-create name)
      (if new (let ((inhibit-read-only t))
                (if old (erase-buffer) (ednc-view-mode))
                (insert (ednc-format-notification new t))
                (pop-to-buffer (current-buffer)))
        (kill-buffer)))))

(add-hook 'ednc-notification-presentation-functions
          #'show-notification-in-buffer)

(evil-define-key 'normal ednc-view-mode-map
  (kbd "d")   'ednc-dismiss-notification
  (kbd "RET") 'ednc-invoke-action
  (kbd "e")   'ednc-toggle-expanded-view)

;;
;; ORG-MODE
(setq org-directory "~/org/")

(add-to-list 'load-path (expand-file-name "~/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading 'invisible-ok)
    (outline-hide-other)
    (org-cycle)
    (org-cycle)
    (org-cycle)))

(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(defun bh/make-org-scratch ()
  (interactive)
  (find-file "/tmp/publish/scratch.org")
  (gnus-make-directory "/tmp/publish"))

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(setq bookmark-default-file "~/bookmarks")

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-default-notes-file "~/org/refile.org")

(setq org-capture-templates
      (quote (("t" "Todo" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Tasks")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("N" "Note" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Notes")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Diary" entry (file+datetree "~/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("M" "Meeting" entry (file+olp "~/org-roam/2023011914330-agenda.org" "Meetings")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Phone Calls")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Habits")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
              ("m" "Email" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Emails")
               "* TODO %:subject\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n\n  %a\n\n  %i"
                       :immediate-finish t)
              ("R" "Read Later" entry (file+olp "~/org-roam/20230119141330-agenda.org" "Read Later")
               "* TODO Read %:subject\nSCHEDULED:%t\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+2d\"))\n\n%a\n\n%i" :immediate-finish t))))

(setq org-agenda-custom-commands

      '(("v" "A better agenda view"
          ((agenda "")

          (tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
                    (alltodo "")))))

(setq org-refile-targets (quote ((nil :maxlevel . 40)
                                 (org-agenda-files :maxlevel . 40))))

(setq org-refile-use-outline-path t)

(setq org-outline-path-complete-in-steps nil)

(setq org-refile-allow-creating-parent-nodes (quote confirm))

(defun bh/verify-refile-target ()
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-agenda-dim-blocked-tasks nil)

(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?H)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("HOLD" . ?h)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("ORG" . ?O)
                            ("NORANG" . ?N)
                            ("crypt" . ?E)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

(setq org-fast-tag-selection-single-key (quote expert))

(setq org-agenda-tags-todo-honor-ignore-options t)

(setq org-alphabetical-lists t)

(org-link-set-parameters
 "pdfview"
 :follow 'org-pdfview-open
 :complete 'org-pdfview-complete-link
 :store 'org-pdfview-store-link)

(after! org-agenda
  (setq org-agenda-include-diary t))

;;
;; ORG ROAM SETUP
(use-package! org-roam
  :custom
  (org-roam-directory "~/org-roam")
  :config
  (setq org-roam-node-title-to-file-function
        (lambda (title) (s-replace " " "-" (s-downcase title))))

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t)
          ("r" "reference" plain "%?"
           :target (file+head "references/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t))))

(setq org-roam-graph-viewer "/usr/bin/qutebrowser")

(org-roam-db-autosync-mode t)

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start nil))

(setq org-roam-ui-follow nil)

(setq org-roam-ui-update-on-save nil)

(setq org-roam-ui-sync-theme nil)

(setq org-roam-ui-custom-theme
    '((bg . "#1E2029")
        (bg-alt . "#282a36")
        (fg . "#f8f8f2")
        (fg-alt . "#6272a4")
        (red . "#ff5555")
        (orange . "#f1fa8c")
        (yellow ."#ffb86c")
        (green . "#50fa7b")
        (cyan . "#8be9fd")
        (blue . "#ff79c6")
        (violet . "#8be9fd")
        (magenta . "#bd93f9")))

(setq org-roam-ui-open-on-start nil)

;;
;; PHP MODE
(add-to-list 'load-path "/home/zer0/php-extras")
(eval-after-load 'php-mode
  (require 'php-extras))

;;
;; PDF-TOOLS
(use-package! pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (setq pdf-view-resize-factor 1.1)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward-regexp)
  (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward-regexp)
  (define-key pdf-view-mode-map (kbd "C-g") 'isearch-repeat-forward)
  (define-key pdf-view-mode-map (kbd "C-f") 'pdf-links-action-perform))

(appt-activate)

;;
;; SHELLS & TERMINALS
(map! :leader
      :desc "Toggle Vterm"
      "v t" #'vterm)

(map! :leader
      :desc "toggle eshell"
      "e t" #'eshell)

(use-package! multi-vterm)

(setq vterm-shell "/bin/fish")

(require 'el2org)

(require 'ox-gfm)
