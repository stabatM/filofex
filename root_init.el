(require 'package)
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
(add-to-list 'load-path "/home/ben/mysrc/org-mode/lisp")
(add-to-list 'load-path "/home/ben/mysrc/org-mode/contrib/lisp")
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
(setq server-name "foo")
(server-start)
;; forbidden upcase/lowcase regions
(put 'upcase-region 'disabled t)
(put 'downcase-region 'disabled t)
;; shanghai Sunrise/Sunset
(setq calendar-latitude 31.22)
(setq calendar-longitude 121.48)
(setq calendar-location-name "Shanghai, sh")
