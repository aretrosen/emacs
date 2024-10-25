(use-package emacs
  :ensure nil
  :hook (after-init . column-number-mode)
  :config
  (setopt delete-pair-push-mark t))

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :config
  (setopt savehist-file "~/.cache/emacs/history"
	  savehist-save-minibuffer-history t))

(use-package dired
  :ensure nil
  :config
  (setopt dired-recursive-copies 'always
	  dired-recursive-deletes 'always))

(use-package trashed
  :vc (:url "https://github.com/shingo256/trashed"
	    :branch "master"
	    :rev :newest)
  :ensure t
  :commands (trashed)
  :config
  (setopt trashed-action-confirmer 'y-or-n-p
	  trashed-use-header-line t
	  trashed-sort-key '("Date deleted" . t)
	  trashed-date-format "%Y-%m-%d %H:%M:%S"))

(use-package time
  :ensure nil
  :commands (world-clock)
  :config
  (setopt world-clock-time-format "%R %z (%Z)	%A %d %B"
	  world-clock-buffer-name "*world-clock*"
	  zoneinfo-style-world-list `(
				      ("America/Los_Angeles" "San Diego")
				      ("America/Los_Angeles" "San Francisco")
				      ("America/Chicago" "Austin")
				      ("America/Toronto" "Toronto")
				      ("Asia/Kolkata" "Kolkata"))))

(provide 'basic)
