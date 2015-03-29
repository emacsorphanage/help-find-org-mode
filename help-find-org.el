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
;; - create a minor mode to enable/disable all advice

;;; Usage:

;; (require 'help-find-org)

;;; Code:
(defadvice find-function (after find-function-in-org  activate)
  "Advise `find-function' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-variable (after find-variable activate)
  "Advise `find-variable' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-library (after find-library activate)
  "Advise `find-library' to find org babel files to relevant
source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-function-at-point (after find-function-at-point activate)
  "Advise `find-function-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(defadvice find-variable-at-point (after find-variable-at-point activate)
  "Advise `find-variable-at-point' to find org babel files to
relevant source blocks instead of finding tangled code."
  (ignore-errors (org-babel-tangle-jump-to-org)))

(provide 'help-find-org)

;;; help-find-org.el ends here
