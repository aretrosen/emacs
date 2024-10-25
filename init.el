;; Load path
(mapc
 (lambda (path)
   (add-to-list 'load-path (locate-user-emacs-file path)))
 '("modules"))

;; Setup package downloads
(setq package-archives
      '(("gnu-elpa-devel" . "https://elpa.gnu.org/devel/")
        ("gnu-elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq package-archive-priorities
      '(("melpa" . 4)
	("gnu-elpa-devel" . 3)
	("nongnu" . 2)
	("gnu-elpa" . 1)))

;; Mark themes as safe
(setq custom-safe-themes t)

;; Don't register package as project
(setq package-vc-register-as-project nil)

;; Load modules
(require 'ui)
(require 'completions)
(require 'basic)
