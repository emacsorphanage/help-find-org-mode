;;; help-find-org.el --- Advice help functions that find code to open org files instead of tangled source code
;; Version: 0.0.20140328

;; Copyright (C) 2015 Eric Crosson

;; Author: Eric Crosson <esc@ericcrosson.com>
;; Keywords: help
;; Package-Version: 0

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package advises help functions that find code. Each function
;; is advised to open org babel files to the appropriate source block
;; instead of tangled code.

;; Opening the org file instead of the tangled code has the advantage
;; of allowing instantaneous code changes, as well as providing
;; whatever additional information is contained in the org file to the
;; user.

;;; TODOs
;; - don't find the .el file also (kill it if it wasn't open before,
;;   bury if it was open but not visiable) add easy templates for
;; - convenient global use of this package

;;; Usage:

;; (require 'help-find-org)

;;; Code:
(defgroup help-find-org nil
  "Advise help functions that find source files to find org babel
source blocks instead of tangled source."
  :group 'help)

(defcustom help-find-org-advised-functions
  '(find-function
    find-variable
    find-library
    find-function-at-point
    find-variable-at-point)
  "Functions advised by `help-find-org'."
  :type '(repeat function)
  :group 'help-find-org)

(defadvice find-function (after find-function-in-org  activate)
  "Advise `find-function' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-variable (after find-variable-in-org activate)
  "Advise `find-variable' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-library (after find-library-in-org activate)
  "Advise `find-library' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-function-at-point (after find-function-at-point-in-org activate)
  "Advise `find-function-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-variable-at-point (after find-variable-at-point-in-org activate)
  "Advise `find-variable-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defun help-find-org-turn-on ()
  "Turn on mode `help-find-org'."
  (mapc (lambda (help-fn)
	  (ad-enable-advice help-fn 'after (intern (format "%s-in-org" (symbol-name help-fn)))))
	help-find-org-advised-functions))

(defun help-find-org-turn-off ()
  "Turn off mode `help-find-org'."
  (mapc (lambda (help-fn)
	  (ad-disable-advice help-fn 'after (intern (format "%s-in-org" (symbol-name help-fn)))))
	help-find-org-advised-functions))

;;;###autoload
(define-minor-mode help-find-org
  "Advise help functions that find source files to find org babel
source blocks instead of tangled source."
  :init-value t
  :global t
  :group 'help-find-org
  (if help-find-org
      (help-find-org-turn-on)
    (help-find-org-turn-off)))

(provide 'help-find-org)

;;; help-find-org.el ends here
