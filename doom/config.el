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
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font
      (font-spec :family "Hack Nerd Font" :size 18 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 18))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-molokai)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 1)

;; Use system clipboard for all yank and kill operations
(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq save-interprogram-paste-before-kill t)
(setq x-select-enable-clipboard-manager nil)

;; Make the background transparent
(set-frame-parameter (selected-frame) 'alpha '(95 . 95)) ;; 95% opacity
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; Delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default show-trailing-whitespace t)

;; Allows 10 lines up and down when you navigate
(setq scroll-margin 10
      maximum-scroll-margin 0.8)

;; Don't wrap lines
(setq-default truncate-lines t)



(after! lsp-mode
  ;; Use pyright as default LSP server
  (setq lsp-pyright-multi-root nil
        lsp-pyright-disable-language-service nil
        lsp-pyright-disable-organize-imports nil))

;; Optional: Use black for formatting
(setq python-format-on-save t)

;;; add to $DOOMDIR/config.el
;; for eglot users
(after! python
  (set-eglot-client! '(python-mode python-ts-mode) '("ty" "server")))

;; Not necessary for lsp-mode users, because `ty-ls' is already priority = -1
;; (lower = higher priority). Including this for posterity:
(after! python
  (set-lsp-priority! 'ty-ls -5)) ; default is -1
(after! python
  (set-formatter! 'ruff :modes '(python-mode python-ts-mode)))



(after! cc-mode
  (set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0")))
