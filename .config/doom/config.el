(beacon-mode 1)
(setq doom-theme 'doom-dracula)

;; 기본 폰트 설정 (monospace)
;; nerd font를 사용하는 경우에는 이미 다양한 아이콘과 기호를 포함하고 있어,
;; 일반적으로 별도의 symbol font나 unicode font를 지정할 필요는 없다.
;; 즉, 필요하진 않지만 원한다면 추가할 수는 있다는 정도로 생각하면 된다.
;; doom-big-font는 프리젠테이션이나 화면을 공유할 때 텍스트를 크게 보여주기 위해 사용한다.
;; doom emacs에서 큰 폰트를 사용하는 방법은 두 가지이다.
;; 'doom-big-font-mode'를 활성화하는 방법과 doom-big-font-mode를 활성화할 때 사용할 폰트를 지정하는 것이다.
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 20)
      doom-symbol-font (font-spec :family "Noto Sans Symbols" :size 20)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
;; 한글 문자셋에 대한 폰트 설정
(set-fontset-font t 'hangul (font-spec :family "NanumGothicCoding" :size 18))
;; Fallback 폰트 설정
;; 기본 폰트에서 특정 문자를 찾을 수 없을 때 사용할 폰트를 설정합니다.
;; fallback font가 작동하는지 확인하는 테스팅 문자: ℕ𝓟⧺×≠≥≤±¬∨∧∃∀λ⟿⟹⊥⊤⊢
(set-fontset-font t nil (font-spec :family "JuliaMono") nil 'append)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; org-level-1의 경우, 기본 폰트 설정인 JetBrainsMono Nerd Font Mono가 영어에 적용되고,
 ;; 한글은 한글 문자셋에 대한 별도 설정인 NanumGothicCoding이 적용됩니다.
 ;; 이로 인해 한글과 영어의 크기 및 스타일이 일치하지 않을 수 있습니다.
 ;; 해결 방법은 org-level-1 설정에 한글 폰트를 명시적으로 포함시켜
 ;; NanumGothicCoding만을 사용하는게 일관성이 있다.
 ;; 이는 다소 복잡할 수 있지만, Emacs의 face-remapping-alist나 set-fontset-font을
 ;; 활용해 특정 범위의 텍스트에 대해 폰트 설정을 세부 조정할 수 있습니다
 ;; 한편, 문서작업에는 variable이 적합한 반면, 유사한 패턴이 반복되는 코딩에는 monospace font가 적합하다.
 '(org-agenda-date ((t (:foreground "Blue" :height 1.2))))
 '(org-agenda-date-weekend ((t (:foreground "Orange" :weight bold))))
 '(org-agenda-structure ((t (:foreground "Purple" :height 1.5 :weight bold))))
 '(org-block ((t (:background "gray20" :foreground "gray80"))))
 '(org-block-begin-line ((t (:background "gray30" :foreground "gray70"))))
 '(org-block-end-line ((t (:background "gray30" :foreground "gray70"))))
 '(org-date ((t (:foreground "LightSalmon" :underline t))))
 '(org-deadline ((t (:foreground "Red"))))
 '(org-done ((t (:foreground "Green" :weight bold))))
 '(org-level-1 ((t (:foreground "LightSkyBlue" :weight bold :height 1.3 :family "본명조 KR"))))
 '(org-level-2 ((t (:foreground "LightGoldenrod" :weight bold :height 1.2 :family "본명조 KR"))))
 '(org-level-3 ((t (:foreground "Cyan1" :weight bold :height 1.1 :family "본명조 KR"))))
 '(org-link ((t (:foreground "SkyBlue2" :underline t))))
 '(org-list-dt ((t (:foreground "LightSkyBlue" :weight bold))))
 '(org-quote ((t (:foreground "LightGoldenrod" :slant italic))))
 '(org-scheduled ((t (:foreground "Green"))))
 '(org-table ((t (:family "NanumGothicCoding" :height 1.0 :foreground "LightSteelBlue")))) ;; org-table에 새 얼굴을 사용
 '(org-tag ((t (:foreground "LightSalmon" :weight bold))))
 '(org-todo ((t (:foreground "Red" :weight bold))))
)

(use-package org-superstar
 :hook (org-mode . org-superstar-mode)
 :config
 (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
 (setq org-superstar-item-bullet-alist '((?* . ?•)
                                         (?+ . ?➤)
                                         (?- . ?•)))
 (set-face-attribute 'org-superstar-item nil :height 0.8)
 (set-face-attribute 'org-superstar-header-bullet nil :height 0.8))

(use-package org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  ;; disable auto-complete in org-mode buffers
  (remove-hook 'org-mode-hook #'auto-fill-mode)
  ;; disable company too
  (setq company-global-modes '(not org-mode)))

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

(after! vterm
  (setq vterm-max-scrollback 10000) ;; 기본값은 100000입니다. 너무 큰 값을 줄이면 성능이 향상될 수 있습니다.
  (setq vterm-timer-delay 0.002))   ;; 기본값은 0.01입니다. 적절한 값을 조정해보세요.

;; lsp-mode 최적화
(after! lsp-mode
  (require 'lsp-docker)
  (setq lsp-prefer-flymake nil) ;; flycheck를 사용하도록 설정.
  (setq lsp-idle-delay 0.300) ;; 기본값은 0.5초, 필요에 따라 조정
  (setq lsp-log-io nil)      ;; IO 로깅 비활성화
  (add-hook 'python-mode-hook #'lsp) ;; sudo npm install -g pyright
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'c-mode-hook #'lsp)      ;; /usr/bin/clangd 파일이 있으면 ok.
  (add-hook 'bash-mode-hook #'lsp))  ;;sudo npm install -g bash-language-server
  ;; Doom Emacs에서 (after! lsp-mode ...) 블록 내에서 #'lsp를 사용하는 것은,
  ;; lsp 함수를 hook에 추가하기 위한 표준적인 방법입니다. #'lsp는 lsp를 함수 객체로
  ;; 변환하여, Emacs Lisp의 hook 시스템에서 이를 사용할 수 있도록 합니다.
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(require 'yasnippet)
(add-hook 'yas-minor-mode-hook (lambda()
                                  (yas-activate-extra-mode 'fundamental-mode)))

(setq yas-snippet-dirs '("~/.config/doom/snippets")) ;;personal snippets

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  ;; C++ 디버거로 gdb 사용
  (setq dap-cpptools-debugger '("gdb"))
  ;; 필요에 따라 추가 설정
  ;; (setq dap-cpptools-session-args '("--args"))
  (yas-global-mode 1)  ;; or M-x yas-reload-all if you've started YASnippet already
  (add-hook 'yas-minor-mode-hook (lambda()
                                   (yas-activate-extra-mode 'fundamental-mode))))
;; dap-mode와 lsp-mode 통합
(after! dap-mode
  ;; which-key 통합
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(require 'org-download)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./img")
(add-hook 'dired-mode-hook 'org-download-enable)

(setq org-image-actual-width 600)

(setq org-hugo-base-dir "/home/kimnux/kimnux12.github.io")
(setq org-hugo-section "post")
;; Org 모드에서 줄바꿈을 유지하도록 설정
;;(setq org-export-preserve-breaks t)
;; org tags의 하이픈, 스페이스등을 유지
(setq org-hugo-prefer-hyphen-in-tags nil)
;; ox-hugo 설정 추가
(require 'ox-hugo)
(setq org-hugo-auto-set-lastmod nil)
(after! ox-hugo 
		(require 'backtrace))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3
        company-show-quick-access t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort))

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

(after! company
  ;; company-mode에서 lsp-capf을 사용하도록 설정
  (setq company-backends '((company-capf company-files company-dabbrev))))

;; SLY 설정(common-lisp를 위채 설치한 것)
(after! sly
  ;; SBCL을 사용하는 경우
  (setq inferior-lisp-program "sbcl")

  ;; Lisp 모드에서 SLY 활성화
  (add-hook 'lisp-mode-hook #'sly-mode))

;; config.el 파일에서 SLIME 설정(common-lisp를 위해 설치한 것)
(after! slime
  ;; SBCL을 사용하는 경우
  (setq inferior-lisp-program "sbcl")
  
  ;; Lisp 모드에서 SLIME 활성화
  (add-hook 'lisp-mode-hook #'slime-mode)
  
  ;; SLIME에서 회사 모드 활성화 (선택 사항)
  (add-hook 'lisp-mode-hook #'company-mode))

;; undo-tree의 history를 emacs가 실행되는 동안만 보관하고,
;; emacs를 종료할 때 해당 히스토리 파일을 자동으로 삭제한다.

;; 만약 히스토리를 계속 저장하려면
;;(after! undo-tree
;;  (setq undo-tree-auto-save-history t)
;;  (setq undo-tree-history-directory-alist `(("." . ,(concat doom-cache-dir "undo")))))
;;
;;(defun my-undo-tree-make-history-save-file-name (orig-fun &rest args)
;;  "Add `.gz` extension to the filename returned by `undo-tree-make-history-save-file-name`."
;;  (concat (apply orig-fun args) ".gz"))
;;
;;(advice-add 'undo-tree-make-history-save-file-name :around #'my-undo-tree-make-history-save-file-name)
;; C-_ C-/ ('undo-tree-undo')
;; M-_ C-? ('undo-tree-redo")

(after! undo-tree
  ;; 자동 저장 비활성화
  (setq undo-tree-auto-save-history nil)
  
  ;; 히스토리 저장 디렉토리 설정 (임시 디렉토리 사용, temporary-file-directory는 SPC-;로 eval해보면 됨)
  ;; 히스토리를 무한정 파일로 쌓지는 않지만, 파일을 임시로 저장하는 것은 성능에 영향을 미칠 수도 있다.
  (setq undo-tree-history-directory-alist `(("." . ,(concat temporary-file-directory "undo")))))

(defun my-clear-undo-tree-history ()
  "Clear undo-tree history files on Emacs exit."
  (let ((history-dir (concat temporary-file-directory "undo")))
    (when (file-directory-p history-dir)
      (delete-directory history-dir t))))

(add-hook 'kill-emacs-hook #'my-clear-undo-tree-history)
