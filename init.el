(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))
(require 'lsp-mode)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)

(defun duplicate-line ()
  "Duplicate the current line."
  (interactive)
  (let ((text (buffer-substring (line-beginning-position) (line-end-position))))
    (end-of-line)
    (newline)
    (insert text)))

(global-set-key (kbd "C-c d") 'duplicate-line)

(global-set-key (kbd "C-c t")
  (lambda () (interactive)
    (term "/data/data/com.termux/files/usr/bin/bash")))

(global-set-key (kbd "C-c x")
  (lambda () (interactive)
    (kill-whole-line)))

(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t)

(global-display-line-numbers-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
