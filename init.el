(require 'package)
(setq org-use-property-inheritance nil)
(setq org-use-tag-inheritance nil)
(desktop-save-mode 1)
(setq desktop-path '("~/filofex/" "~" "~/.emacs.d/"))
(setq desktop-restore-eager 5)
;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
(not (gnutls-available-p))))
(url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
(add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
'("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; You might already have this line
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(add-to-list 'load-path "/home/ben/mysrc/org-mode/lisp")
(add-to-list 'load-path "/home/ben/mysrc/org-mode/contrib/lisp")
(with-eval-after-load 'info
(info-initialize)
(add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/"))
;; highlight-parentheses from MELPA
(require 'magit)
(require 'highlight-parentheses)
(setq hl-paren-colors '("azure" "green" "yellow" "violetred" "orange"))
(global-set-key "\C-xg" 'magit-status)
(global-set-key (kbd "C-h") 'help-command)
(global-set-key (kbd "M-h") 'mark-paragraph)
;;(global-set-key (kbd "C-h") 'delete-backward-char)
;;(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-insert-mode-line-in-empty-file t)
;; org's tags - overlap TAG:...
(setq org-tag-persistent-alist '((:startgroup . nil)
		      ("WANTED" . ?m)
		      ("Rerun" . ?r)
		      (:endgroup . nil)
		      ))
;; auto optimize nestle inherit
(setq org-tag-alist '((:startgroup)
		      ("GTD")
 		      (:startgrouptag)
 		      ("WANTED" . ?m)
 		      ("LUFFY" . ?l)
 		      (:endgrouptag)
		      (:startgrouptag)
 		      ("soso" . ?s)
		      ("Caution" . ?y)
		      (:endgrouptag)
		      ("Rerun" . ?r)
 		      (:endgroup)
 		      ("Habitica". ?h)
 		      ))
;; org's todo - agenda
(setq org-todo-keywords
'((sequence "TODO(t)" "WAIT(w@/!)" "ReTodo" "NOTES(n@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-default-directory-list
   (quote
    ("/usr/local/share/info/" "/usr/share/info/" "/home/ben/mysrc/info_manual")))
 '(diary-comment-end "#Diary-Comment-Off")
 '(diary-comment-start "#Diary-Comment-On")
 '(diary-file "~/filofex/diary_genALL")
 '(org-agenda-files
   (quote
    ("~/filofex/afflux_fromAliECS.org" "/home/ben/filofex/caltord.org")))
 '(org-capture-templates-contexts nil t)
 '(org-id-link-to-org-use-id (quote create-if-interactive-and-no-custom-id))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(send-mail-function (quote mailclient-send-it)))
 ;; caltord.org for calendar-todo, torch.org for notes...catarrow(journal).org for journal(see below)
(setq org-default-notes-file "~/filofex/catorch(note).org")
(setq org-todo-repeat-to-state "ReTodo")
;; emacs sserver
(setq server-name "foo")
(server-start)
;; forbidden upcase/lowcase regions
(put 'upcase-region 'disabled t)
(put 'downcase-region 'disabled t)
;; shanghai Sunrise/Sunset
(setq calendar-latitude 31.22)
(setq calendar-longitude 121.48)
(setq calendar-location-name "Shanghai, sh")
;; holi ... melpa installed cal-china-x
(setq mark-holidays-in-calendar t)
;; from 1st OnePage to more envs, step by step, scope from scope
(setq org-todo-repeat-to-state "ReTodo")
(setq org-log-done 'time)
(setq org-log-repeat 'note)
;; tomopoto clock 25'
(setq org-timer-default-timer "25")
(setq org-agenda-skip-scheduled-if-deadline-is-shown 'repeated-after-deadline)
;; clock cross Emacs sessions
(setq org-clock-persist 't)
(org-clock-persistence-insinuate)
(define-key global-map "\C-cx"
     (lambda () (interactive) (org-capture nil "gj")))
;; mu4e syslogs
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
;; these are actually the defaults
(setq
mu4e-maildir       "/home/ben/filofex/Maildir"   ;; top-level Maildir
mu4e-sent-folder   "/sent"       ;; folder for sent messages
mu4e-drafts-folder "/drafts"     ;; unfinished messages
mu4e-trash-folder  "/trash"      ;; trashed messages
mu4e-refile-folder "/archive")   ;; saved messages
;; org capture context
(setq org-capture-templates-contexts nil)
(setq org-capture-templates
'(("g" "for convinient goto") ("gN" "Note" entry (file+headline "~/filofex/catorch(note).org" "Notes") "* NOTES %?
  %U
  %i
  %a" :empty-lines 1) ("gj" "Journal" entry (file+olp+datetree "~/filofex/catarrow(journal).org") "* %?
Entered on %U
  %i
  %a" :empty-lines 1) ("gi" "Elisp-scratch" checkitem (id "8fc65b42-e354-41ef-a5fe-d3f0861d14dd") "%?
Entered on %U
  %i
  %a" :clock-in :clock-keep :empty-lin 1)("x" "buryit4sprout" entry (file+olp+datetree "~/filofex/refcatcash(mingle).org") "* %?
Entered on %U
  %i" :empty-lin 1)))
(setq org-capture-templates-contexts (quote (("gi" ((in-mode . "lisp-interaction-mode"))))))
;; org attach from dired window
(require 'org-attach)
(add-hook
      'dired-mode-hook
      (lambda ()
        (define-key dired-mode-map (kbd "C-c C-x a") #'org-attach-dired-to-subtree)
        (define-key dired-mode-map (kbd "C-c C-x c")
          (lambda () (interactive)
            (let ((org-attach-method 'cp))
              (call-interactively #'org-attach-dired-to-subtree))))
        (define-key dired-mode-map (kbd "C-c C-x m")
          (lambda () (interactive)
            (let ((org-attach-method 'mv))
              (call-interactively #'org-attach-dired-to-subtree))))
        (define-key dired-mode-map (kbd "C-c C-x h")
          (lambda () (interactive)
            (let ((org-attach-method 'ln))
              (call-interactively #'org-attach-dired-to-subtree))))
        (define-key dired-mode-map (kbd "C-c C-x s")
          (lambda () (interactive)
            (let ((org-attach-method 'lns))
              (call-interactively #'org-attach-dired-to-subtree))))))
;; org's RSS/Atom seed
(add-hook
 'org-mode-hook
 (lambda()
   (define-key org-mode-map (kbd "C-c C-x g") #'org-feed-update-all)
   (define-key org-mode-map (kbd "C-c C-x G") #'org-feed-goto-inbox)))
(setq org-feed-alist
      '(("Slashdot"
	 "http://rss.slashdot.org/Slashdot/slashdot"
	 "~/filofex/rssfeeds.org" "Slashdot Entries")))
;; org's protocols, in order to m-x help v autocomp
(require 'org-protocol)
;; org refile
(setq org-refile-use-cache t)
(setq org-log-refile t)
(setq org-refile-use-outline-path 'full-file-path)
(setq org-outline-path-complete-in-steps t)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-targets '(("~/filofex/refrefile(common).org" . (:maxlevel . 3))
			   ("~/filofex/refrefile(common).org" . (:regexp . "[mM]on\\|[tT]ue\\|[wW]ed\\|[tT]hu\\|[Ff]ri"))
			   ("~/filofex/refcatcash(mingle).org" . (:maxlevel . 3))
			   ))
;; ido-mode
(require 'ido)
(ido-mode 1)
;; archiving
(setq org-archive-location "~/filofex/chaos_archive.org::* From %s")
(setq org-use-property-inheritance t)
(setq org-use-tag-inheritance t)
(setq org-archive-save-context-info '(time file olpath category todo itags))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; diary
;;; indlude-file
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)
(diary)
