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
;; You might already have this line
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)
(with-eval-after-load 'info
(info-initialize)
(add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/"))
(add-to-list 'load-path "/home/ben/mysrc/org-mode/lisp")
(add-to-list 'load-path "/home/ben/mysrc/org-mode/contrib/lisp")
(global-set-key "\C-xg" 'magit-status)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-insert-mode-line-in-empty-file t)
;; org's todo - agenda
(setq org-agenda-files (list "/home/ben/filofex/tord.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq server-name "foo")
(server-start)
