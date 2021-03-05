;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rishad"
      user-mail-address "rskaraya@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrains Mono Light" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-snazzy)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dev/vaults")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq projectile-auto-discover nil)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; Launch fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Map "SPC f t" to open a treemacs window
(map! :leader "f t" #'treemacs)

;; Configure Prettier for the following modes
(add-hook! 'js2-mode-hook 'prettier-js-mode)
(add-hook! 'web-mode-hook 'prettier-js-mode)
(add-hook! 'rjsx-mode-hook 'prettier-js-mode)

;; Rainbow for brackets & highlight indent guides
(add-hook! 'prog-mode-hook 'rainbow-delimiters-mode)
(setq highlight-indent-guides-mode t)
(setq prettier-js-args '(
                         "--arrow-parens" "avoid"
                         "--semi" "false"
))
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(custom-set-faces!
  ;; `(rjsx-attr :foreground "#ff6ac1")
  `(rjsx-tag :foreground "#ff5c57")
  `(font-lock-string-face :foreground "#c3e88d")
)
