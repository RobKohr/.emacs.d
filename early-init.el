;;; -*- lexical-binding: t -*-
;;;  ________                                                _______                 __                            __
;;; /        |                                              /       \               /  |                          /  |
;;; $$$$$$$$/ _____  ____   ______   _______  _______       $$$$$$$  | ______   ____$$ | ______   ______   _______$$ |   __
;;; $$ |__   /     \/    \ /      \ /       |/       |      $$ |__$$ |/      \ /    $$ |/      \ /      \ /       $$ |  /  |
;;; $$    |  $$$$$$ $$$$  |$$$$$$  /$$$$$$$//$$$$$$$/       $$    $$</$$$$$$  /$$$$$$$ /$$$$$$  /$$$$$$  /$$$$$$$/$$ |_/$$/
;;; $$$$$/   $$ | $$ | $$ |/    $$ $$ |     $$      \       $$$$$$$  $$    $$ $$ |  $$ $$ |  $$/$$ |  $$ $$ |     $$   $$<
;;; $$ |_____$$ | $$ | $$ /$$$$$$$ $$ \_____ $$$$$$  |      $$ |__$$ $$$$$$$$/$$ \__$$ $$ |     $$ \__$$ $$ \_____$$$$$$  \
;;; $$       $$ | $$ | $$ $$    $$ $$       /     $$/       $$    $$/$$       $$    $$ $$ |     $$    $$/$$       $$ | $$  |
;;; $$$$$$$$/$$/  $$/  $$/ $$$$$$$/ $$$$$$$/$$$$$$$/        $$$$$$$/  $$$$$$$/ $$$$$$$/$$/       $$$$$$/  $$$$$$$/$$/   $$/


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Basic settings for quick startup and convenience
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Startup speed, annoyance suppression
(setq bedrock--initial-gc-threshold gc-cons-threshold)
(setq gc-cons-threshold 10000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; Silence stupid startup message
(advice-add #'display-startup-echo-area-message :override #'ignore)

;; Tell use-package to install if missing by default
;; Use `:ensure nil' in packages you *don't* want to install
(setq use-package-always-ensure t)

;; Setting *-resize-pixelwise to `t' lets frames/windows resize
;; smoothly at sub-character increments
(setq frame-resize-pixelwise t)
; (setq window-resize-pixelwise t)

(when (fboundp 'tool-bar-mode) ; When in a GUI, disable tool bar;
  (tool-bar-mode -1))          ; all these tools are in the menu-bar anyway

;; These settings apply to *all* frames.
(setq default-frame-alist '(
                            ;; You can turn off scroll bars by uncommenting these lines:
                            ;; (vertical-scroll-bars . nil)
                            ;; (horizontal-scroll-bars . nil)
                            (ns-appearance . dark)
                            (ns-transparent-titlebar . t)

                            ;; Use this to turn off the OS window decoration
                            ;; (undecorated-round . t)
                            ;; (internal-border-width . 3)
                            ))

;; These settings apply to the first frame created. The
;; (back|fore)ground-color settings need to live here so that a
;; theme's background color applies correctly to subsequent frames.
(setq initial-frame-alist '(;; Setting the face in here prevents flashes of
                            ;; color as the theme gets activated
                            (background-color . "#000000")
                            (foreground-color . "#ffffff")))

(add-hook 'window-setup-hook
          (lambda ()
            (let* ((workarea (frame-monitor-workarea))
                   (wa-x (nth 0 workarea))
                   (wa-y (nth 1 workarea))
                   (wa-width (nth 2 workarea))
                   (wa-height (nth 3 workarea))
                   (target-width (- (/ (* 2 wa-width) 3) 35)))
              (set-frame-position (selected-frame) wa-x wa-y)
              (set-frame-size (selected-frame) target-width wa-height t))))
