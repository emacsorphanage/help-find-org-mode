;;; help-find-org-mode.el --- Advise GNU Emacs to find org source-files instead of tangled code-definitions
;;
;;; Copyright (C) 2018  Free Software Foundation, Inc.
;;
;; Author: Eric Crosson <eric.s.crosson@utexas.com>
;; Version: 1.0.0
;; Keywords: convenience
;; URL: https://github.com/EricCrosson/help-find-org-mode
;; Package-Requires: ((emacs "24"))
;;
;; This file is not a part of GNU Emacs.
;;
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;
;;; Commentary:

;; This package advises help functions that find code.  Each function
;; is advised to open org babel-files to the appropriate source-block
;; instead of tangled-code.

;; Opening the org file instead of the tangled code has the advantage
;; of allowing instantaneous code changes, as well as providing
;; whatever additional information is contained in the org file to the
;; user.

;;; Usage:

;; with `use-package:

;; (use-package help-find-org-mode
;;   :config (help-find-org-mode 1))

;; - or -

;; (require 'help-find-org-mode)

;; along with one of the following:

;; (help-find-org-mode 1)
;;    or invoke it interactively with
;; M-x help-find-org-mode

;; Note that for this package to work, org source code needs to bt
;; tangled with certain flags. The only non-default flag that needs to
;; be set is ':comments link'.

;; The below code defines an easy template that inserts a source block
;; with linked comments that is tangled to the default file:

;; (add-to-list 'org-structure-template-alist
;; 	     '("S"
;; 	       "#+BEGIN_SRC ? :comments link :tangle yes\n\n#+END_SRC"
;; 	       "<src lang=\"?\">\n\n</src>"))

;; expand it by inserting "<S" and hitting

;;; TODO:
;; - don't find the .el file also (kill it if it wasn't open before,
;;   bury if it was open but not visable)

;;; Code:

(require 'ob-tangle)

(defgroup help-find-org nil
  "Advise help functions that find source files to find org babel
source blocks instead of tangled source."
  :group 'help)

(defun find-function-in-org (fn)
  "Advise `find-function' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors
    (org-babel-tangle-jump-to-org)))

(defun find-variable-in-org (var)
  "Advise `find-variable' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defun find-library-in-org (library)
  "Advise `find-library' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defun find-function-at-point-in-org (fn)
  "Advise `find-function-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defun find-variable-at-point-in-org (var)
  "Advise `find-variable-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))


(defun help-find-org-mode-turn-on ()
  "Turn on mode `help-find-org-mode'."
  (advice-add 'find-function :after #'find-function-in-org)
  (advice-add 'find-variable :after #'find-variable-in-org)
  (advice-add 'find-library :after #'find-library-in-org)
  (advice-add 'find-function-at-point :after #'find-function-at-point-in-org)
  (advice-add 'find-variable-at-point :after #'find-variable-at-point-in-org))

(defun help-find-org-mode-turn-off ()
  "Turn off mode `help-find-org-mode'."
  (advice-remove 'find-function #'find-function-in-org)
  (advice-remove 'find-variable #'find-variable-in-org)
  (advice-remove 'find-library #'find-library-in-org)
  (advice-remove 'find-function-at-point #'find-function-at-point-in-org)
  (advice-remove 'find-variable-at-point #'find-variable-at-point-in-org))

;;;###autoload
(define-minor-mode help-find-org-mode
  "Advise help functions that find source files to find org babel
source blocks instead of tangled source."
  :init-value nil
  :global t
  :group 'help-find-org
  (if help-find-org-mode
      (help-find-org-mode-turn-on)
    (help-find-org-mode-turn-off)))


(provide 'help-find-org-mode)

;;; help-find-org-mode.el ends here
