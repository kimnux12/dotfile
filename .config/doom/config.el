;; -*- mode: emacs-lisp -*-

(beacon-mode 1)
(setq doom-theme 'doom-dracula)

(setq fancy-splash-image "~/.config/doom/images/cat-train.png")
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Emacs!")))
;; fancy-startup-text는 init.el의 :ui에서
;; doom dashboard 대신 (startup +fancy)를 사용해야 적용된다.
;; doom dashboard에서는 실행이 되지 않는다.
;;(setq fancy-startup-text "Welcome to Doom Emacs!")

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
;; (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
 (setq org-superstar-headline-bullets-list '("⦾" "▪" "▫" "•" "▪" "▫" "•"))
 (setq org-superstar-item-bullet-alist '((?* . ?•)
                                         (?+ . ?➤)
                                         (?- . ?•)))
 (set-face-attribute 'org-superstar-item nil :height 1.0)
 (set-face-attribute 'org-superstar-header-bullet nil :height 1.0))

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
(evil-ex-define-cmd "q" 'kill-current-buffer)
(evil-ex-define-cmd "wq" 'doom/save-and-kill-buffer)

(after! vterm
  (setq vterm-max-scrollback 5000) ;; 기본값은 100000입니다. 너무 큰 값을 줄이면 성능이 향상될 수 있습니다.
  (setq vterm-timer-delay 0.002))   ;; 기본값은 0.01입니다. 적절한 값을 조정해보세요.

;; info-colors 설정
(add-hook 'Info-selection-hook 'info-colors-fontify-node)

;; codeium 설정
;; we recommend using use-package to organize your init.el
;; (use-package codeium
;;     ;; if you use straight
;;     ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
;;     ;; otherwise, make sure that the codeium.el file is on load-path

;;     :init
;;     ;; use globally
;;     (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
;;     ;; or on a hook
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

;;     ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions
;;     ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
;;     ;; an async company-backend is coming soon!

;;     ;; codeium-completion-at-point is autoloaded, but you can
;;     ;; optionally set a timer, which might speed up things as the
;;     ;; codeium local language server takes ~0.2s to start up
;;     ;; (add-hook 'emacs-startup-hook
;;     ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

;;     ;; :defer t ;; lazy loading, if you want
;;     :config
;;     (setq use-dialog-box nil) ;; do not use popup boxes

;;     ;; if you don't want to use customize to save the api-key
;;     ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

;;     ;; get codeium status in the modeline
;;     (setq codeium-mode-line-enable
;;         (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
;;     (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
;;     ;; alternatively for a more extensive mode-line
;;     ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

;;     ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
;;     (setq codeium-api-enabled
;;         (lambda (api)
;;             (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
;;     ;; you can also set a config for a single buffer like this:
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local codeium/editor_options/tab_size 4)))

;;     ;; You can overwrite all the codeium configs!
;;     ;; for example, we recommend limiting the string sent to codeium for better performance
;;     (defun my-codeium/document/text ()
;;         (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
;;     ;; if you change the text, you should also change the cursor_offset
;;     ;; warning: this is measured by UTF-8 encoded bytes
;;     (defun my-codeium/document/cursor_offset ()
;;         (codeium-utf8-byte-length
;;             (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
;;     (setq codeium/document/text 'my-codeium/document/text)
;;     (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

;; lsp-mode 최적화
;; lsp-mode 설정
(after! lsp-mode
  (setq lsp-prefer-flymake nil)  ;; flymake 대신 flycheck 사용 설정
  (setq lsp-idle-delay 0.300)    ;; LSP 서버가 입력을 기다리는 시간 설정
  (setq lsp-log-io nil)          ;; IO 로깅 비활성화
  (require 'lsp-docker)
  (require 'lsp-mode))

;; lsp-ui 설정
(after! lsp-ui
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

;; company 설정
(after! company
  (add-hook 'lsp-mode-hook #'company-mode))

(after! treemacs
  (setq treemacs-width 30)
  (setq treemacs-follow-mode t)
  (setq treemacs-git-mode 'deferred))

;; lsp-treemacs 설정
(after! lsp-treemacs
  (require 'lsp-treemacs)
  (add-hook 'lsp-mode-hook #'lsp-treemacs-sync))

;; 각 언어 모드에서 lsp 모드 활성화
(after! lsp-mode
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'sh-mode-hook #'lsp))

;; Flycheck 전역 활성화
(add-hook 'prog-mode-hook 'flycheck-mode)
;; Emacs Lisp 모드에서 `emacs-lisp` 및 `emacs-lisp-checkdoc` 검사기 비활성화
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; Emacs Lisp 모드에서 `emacs-lisp` 및 `emacs-lisp-checkdoc` 검사기를 비활성화
            (setq-local flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc))))
;; Flycheck 전역 설정(옵션)
(with-eval-after-load 'flycheck
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (setq flycheck-global-modes '(not emacs-lisp-mode)))

;; Garbage collections 및ㄷ 성능 설정
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

;; yasnippet 설정
(require 'yasnippet)
;; yasnippet을 기본적인 텍스트입력모드에서도 사용
(add-hook 'yas-minor-mode-hook (lambda()
                                  (yas-activate-extra-mode 'fundamental-mode)))

(setq yas-snippet-dirs '("~/.config/doom/snippets")) ;;personal snippets

;; lsp 및 yasnippet 통합
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

;; org 다운로드 설정
(require 'org-download)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./img")
(add-hook 'dired-mode-hook 'org-download-enable)

;; sh용 셋팅
(setq sh-basic-offset 2
      sh-indentation 2)
;; snippets, please
(add-hook 'sh-mode-hook 'yas-minor-mode)
;; on the fly syntax checking
(add-hook 'sh-mode-hook 'flycheck-mode)

;; org hugo 설정
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
(after! ox-hugo (require 'backtrace))

;; company 설정
;; company-capf의 역할
;; 출처 : https://company-mode.github.io/manual/Backends.html
;; 1. 완성 로직의 경향: 현재 Emacs에서는 코드 자동 완성 기능을 제공하는 방법으로
;; completion-at-point-functions (CAPF)를 사용하는 것이 일반적입니다.
;; CAPF는 Emacs의 표준 완성 시스템을 기반으로 한 기능입니다.
;;
;; 2. LSP와의 연관: LSP(언어 서버 프로토콜)를 지원하는 많은 패키지들도 이 CAPF
;; 기능을 사용하여 코드 완성을 제공합니다. LSP는 코드 편집기와 언어 서버 간의 통신을
;; 통해 코드 분석 및 완성 기능을 제공하는 프로토콜입니다.
;;
;; 3. company-capf의 역할: company-capf는 Emacs의 company 패키지와
;; 표준 CAPF 시스템 사이의 다리 역할을 합니다. company는 Emacs의 코드 자동 완성 패키지입니다.
;; 즉, company-capf를 사용하면 company 패키지가 CAPF 기반의 완성 기능을 활용할 수 있습니다.
;;
;; 4. 추천 및 사용: 현재 company-capf는 많은 사람들이 사용하고 추천하는 백엔드 중 하나로,
;; 특히 Emacs Lisp 같은 프로그래밍에서도 많이 사용됩니다.
;; 요약하자면, company-capf는 Emacs에서 코드 자동 완성을 설정하는 데 있어 표준 방식인 CAPF와
;; company 패키지 간의 연결을 제공하는 도구이며, 많은 사람들이 이 방법을 사용하고 추천한다는 의미입니다.
;;
;; -------------------
;;
;; 약어(abbrev) 기능의 종류
;; 1. 기본 약어 기능
;; Emacs에서 기본 약어 기능을 사용하려면, abbrev-mode를 활성화해야 합니다.
;; 이를 통해 약어를 정의하고 사용할 수 있습니다. 약어를 정의하려면 define-abbrev를
;; 사용하여 abbrev를 설정합니다. 이 설정은 Emacs에서 약어 기능이 자동으로 작동하도록 합니다.
;;
;; 2. 동적 약어 기능
;; 동적 약어는 Emacs의 dabbrev 기능을 활용하여 자동으로 확장을 결정할 수 있습니다.
;; 이를 위해 company-dabbrev 백엔드가 설정되어 있어야 합니다.
;; 또한, 동적 약어가 버퍼 내의 텍스트를 기반으로 약어를 제안하도록 하려면
;; company-dabbrev를 추가하는 것이 좋습니다.
(after! company
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 3
        company-show-quick-access t)
  (setq company-backends '((company-codeium
                            company-capf
                            company-yasnippet
                            company-files
                            company-dabbrev)))
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
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; SLY 설정(common-lisp를 위해 설치한 것)
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

;; 물리 메모리가 32G인경우, 대용량 파일의 크기를 10MB로 설정하여
;; 10MB 이상의 파일을 편집할 경우 undo-tree를 비활성화시켜 성능저하를 막고자 한다.
(defun my-disable-undo-tree-for-large-files ()
  "Disable undo-tree for large files based on buffer size."
  (when (> (buffer-size) (* 10 1024 1024))  ;; 10 MB를 기준으로 설정
    (undo-tree-mode -1)))

(add-hook 'find-file-hook #'my-disable-undo-tree-for-large-files)

;; 투명도 설정
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; which-key 기본 설정
;; which-key-use-C-h-commands를 t로 설정하면, C-x같은 prefix를 눌렀을때
;; 미니버퍼에 C-h를 누르라는 안내문이 나오게 되고, C-h를 누르고 j 또는 k를 누르면
;; 다음페이지, 이전페이지로 이동하게된다.
;; 단, j,k는 한번씩만 작동하므로 C-h j, C-h k로 매번 실행줘야 C-x 화면에서
;; 벗어나지 않고 다음이나 이전 페이지로 이동이 가능하게 된다.
(after! which-key
  (setq which-key-use-C-h-commands t)
  (setq which-key-idle-delay 0.5)  ;; 도움말이 표시되는 대기 시간
  (which-key-mode))                ;; which-key 모드 활성화

;; embark 설정
(use-package embark
  ;; :bind
  ;; (("C-." . embark-act)         ;; Pick some comfortable binding
  ;;  ("C-;" . embark-dwim)        ;; Good alternative: M-.
  ;;  ("C-h B" . embark-bindings)) ;; Alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  ;; Show the Embark target at point via Eldoc
  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Configure Embark-Consult
(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Doom Emacs의 리더 키를 사용하여 Embark 명령 설정
(map! :leader
      :desc "Embark act" "e a" #'embark-act
      :desc "Embark do what I mean" "e d" #'embark-dwim)

;; 페이지 이동을 위한 키 바인딩 설정
(after! evil
;; Doom Emacs의 리더 키를 사용하여 Embark 명령 설정
  ;; Insert 모드에서 공백 입력을 유지
  (evil-define-key 'insert global-map
    (kbd "SPC") 'self-insert-command)  ;; 공백 입력 유지

  ;; Normal 모드에서 리더 키와 관련된 명령 바인딩
  (evil-define-key 'normal global-map
    (kbd "SPC e a") #'embark-act
    (kbd "SPC e d") #'embark-dwim)

  ;; Visual 모드에서 리더 키를 사용할 수 있도록 설정
  (evil-define-key 'visual global-map
    (kbd "SPC e a") #'embark-act
    (kbd "SPC e d") #'embark-dwim))
  
;; Eldoc을 사용하여 Embark의 도움말 기능 설정
(after! eldoc
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly))
