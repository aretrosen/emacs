;; Enable native compilation
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent
	native-compile-prune-cache t
	package-native-compile t))

;; Set eln-cache dir
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache "~/.cache/emacs/eln-cache/"))

;; Backup Settings
(defvar backup-directory "~/.cache/emacs/backups/")
(unless (file-exists-p backup-directory) (make-directory backup-directory t))
(setq backup-directory-alist `(("." . ,backup-directory)))
(setq backup-by-copying-when-linked t
      version-control t
      kept-new-versions 4
      kept-old-versions 3
      delete-old-versions t
      delete-by-moving-to-trash t
      auto-save-timeout 20
      auto-save-interval 200)

;; History Settings
(setq history-length 100
      history-delete-duplicates t)

;; Auto Save Settings
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save/"
      auto-save-file-name-transforms `((".*" "~/.cache/emacs/auto-save/" t)))

;; Set package directory
(setq package-user-dir "~/.cache/emacs/packages")

;; Custom file location
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Remove unnecessary gui elements
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Set dark/light mode for themes
(defcustom sen-theme-mode 'light
  "Determines the current theme mode."
  :group 'sen
  :type '(choice :tag "Theme Mode" :value light
		 (const :tag "Light" light)
		 (const :tag "Dark" dark)
		 (const :tag "System" system)))

;; Check if theme should be dark or not
(defun sen-theme-is-dark-p()
  "Return t if the current theme is dark, nil otherwise."
  (if (and (eq sen-theme-mode 'system)
           (string-match-p "uint32 1" 
                          (shell-command-to-string 
                           "gdbus call --session --dest=org.freedesktop.portal.Desktop --object-path=/org/freedesktop/portal/desktop --method=org.freedesktop.portal.Settings.Read org.freedesktop.appearance color-scheme")))
      t
    (eq sen-theme-mode 'dark)))
