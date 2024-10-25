(use-package vertico
  :vc (:url "https://github.com/minad/vertico"
	    :branch "main"
	    :rev :newest
	    :lisp-dir "extensions/")
  :ensure t
  :hook (emacs-startup . vertico-mode))

(use-package marginalia
  :vc (:url "https://github.com/minad/marginalia"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :hook (emacs-startup . marginalia-mode)
  :config
  (setopt marginalia-max-relative-age 0))

(use-package orderless
  :vc (:url "https://github.com/oantolin/orderless"
	    :branch "master"
	    :rev :newest)
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package recentf
  :ensure nil
  :config
  (setopt recentf-save-file "~/.cache/emacs/recentf"))

(provide 'completions)
