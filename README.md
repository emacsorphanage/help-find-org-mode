# help-find-org-mode [![Build Status](https://travis-ci.org/EricCrosson/help-find-org-mode.svg?branch=master)](https://travis-ci.org/EricCrosson/help-find-org-mode) [![MELPA Stable](https://stable.melpa.org/packages/help-find-org-mode-badge.svg)](https://stable.melpa.org/#/help-find-org-mode) [![MELPA](http://melpa.org/packages/help-find-org-mode-badge.svg)](http://melpa.org/#/help-find-org-mode)

> Advise GNU Emacs to find org code-blocks instead of tangled code-definitions

This package provides a minor-mode which advises all help functions
that find files. The advised behavior opens the org-babel code-block
instead of the tangled-source (if the source-block was
[tangled appropriately](https://orgmode.org/manual/comments.html)).

## Install

From [MELPA](https://melpa.org/)

``` {.sourceCode .lisp}
(use-package help-find-org-mode
  :ensure t
  :pin melpa-stable
  :config (help-find-org-mode t))
```

Or manually, after downloading into your `load-path`

``` {.sourceCode .lisp}
(require 'help-find-org-mode)
(help-find-org-mode t)
```

## Use

TODO

<!-- ## Example -->

<!-- ![TODO: set hover-text](https://raw.githubusercontent.com/EricCrosson/help-find-org-mode/master/img/demo.{TODO: set filetype png,gif}) -->

## Related

TODO

## Acknowledgements

TODO

## License

GPL 2 (or higher) © [Free Software Foundation, Inc](http://www.fsf.org/about).
