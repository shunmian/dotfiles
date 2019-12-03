;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(fset 'battery-update #'ignore)
(setq explicit-shell-file-name "/bin/zsh")
(defun my/term ()
  "My personal term command."
  (interactive)
  (set-buffer (make-term "terminal" explicit-shell-file-name))
  (term-mode)
  (term-char-mode)
  (switch-to-buffer "*terminal*"))
(map! (:leader
        (:desc "open shell" :g "oe" #'my/term)) ;; 这个快捷键是SPC o e
)
