;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(fset 'battery-update #'ignore)
(setq explicit-shell-file-name "/bin/zsh")
(defun my/term ()
  "My personal term command."
  (interactive)
  (set-buffer (make-term "terminal" explicit-shell-file-name projectile-project-root))
  (term-mode)
  (term-char-mode)
  (switch-to-buffer "*terminal*"))
(map! (:leader
        (:desc "open shell" :g "oe" #'my/term)) ;; 这个快捷键是SPC o e
)

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                         :tag "bo")
                                  ))
  :config
  (org-super-agenda-mode)
  )
(setq display-line-numbers-type 'relative)
(setq doom-theme 'doom-peacock)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(winum-mode)

(map! (:leader
        (:desc "open shell" :g "0" #'treemacs-select-window))
)
(map! :leader
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9
  )
