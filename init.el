;;; init.el --- Entry point for Emacs configuration
;;; Commentary:
;;
;; Loads the literate config file, then runs all of the included
;; elisp.

;;; Code:

(setq vc-handled-backends nil)
(org-babel-load-file "~/.emacs.d/emacs-config.org")

;;; init.el ends here
