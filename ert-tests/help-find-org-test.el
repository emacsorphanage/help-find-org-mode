(require 'org)
;; (require 'ob)
;; (require 'ob-tangle)

(defcustom help-find-org-test-lib "help-find-org-test-lib"
  "Test library name for `help-find-org-test'.")

(defcustom help-find-org-test-fn 'help-find-org-test-fn
  "Test function provided by `help-find-org-test-lib'.")

(ert-deftest test-help-find-org ()
  (require (intern help-find-org-test-lib))
  (find-function help-find-org-test-fn)
  (should (string-equal (file-name-nondirectory (buffer-file-name))
			(format "%s.el" help-find-org-test-lib)))

  ;; reset after the first test
  (kill-buffer)

  ;; try again -- this time we should be looking at the org file
  (require 'help-find-org)
  (help-find-org 1)
  (find-function help-find-org-test-fn)
  (should (string-equal (file-name-nondirectory (buffer-file-name))
			(format "%s.org" help-find-org-test-lib))))

;; todo: implement test for variables and libraries

(provide 'help-find-org-test)
;;; help-find-org@-test.el ends here
