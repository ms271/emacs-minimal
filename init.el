;; (setq path-to-emacsd "~/.emacs.d/")
(setq path-to-emacsd "C:/MyTemp/_emacs.d/")
(defun get-full-path (subpath)
  (concat path-to-emacsd subpath))
;;; After symon is installed
;; (require 'symon)
;; (add-to-list 'load-path path-to-emacsd)
(add-to-list 'load-path (get-full-path "customizations/"))
(add-to-list 'load-path (get-full-path "customizations/packages/"))
(add-to-list 'load-path (get-full-path "plugins/"))
(add-to-list 'load-path (get-full-path "plugins/smex/"))
(add-to-list 'load-path (get-full-path "plugins/aceJump/"))
(add-to-list 'load-path (get-full-path "plugins/highlight-symbol/"))
(add-to-list 'load-path (get-full-path "plugins/yasnippet/"))
;;... Settings
(load "settings.el")
(load "colors.el")
(load "ui.el")
(load "navigation.el")
;;... Packages settings
(load "smex.el")
(load "acejump.el")
(load "highlight-symbol.el")
(require 'sr-speedbar) ;; sr-speedbar-open/close
;; Load following files if these packages have already been installed using package manager
;; M-x package-list-packages
;; (load "magit.el")
;; (load "scalamode.el")
;; (load "emacsess.el")
;;-------------------- PACKAGE DIRECTORIES MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
;;-------------------- END PACKAGE DIRECTORIES MELPA
;;-------------------- Vim mode 
(require 'evil)
(evil-mode 1)
;;-------------------- End Vim mode 
;;-------------------- EPA
(require 'epa-file)
(epa-file-enable)
;;-------------------- End EPA
;;-------------------- WHITESPACE -----------------------;;
(require 'whitespace)
;; highlight long lines
;; http://www.emacswiki.org/emacs/HighlightLongLines
(setq whitespace-style '(lines))
(setq whitespace-line-column 80)
(global-whitespace-mode 1)
(setq whitespace-style '(tabs trailing lines tab-mark))
;; end highlight long lines
;;-------------------- END WHITESPACE --------------------;;

;;-------------------- YASNIPPET AND AUTOCOMPLETE ---------------------;;
;; ... Yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; http://sethlakowske.com/why-i-use-emacs/fix-yasnippet-and-autocomplete-tab-key-collision/
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
;; Alternatively use Control-c + tab
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
;; ... End Yasnippt - separate file doesn't work

;; Auto-complete
;; after auto-complete is installed
;; http://auto-complete.org/doc/manual.html#after-installation-check
;; http://auto-complete.org/doc/manual.html#installation
;; https://github.com/auto-complete/auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
;;(auto-complete-mode t)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; End Auto-complete
;;-------------------- END YASNIPPET AND AUTOCOMPLETE ---------------------;;
