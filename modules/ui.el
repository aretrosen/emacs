(use-package ef-themes
  :vc (:url "https://github.com/protesilaos/ef-themes"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :demand t
  :bind (("C-c t" . (lambda () (interactive)
		      (if (sen-theme-is-dark-p)
                         (call-interactively 'ef-themes-select-dark)
                       (call-interactively 'ef-themes-select-light))))
	 ("C-c m" . (lambda() (interactive)
		      (if (sen-theme-is-dark-p)
			  (progn (setq sen-theme-mode 'light) (ef-themes--load-theme 'ef-cyprus))
			(setq sen-theme-mode 'dark) (ef-themes--load-theme 'ef-bio)))))
  :config
  (setopt ef-themes-variable-pitch-ui t
	  ef-themes-mixed-fonts t
	  ef-themes-headings
	  '((0 . (variable-pitch light 1.9))
	    (1 . (variable-pitch light 1.8))
	    (2 . (variable-pitch regular 1.7))
	    (3 . (variable-pitch regular 1.6))
	    (4 . (variable-pitch regular 1.5))
	    (5 . (variable-pitch bold 1.4))
	    (6 . (variable-pitch bold 1.3))
	    (7 . (variable-pitch bold 1.2))
	    (agenda-date . (semilight 1.5))
	    (agenda-structure . (variable-pitch light 1.9))
	    (t . (variable-pitch 1.1))))
  (if (sen-theme-is-dark-p)
      (ef-themes--load-theme 'ef-bio)
    (ef-themes--load-theme 'ef-cyprus)))

(use-package modus-themes
  :vc (:url "https://gitlab.com/protesilaos/modus-themes"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :config
  (setopt modus-themes-custom-auto-reload nil
	  modus-themes-mixed-fonts t
	  modus-themes-variable-pitch-ui t
	  modus-themes-italic-constructs t
	  modus-themes-bold-constructs nil
	  modus-themes-completions '((t . (extrabold)))
	  modus-themes-prompts '(extrabold)
	  modus-themes-headings
	  '((agenda-structure . (variable-pitch light 2.2))
	    (agenda-date . (variable-pitch regular 1.3))
	    (t . (regular 1.15)))))


(use-package standard-themes
  :vc (:url "https://github.com/protesilaos/standard-themes"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :config
  (setopt standard-themes-bold-constructs t
	  standard-themes-italic-constructs t
	  standard-themes-mixed-fonts t
	  standard-themes-variable-pitch-ui t
	  standard-themes-mode-line-accented nil

	  ;; Accepts a symbol value
	  standard-themes-fringes 'subtle

	  ;; The following accept lists of properties
	  standard-themes-links nil
	  standard-themes-region nil
	  standard-themes-prompts nil

	  standard-themes-headings
	  '((0 . (variable-pitch light 1.9))
	    (1 . (variable-pitch light 1.8))
	    (2 . (variable-pitch light 1.7))
	    (3 . (variable-pitch semilight 1.6))
	    (4 . (variable-pitch semilight 1.5))
	    (5 . (variable-pitch bold 1.4))
	    (6 . (variable-pitch bold 1.3))
	    (7 . (variable-pitch bold 1.2))
	    (agenda-date . (1.3))
	    (agenda-structure . (variable-pitch light 1.8))
            (t . (variable-pitch 1.1)))))


(use-package pulsar
  :vc (:url "https://github.com/protesilaos/pulsar"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :hook
  ((next-error . (pulsar-pulse-line-red pulsar-recenter-top pulsar-reveal-entry))
   (minibuffer-setup . pulsar-pulse-line-red))
  :config
  (setopt pulsar-pulse t
	  pulsar-delay 0.055
	  pulsar-iterations 10)
  (pulsar-global-mode 1))

(use-package lin
  :vc (:url "https://github.com/protesilaos/lin"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :hook (emacs-startup . lin-global-mode)
  :config
  (setopt lin-face 'lin-blue))

(use-package spacious-padding
  :vc (:url "https://github.com/protesilaos/spacious-padding"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :if (display-graphic-p)
  :hook (window-setup . spacious-padding-mode))

(use-package colorful-mode
  :vc (:url "https://github.com/DevelopmentCool2449/colorful-mode"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :hook ((prog-mode text-mode) . colorful-mode))

(use-package nerd-icons
  :vc (:url "https://github.com/rainstormstudio/nerd-icons.el"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :config
  (when (and
	 (display-graphic-p)
	 (null (member nerd-icons-font-family (font-family-list))))
    (nerd-icons-install-fonts t)))

(use-package nerd-icons-completion
  :vc (:url "https://github.com/rainstormstudio/nerd-icons-completion"
	    :branch "main"
	    :rev :newest)
  :after marginalia
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :vc (:url "https://github.com/LuigiPiucco/nerd-icons-corfu"
	    :branch "master"
	    :rev :newest)
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :vc (:url "https://github.com/rainstormstudio/nerd-icons-dired"
	    :branch "main"
	    :rev :newest)
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))

;; (use-package doom-modeline
;;   :vc (:url "https://github.com/seagle0128/doom-modeline"
;; 	    :branch "master"
;; 	    :rev :newest)
;;   :after nerd-icons
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package display-line-numbers
  :ensure nil
  :hook (after-init . global-display-line-numbers-mode)
  :config
  (setopt display-line-numbers-type 'relative))

(use-package display-fill-column-indicator
  :ensure nil
  :hook ((prog-mode text-mode) . display-fill-column-indicator-mode)
  :config
  (setopt display-fill-column-indicator-column 80
	  display-fill-column-indicator-character ?\N{U+250A}))

(use-package time
  :ensure nil
  :hook (after-init . display-time-mode)
  :config
  (setopt display-time-format "%a %Y-%m-%d %I:%M %p"
	  diplay-time-default-load-average t))


(provide 'ui)
