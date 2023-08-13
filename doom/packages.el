;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; =============================
;; == MY CUSTOM DOOM PACKAGES ==
;; =============================

;;A
(package! avy)
;;B
(package! beacon)
(package! bbdb)
(package! bbdb-vcard)
;;C
(package! clippy)
;;D
(package! dired-open)
(package! dired-subtree)
(package! dirvish)
(package! dmenu)
(package! denote)
;;E
(package! eaf)
(package! eglot)
(package! ednc)
(package! el2org)
(package! emojify)
(package! eudc)
(package! exwm)
(package! eww)
(package! evil-tutor)
;;F
(package! flycheck-aspell)
;;G
(package! google)
(package! gnus)
;;H
(package! hercules)
(package! hyperbole)
;;I
(package! ivy-posframe)
;;J
(package! js2-mode)
(package! javascript)
;;K
;;L
;;M
(package! magit-gitflow)
(package! magit-todos)
(package! multi-vterm)
(package! mw-thesaurus)
;;N
;;O
(package! olivetti)
(package! org-auto-tangle)
(package! org-web-tools)
(package! org-msg)
(package! org-mime)
(package! org-roam-ui)
(package! ox-gfm)
(package! ox-gemini)
;;P
(package! peep-dired)
(package! password-store)
(package! pretty-symbols)
(package! pdf-tools)
;;Q
;;R
(package! rainbow-mode)
(package! ranger)
(package! resize-window)
;;S
(package! sublimity)
(package! svg-tag-mode)
;;T
(package! tldr)
;;U
;;V
(package! wc-mode)
;;W
;;X
;;Y
;;Z
;; ===============================
;; == INSTALLATION INSTRUCTIONS ==
;; ===============================

;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
;(unpin! t)
