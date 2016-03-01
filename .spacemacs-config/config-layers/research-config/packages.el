;;; packages.el --- research-config Layer packages File for Spacemacs
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

(defvar research-config-packages
  '(
    ;; package research-configs go here
    parsebib
    helm-bibtex
    reftex
    hydra
    key-chord
    interleave
    org-ref
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar research-config-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function research-config/init-<package-research-config>
;;
(defun research-config/init-helm-bibtex()
   "Initialize my package"
   (use-package helm-bibtex
     :defer t
     :commands helm-bibtex
     :init
     (progn
       (evil-leader/set-key "ob" 'helm-bibtex)
       )
     :config
     (progn

   (setq helm-bibtex-bibliography "~/Dropbox/shahn/research/latex/zotero.bib")
   (setq helm-bibtex-library-path "~/Dropbox/shahn/research/publications")
   (setq helm-bibtex-notes-path "~/Dropbox/shahn/research/notes")
   (setq helm-bibtex-notes-extension ".org")
   (setq helm-bibtex-pdf-open-function
     (lambda (fpath)
       (start-process "evince" "*evince*" "evince" fpath)))
   (setq helm-bibtex-format-citation-functions
      (quote
       ((org-mode . helm-bibtex-format-citation-cite)
        (latex-mode . helm-bibtex-format-citation-cite)
        (tex-mode . helm-bibtex-format-citation-cite)
        (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
        (default . helm-bibtex-format-citation-default))))

   (setq helm-bibtex-additional-search-fields '(keywords journal))

   (defun helm-bibtex-interleave-edit-notes (key)
     "Open the notes associated with the entry using `find-file'."
     (let ((path (f-join helm-bibtex-notes-path (s-concat key helm-bibtex-notes-extension))))
       (find-file path)
       (unless  (file-exists-p path)
         (insert (concat "#+INTERLEAVE_PDF: " (f-join helm-bibtex-library-path (s-concat key ".pdf")))))))
   (helm-delete-action-from-source "Edit notes" helm-source-bibtex)
   (helm-add-action-to-source "Edit notes" 'helm-bibtex-interleave-edit-notes helm-source-bibtex 7)
       )
     )
   )

(defun research-config/init-org-ref()
  "Init org ref package"
  (use-package org-ref
    :defer t
    :config

    (require 'org-ref-bibtex)
    (setq org-ref-bibliography-notes "/home/shahn/Dropbox/shahn/research/notes/notes.org")
    (setq org-ref-default-bibliography '("/home/shahn/Dropbox/shahn/research/latex/zotero"))
    (setq org-ref-pdf-directory "/home/shahn/Dropbox/shahn/research/publications")
    (setq reftex-default-bibliography '("/home/shahn/Dropbox/shahn/research/latex/zotero"))
    ))

(defun research-config/init-hydra ()
  (use-package hydra
    :defer t))

(defun research-config/init-key-chord ()
  (use-package key-chord
    :defer t))

(defun research-config/init-interleave ()
  (use-package key-chord
    :commands interleave
    :defer t
    ))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
