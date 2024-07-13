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
(setq confirm-kill-emacs nil)
;; Add custom load path
(add-to-list 'load-path "~/.config/doom/plugins")

;; Load org-preview-html package
;;(require 'org-preview-html)
;;(map!
;; [remap evil-quit] #'kill-current-buffer)
(defun my-kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-this-buffer))
(evil-ex-define-cmd "q" 'my-kill-this-buffer)
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
;;     위의 bullet을 적어주거나 아니면 org-bullet(동그라미로만 나옴)을 사용해도 된다.
    (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕"))))
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
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already
;; config.el, setting templates for org-roam
;; (setq org-roam-capture-templates
;;       ;; org-hugo-export-to-md 명령으로 변환시킴
;;       '(("m" "main" plain
;;          "%?"
;;          :if-new
;;          (file+head "main/${slug}.org"
;;           "#+title: ${title}
;;           #+created: %U
;;           #+last_modified: %U\n\n")
;;          :immediate-finish t
;;          :unnarrowed t)
;;         ("r" "reference" plain
;;          "%?"
;;          :if-new
;;          (file+head "reference/${title}.org"
;;                     "#+title: ${title}
;;                     #+created: %U
;;                     #+last_modified: %U\n\n")
;;          :immediate-finish t
;;          :unnarrowed t)
;;         ("a" "article" plain             ;;                (article)
;;          "%?"
;;          :if-new
;;          (file+head "articles/${title}.org"
;;                    "#+HUGO_BASE_DIR: ~/kimnux12.github.io
;;                    #+HUGO_SECTION: ./content/post
;;                    #+HUGO_AUTO_SET_LASTMOD: t
;;                    #+TITLE: ${title}
;;                    #+DATE: %U
;;                    #+HUGO_TAGS: article
;;                    #+HUGO_DRAFT: false\n")
;;          :immediate-finish t
;;          :unnarrowed t)))
;; Drag-and-drop to `dired`
(require 'org-download)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./img")
(add-hook 'dired-mode-hook 'org-download-enable)
(setq org-image-actual-width 600)
(setq org-hugo-base-dir "/home/kimnux/Homepage")
(setq org-hugo-section "post")
;; Org 모드에서 줄바꿈을 유지하도록 설정
(setq org-export-preserve-breaks t)
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
(defalias 'perl-mode 'cperl-mode)
(setq
 cperl-hairy t
 cperl-indent-level 2
 cperl-close-paren-offset -2
 cperl-continued-statement-offset 2
 cperl-indent-parens-as-block t
 cperl-tab-always-indent t)
(setq lsp-pylsp-plugins-flake8-max-line-length 88)
(use-package! python-black
  :demand t
  :after python
  :config
  (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement))
(setq org-startup-with-inline-images t)
;; If you use this setting and don’t want to see images in a specific file,
;; add this at the top of the org files that are not to display images:
;; #+STARTUP: noinlineimages
;; Display inline images in selected Org files only
;; On the contrary, if you always want to see images save in specific org files:
;;     Don’t add the setq instruction we just saw
;;     Add this line at the top of each file for which you want Emacs to display its images:
;; #+STARTUP: inlineimages
(global-flycheck-mode +1)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'ielm)
(defun ielm/clear-repl ()
  "Clear current REPL buffer."
  (interactive)
  (let ((inhibit-read-only t))
      (erase-buffer)
      (ielm-send-input)))
(define-key inferior-emacs-lisp-mode-map
  (kbd "M-RET")
  #'ielm-return)
(define-key inferior-emacs-lisp-mode-map
  (kbd "C-j")
  #'ielm-return)
(define-key inferior-emacs-lisp-mode-map
  (kbd "RET")
  #'electric-newline-and-maybe-indent)
(define-key inferior-emacs-lisp-mode-map
  (kbd "<up>")
  #'previous-line)
(define-key inferior-emacs-lisp-mode-map
  (kbd "<down>")
  #'next-line)
(define-key inferior-emacs-lisp-mode-map
  (kbd "C-c C-q")
  #'ielm/clear-repl
  )
