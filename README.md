# help-find-org [![Build Status](https://travis-ci.org/EricCrosson/help-find-org.svg)](https://travis-ci.org/EricCrosson/help-find-org)
---

This package advises all help functions that find files. The new
behavior opens the org babel source block instead of the tangled
source if the source block was tangled appropriately.

See the `;;;Usage` section for more deatails.

This package is not yet on MELPA -- to install with
[quelpa](https://github.com/quelpa/quelpa) evaluate the following:

```lisp
(quelpa '(help-find-org :fetcher github :repo "EricCrosson/help-find-org"))
```
