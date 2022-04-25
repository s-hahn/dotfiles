;;; packages.el --- python-config Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar python-config-packages
  '(
    ;; package python-configs go here
    ;; py-autopep8
    flycheck-pyflakes
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar python-config-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function python-config/init-<package-python-config>
;;
;; (defun python-config/init-py-autopep8()
  ;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  ;; )

(defun python-config/init-flycheck-pyflakes()
  (use-package flycheck-pyflakes)
  )

;; (defun python-config/init-company-anaconda ()
;;   (use-package company-anaconda
;;     :defer t
;;     :init
;;     (spacemacs|add-company-backends
;;       :backends company-anaconda
;;       :modes python-mode)))

;; (defun python-config/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

