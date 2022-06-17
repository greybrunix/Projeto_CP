(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes '(leuven))
 '(doc-view-continuous t)
 '(elcord-mode t nil (elcord))
 '(haskell-check-command "hlint")
 '(haskell-font-lock-symbols nil)
 '(haskell-literate-default 'bird)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(pdf-tools mmm-jinja2 mmm-mode fira-code-mode elcord haskell-mode)))
(package-initialize)


; Remove the hard-coded 'literate-haskell-mode' activation for `.lhs' files that
; haskell-mode comes with. In exchange, enable LaTeX mode whenever we open up a
; `.lhs' file. Using mmm-mode, we will activate `haskell-mode' in the code
; sections.
(setq auto-mode-alist
  (remove
    (rassoc 'literate-haskell-mode auto-mode-alist) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.lhs$" . latex-mode))

; Literate Haskell - mmm-mode. Adopted from
; https://wiki.haskell.org/Literate_programming#Multi-mode_support_in_Emacs
(require 'mmm-auto)

(mmm-add-classes
  '((literate-haskell-latex
    :submode haskell-mode
    :front "^\\\\begin{code}\n"
    :back "^\\\\end{code}"
  )))

; Re-fontify sub-mode portions when idle. The manual command for this is
; `mmm-parse-buffer'. If you don't do this, then syntax highlighting won't work
; for new regions of Haskell code in the \begin{code}...\end{code} blocks.
(setq mmm-parse-when-idle 't)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fixedsys Excelsior" :foundry "outline" :slant normal :weight normal :height 203 :width normal)))))
