;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (setq load-path
;; (cons "/Users/lal/.doom.d" load-path))

;; (require 'timestamp "timestamp")

(fset 'battery-update #'ignore)
(fset 'gnus  #'ignore)
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
                                         :scheduled tod)
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

;; window key mapping
(winum-mode)
(map! (:leader
        (:desc "Select dir-tree window" :g "0" #'treemacs-select-window))
)
(map! :leader
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4            ;
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9
  )

(defun my/alternate-window ()
  "Switch back and forth between current and last window in the
current frame."
  (interactive)
  (let (;; switch to first window previously shown in this frame
        (prev-window (get-mru-window nil t t)))
    ;; Check window was not found successfully
    (unless prev-window (user-error "Last window not found."))
    (select-window prev-window)
    (my/maybe-golden-ratio-adjust)))

(defun my/maybe-golden-ratio-adjust ()
  "Do golden ratio adjust if it's loaded and enabled."
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(map! (:leader
        (:desc "Jupyter" :g "<tab>" 'my/alternate-window)))

(setq make-backup-files nil)


;; (add-hook 'prog-mode-hook 'real-auto-save-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (setq real-auto-save-interval 1) ;; in seconds
;; (add-hook 'prog-mode-hook 'real-auto-save-mode)


;; buffer search customization
(map! (:leader
     (:desc "buffer find" :g "bf" nil)))

(map! (:leader
        (:desc "dwim" :g "bff" #'counsel-grep-or-swiper)))

(map! (:leader
        (:desc "search buffer snipe" :g "bf2" #'avy-goto-char-2)))

(map! (:leader
        (:desc "search buffer project" :g "bfp" #'counsel-git-grep)))



;; ein customization
(map! (:leader
        (:desc "Jupyter" :g "J" nil)))

(map! (:leader
        (:desc "run" :g "Jr" #'ein:run)))

(map! (:leader
        (:desc "login" :g "Jl" #'ein:login)))

(map! (:leader
        (:desc "open file" :g "Jf" #'ein:connect-to-notebook)))

(map! (:leader
        (:desc "go to next cell" :g "Jn" #'ein:worksheet-goto-next-input)))

(map! (:leader
        (:desc "go to prev cell" :g "Jp" #'ein:worksheet-goto-prev-input)))

(map! (:leader
        (:desc "execute" :g "Je" nil)))

(map! (:leader
        (:desc "execute cell and go to next" :g "Jec" #'ein:worksheet-execute-cell-and-goto-next)))

(map! (:leader
        (:desc "execute cell" :g "JeC" #'ein:worksheet-execute-cell)))


(defun displaymode ()
  (interactive)
  (print major-mode)
  )

(map! (:leader
        (:desc "mode" :g "M" nil)))

(map! (:leader
        (:desc "Major mode" :g "Mm" #'displaymode)))

;; enable whitespace minor mode after major mode of emacs-list-mode
;; (add-hook 'emacs-lisp-mode-hook 'whitespace-mode)

(global-whitespace-mode)
;; (menu-bar-mode)

(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))

  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
  (setq whitespace-display-mappings
        ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
        '(
          (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
          (newline-mark 10 [9166 10]) ; LINE FEED,
          (tab-mark 9 [9655 9] [92 9]) ; tab
          )))
;; evil customizatioN
(evil-define-motion evil-jzz (count)
  "j to jzz"
  :type line
  (evil-next-line (or count 1))
  (evil-scroll-line-to-center nil))
(define-key evil-normal-state-map (kbd "j") 'evil-jzz)

(evil-define-motion evil-kzz (count)
  "j to kzz"
  :type line
  (evil-previous-line (or count 1))
  (evil-scroll-line-to-center nil))
(define-key evil-normal-state-map (kbd "k") 'evil-kzz)

(global-set-key "\C-x\C-n" 'other-window)

(defun other-window-backward (&optional n)
  "Select the previous window"
  (interactive "P")
  (other-window ( - (prefix-numeric-value n) ))
)

(global-set-key "\C-x\C-p" 'other-window-backward)

(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

;; code jump

(map! (:leader
        (:desc "Jump back" :g "cb" #'dumb-jump-back)))
