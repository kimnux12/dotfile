(beacon-mode 1)
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "JetBrainsMono NFM" :size 20)
      doom-variable-pitch-font (font-spec :family "UbuntuMono Nerd Font Mono" :size 20)
      doom-big-font (font-spec :family "JetBrainsMono NFM" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;;(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 20))
(set-fontset-font "fontset-default" 'hangul (font-spec :family "NanumGothicCoding" :size 20))
;; 출처: https://codepractice.tistory.com/167 [코딩 연습:티스토리]
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
;; emacs 내장 한글 입력기 사용
;;(setq default-input-method "korean-hangul")
;;출처: https://codepractice.tistory.com/128 [코딩 연습:티스토리]
;; Add custom load path
(add-to-list 'load-path "~/.config/doom/plugins")

;; Load org-preview-html package
;;(require 'org-preview-html)
;;(map!
;; [remap evil-quit] #'kill-current-buffer)
;; Define :q command to close current buffer
(setq confirm-kill-emacs nil)
;; (defun my-kill-buffer-or-window ()
;;   "Kill the buffer, or close the window if there's only one.
;;    Prompts to save the buffer if it's unsaved."
;;   (interactive)
;;   (if (one-window-p)
;;       (progn
;;         (when (and (buffer-modified-p)
;;                    (eq (read-char-choice
;;                         "Buffer modified. Save buffer? (y/n/C)"
;;                         '(?y ?n ?C))
;;                        ?y))
;;          (save-buffer))
;;         (kill-buffer))
;;     (delete-window)))
;; (evil-ex-define-cmd "q[uit]" 'my-kill-buffer-or-window)
(evil-ex-define-cmd "q" 'kill-current-buffer)
(evil-ex-define-cmd "wq" 'doom/save-and-kill-buffer)
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (use-package org-fancy-priorities
;;    :ensure t
    :hook
    (org-mode . org-fancy-priorities-mode)
    :config
;;    (setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
    (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
;;     위의 bullet을 적어주거나 아니면 org-bullet(동그라미로만 나옴)을 사용해도 된다.
;;    (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
    (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
    (custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(org-agenda-date ((t (:foreground "Blue" :height 1.2))))
    '(org-agenda-date-weekend ((t (:foreground "Orange" :weight bold))))
    '(org-agenda-structure ((t (:foreground "Purple" :height 1.5 :weight bold))))
    '(org-block ((t (:background "gray20" :foreground "gray80"))))
    '(org-block-begin-line ((t (:background "gray30" :foreground "gray70"))))
    '(org-block-end-line ((t (:background "gray30" :foreground "gray70"))))
    '(org-date ((t (:foreground "LightSalmon" :underline t))))
    '(org-deadline ((t (:foreground "Red"))))
    '(org-done ((t (:foreground "Green" :weight bold))))
    '(org-level-1 ((t (:foreground "LightSkyBlue" :weight bold :height 1.3))))
    '(org-level-2 ((t (:foreground "LightGoldenrod" :weight bold :height 1.2))))
    '(org-level-3 ((t (:foreground "Cyan1" :weight bold :height 1.1))))
    '(org-link ((t (:foreground "SkyBlue2" :underline t))))
    '(org-list-dt ((t (:foreground "LightSkyBlue" :weight bold))))
    '(org-quote ((t (:foreground "LightGoldenrod" :slant italic))))
    '(org-scheduled ((t (:foreground "Green"))))
    '(org-table ((t (:foreground "LightSteelBlue" :weight normal))))
    '(org-tag ((t (:foreground "LightSalmon" :weight bold))))
    '(org-todo ((t (:foreground "Red" :weight bold))))))
(after! vterm
  (setq vterm-max-scrollback 10000) ;; 기본값은 100000입니다. 너무 큰 값을 줄이면 성능이 향상될 수 있습니다.
  (setq vterm-timer-delay 0.002))   ;; 기본값은 0.01입니다. 적절한 값을 조정해보세요.
;; lsp-mode 최적화
(after! lsp-mode
  (setq lsp-idle-delay 0.300) ;; 기본값은 0.5초, 필요에 따라 조정
  (setq lsp-log-io nil))      ;; IO 로깅 비활성화
;; Emacs GC 최적화
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1MB, 기본값은 4KB
;;(when (featurep 'xwidget-internal)
;;  (use-package xwidget
;;    :ensure t
;;    :config
;;    (defun my-browse-url-xwidget (url &optional new-session)
;;      "Browse URL with xwidget-webkit."
;;      (interactive (browse-url-interactive-arg "URL: "))
;;      (xwidget-webkit-browse-url url))
;;    (setq browse-url-browser-function 'my-browse-url-xwidget)))
(setq yas-snippet-dirs
      '("~/.config/doom/snippets")) ;;personal snippets
(require 'yasnippet)
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already
(add-hook 'yas-minor-mode-hook (lambda()
                                  (yas-activate-extra-mode 'fundamental-mode)))
(require 'org-download)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./img")
(add-hook 'dired-mode-hook 'org-download-enable)
(setq org-image-actual-width 600)
(setq org-hugo-base-dir "/home/kimnux/Homepage")
(setq org-hugo-section "post")
;; Org 모드에서 줄바꿈을 유지하도록 설정
;;(setq org-export-preserve-breaks t)
;; org tags의 하이픈, 스페이스등을 유지
(setq org-hugo-prefer-hyphen-in-tags nil)
;; ox-hugo 설정 추가
(require 'ox-hugo)
(setq org-hugo-auto-set-lastmod nil)
(after! ox-hugo (require 'backtrace))
(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3
        company-show-quick-access t)
  (add-hook
   'evil-normal-state-entry-hook #'company-abort))
;; (defalias 'perl-mode 'cperl-mode)
;; (setq
;;  cperl-hairy t
;;  cperl-indent-level 2
;;  cperl-close-paren-offset -2
;;  cperl-continued-statement-offset 2
;;  cperl-indent-parens-as-block t
;;  cperl-tab-always-indent t)
;; (setq lsp-pylsp-plugins-flake8-max-line-length 88)
;; (use-package! python-black
;;   :demand t
;;   :after python
;;   :config
;;   (add-hook! 'python-mode-hook #'python-black-on-save-mode)
;;   (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
;;   (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
;;   (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement))
(setq org-startup-with-inline-images t)
;; If you use this setting and don’t want to see images in a specific file,
;; add this at the top of the org files that are not to display images:
;; #+STARTUP: noinlineimages
;; Display inline images in selected Org files only
;; On the contrary, if you always want to see images save in specific org files:
;;     Don’t add the setq instruction we just saw
;;     Add this line at the top of each file for which you want Emacs to display its images:
;; #+STARTUP: inlineimages
;;(global-flycheck-mode +1)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (require 'ielm)
;; (defun ielm/clear-repl ()
;;   "Clear current REPL buffer."
;;   (interactive)
;;   (let ((inhibit-read-only t))
;;       (erase-buffer)
;;       (ielm-send-input)))
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "M-RET")
;;   #'ielm-return)
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "C-j")
;;   #'ielm-return)
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "RET")
;;   #'electric-newline-and-maybe-indent)
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "<up>")
;;   #'previous-line)
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "<down>")
;;   #'next-line)
;; (define-key inferior-emacs-lisp-mode-map
;;   (kbd "C-c C-q")
;;   #'ielm/clear-repl
;; )                                       ;
;; Enable Tree-sitter globally
;; Enable tree-sitter globally
(use-package! tree-sitter
  :hook ((prog-mode . global-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode))
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode))

;; Enable LSP for various languages
(use-package! lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((sh-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (raku-mode . lsp)
         (rust-mode . lsp))
  :config
  (setq lsp-prefer-capf t))

(use-package! lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-doc-enable t))

(use-package! company-lsp
  :commands company-lsp)

;; Additional configuration for specific languages if needed
(use-package! rustic
  :config
  (setq rustic-lsp-server 'rust-analyzer))

(use-package! lsp-perl)

;; Additional Tree-sitter language configurations
(use-package! tree-sitter-langs
  :after tree-sitter)

;; Flycheck configuration
(use-package! flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (defun disable-fylcheck-in-org-src-block ()
    (setq-local flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
  (add-hook 'org-src-mode-hook 'disable-fylcheck-in-org-src-block)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Use Flycheck with LSP
(use-package! lsp-mode
  :after flycheck
  :config
  (setq lsp-diagnostics-provider :flycheck))

;; Emacs Lisp specific settings without LSP
(use-package! elisp-mode
  :hook ((emacs-lisp-mode . flycheck-mode)
         (emacs-lisp-mode . (lambda () (setq flycheck-checker 'emacs-lisp-checkdoc)))))
;; Vertico configuration
(use-package! vertico
  :init
  (vertico-mode))

;; Enable richer annotations using the Marginalia package
(use-package! marginalia
  :after vertico
  :init
  (marginalia-mode))

;; Enable orderless for better completion styles
(use-package! orderless
  :init
  (setq completion-styles '(orderless)))

;; Use Consult for various commands
(use-package! consult
  :bind (("C-s" . consult-line)
         ("C-M-s" . consult-ripgrep)
         ("M-y" . consult-yank-pop)
         :map minibuffer-local-map
         ("M-s" . consult-history)))

;; Enable Embark and Embark Consult
(use-package! embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package! embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
