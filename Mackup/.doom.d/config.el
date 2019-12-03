;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(fset 'battery-update #'ignore)
(setq explicit-shell-file-name "/bin/zsh")
(map! (:leader
        (:desc "open shell" :g "oe" #'ansi-term)) ;; 这个快捷键是SPC o e
)
