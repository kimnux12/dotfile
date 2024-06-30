;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(beacon-mode 1)
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 21))
(set-fontset-font "fontset-default" 'hangul (font-spec :family "NanumGothicCoding" :size 21))
;; 출처: https://codepractice.tistory.com/167 [코딩 연습:티스토리]
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; emacs 내장 한글 입력기 사용
;;(setq default-input-method "korean-hangul")
;;출처: https://codepractice.tistory.com/128 [코딩 연습:티스토리]
(setq confirm-kill-emacs nil)
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; lang/markdown/config.el -*- lexical-binding: t; -*-

;;(defvar +markdown-compile-functions
;;  '(+markdown-compile-marked
;;    +markdown-compile-pandoc
;;    +markdown-compile-markdown
;;    +markdown-compile-multimarkdown)
;;  "A list of commands to try when attempting to build a markdown file with
;;`markdown-open' or `markdown-preview', stopping at the first one to return non-nil.
;;
;;Each function takes three argument. The beginning position of the region to
;;capture, the end position, and the output buffer.")
;;
;;
;;;;
;;;;; Packages
;;
;;(use-package! markdown-mode
;;  :mode ("/README\\(?:\\.md\\)?\\'" . gfm-mode)
;;  :init
;;  (setq markdown-italic-underscore t
;;        markdown-asymmetric-header t
;;        markdown-gfm-additional-languages '("sh")
;;        markdown-make-gfm-checkboxes-buttons t
;;        markdown-fontify-whole-heading-line t
;;
;;        ;; `+markdown-compile' offers support for many transpilers (see
;;        ;; `+markdown-compile-functions'), which it tries until one succeeds.
;;        markdown-command #'+markdown-compile
;;        ;; This is set to `nil' by default, which causes a wrong-type-arg error
;;        ;; when you use `markdown-open'. These are more sensible defaults.
;;        markdown-open-command
;;        (cond ((featurep :system 'macos) "open")
;;              ((featurep :system 'linux) "xdg-open"))
;;
;;        ;; A sensible and simple default preamble for markdown exports that
;;        ;; takes after the github asthetic (plus highlightjs syntax coloring).
;;        markdown-content-type "application/xhtml+xml"
;;        markdown-css-paths
;;        '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css"
;;          "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github.min.css")
;;        markdown-xhtml-header-content
;;        (concat "<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>"
;;                "<style> body { box-sizing: border-box; max-width: 740px; width: 100%; margin: 40px auto; padding: 0 10px; } </style>"
;;                "<script id='MathJax-script' async src='https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js'></script>"
;;                "<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>"
;;                "<script>document.addEventListener('DOMContentLoaded', () => { document.body.classList.add('markdown-body'); document.querySelectorAll('pre[lang] > code').forEach((code) => { code.classList.add(code.parentElement.lang); }); document.querySelectorAll('pre > code').forEach((code) => { hljs.highlightBlock(code); }); });</script>"))
;;
;;  ;; A shorter alias for org src blocks than "markdown"
;;  (after! org-src
;;    (add-to-list 'org-src-lang-modes '("md" . markdown)))
;;
;;  :config
;;  (set-flyspell-predicate! '(markdown-mode gfm-mode)
;;    #'+markdown-flyspell-word-p)
;;  (set-lookup-handlers! '(markdown-mode gfm-mode)
;;    ;; `markdown-follow-thing-at-point' may open an external program or a
;;    ;; buffer. No good way to tell, so pretend it's async.
;;    :file '(markdown-follow-thing-at-point :async t))
;;
;;  (sp-local-pair '(markdown-mode gfm-mode) "`" "`"
;;                 :unless '(:add sp-point-before-word-p sp-point-before-same-p))
;;
;;  ;; Highly rust blocks correctly
;;  (when (modulep! :lang rust)
;;    (add-to-list 'markdown-code-lang-modes '("rust" . rustic-mode)))
;;
;;  ;; Don't trigger autofill in code blocks (see `auto-fill-mode')
;;  (setq-hook! 'markdown-mode-hook
;;    fill-nobreak-predicate (cons #'markdown-code-block-at-point-p
;;                                 fill-nobreak-predicate))
;;
;;  ;; HACK Prevent mis-fontification of YAML metadata blocks in `markdown-mode'
;;  ;;      which occurs when the first line contains a colon in it. See
;;  ;;      jrblevin/markdown-mode#328.
;;  (defadvice! +markdown-disable-front-matter-fontification-a (&rest _)
;;    :override #'markdown-match-generic-metadata
;;    (ignore (goto-char (point-max))))
;;
;;  (map! :map markdown-mode-map
;;        :localleader
;;        "'" #'markdown-edit-code-block
;;        "o" #'markdown-open
;;        "p" #'markdown-preview
;;        "e" #'markdown-export
;;        (:when (modulep! +grip)
;;         "p" #'grip-mode)
;;        (:prefix ("i" . "insert")
;;         :desc "Table Of Content"  "T" #'markdown-toc-generate-toc
;;         :desc "Image"             "i" #'markdown-insert-image
;;         :desc "Link"              "l" #'markdown-insert-link
;;         :desc "<hr>"              "-" #'markdown-insert-hr
;;         :desc "Heading 1"         "1" #'markdown-insert-header-atx-1
;;         :desc "Heading 2"         "2" #'markdown-insert-header-atx-2
;;         :desc "Heading 3"         "3" #'markdown-insert-header-atx-3
;;         :desc "Heading 4"         "4" #'markdown-insert-header-atx-4
;;         :desc "Heading 5"         "5" #'markdown-insert-header-atx-5
;;         :desc "Heading 6"         "6" #'markdown-insert-header-atx-6
;;         :desc "Code block"        "C" #'markdown-insert-gfm-code-block
;;         :desc "Pre region"        "P" #'markdown-pre-region
;;         :desc "Blockquote region" "Q" #'markdown-blockquote-region
;;         :desc "Checkbox"          "[" #'markdown-insert-gfm-checkbox
;;         :desc "Bold"              "b" #'markdown-insert-bold
;;         :desc "Inline code"       "c" #'markdown-insert-code
;;         :desc "Italic"            "e" #'markdown-insert-italic
;;         :desc "Footnote"          "f" #'markdown-insert-footnote
;;         :desc "Header dwim"       "h" #'markdown-insert-header-dwim
;;         :desc "Italic"            "i" #'markdown-insert-italic
;;         :desc "Kbd"               "k" #'markdown-insert-kbd
;;         :desc "Pre"               "p" #'markdown-insert-pre
;;         :desc "New blockquote"    "q" #'markdown-insert-blockquote
;;         :desc "Strike through"    "s" #'markdown-insert-strike-through
;;         :desc "Table"             "t" #'markdown-insert-table
;;         :desc "Wiki link"         "w" #'markdown-insert-wiki-link)
;;        (:prefix ("t" . "toggle")
;;         :desc "Inline LaTeX"      "e" #'markdown-toggle-math
;;         :desc "Code highlights"   "f" #'markdown-toggle-fontify-code-blocks-natively
;;         :desc "Inline images"     "i" #'markdown-toggle-inline-images
;;         :desc "URL hiding"        "l" #'markdown-toggle-url-hiding
;;         :desc "Markup hiding"     "m" #'markdown-toggle-markup-hiding
;;         :desc "Wiki links"        "w" #'markdown-toggle-wiki-links
;;         :desc "GFM checkbox"      "x" #'markdown-toggle-gfm-checkbox)))
;;
;;;;; ~/.doom.d/config.el
;;
;;(use-package! evil-markdown
;;  :when (modulep! :editor evil +everywhere)
;;  :hook (markdown-mode . evil-markdown-mode)
;;  :config
;;  (add-hook 'evil-markdown-mode-hook #'evil-normalize-keymaps)
;;  (map! :map evil-markdown-mode-map
;;        :n "TAB" #'markdown-cycle
;;        :n [backtab] #'markdown-shifttab
;;        :i "M-*" #'markdown-insert-list-item
;;        :i "M-b" #'markdown-insert-bold
;;        :i "M-i" #'markdown-insert-italic
;;        :i "M-`" #'+markdown/insert-del
;;        :i "M--" #'markdown-insert-hr
;;        :n "M-r" #'browse-url-of-file
;;        :m "]h"  #'markdown-next-visible-heading
;;        :m "[h"  #'markdown-previous-visible-heading
;;        :m "[p"  #'markdown-promote
;;        :m "]p"  #'markdown-demote
;;        :m "[l"  #'markdown-previous-link
;;        :m "]l"  #'markdown-next-link))

;; Change "theme name" to the selected highlightjs theme.
(add-to-list 'load-path "~/.config/doom")
(setq markdown-soma-highlightjs-theme "dracula")
(setq markdown-soma-custom-css "~/.config/doom/github-dark.css")
(require 'org-preview-html)
