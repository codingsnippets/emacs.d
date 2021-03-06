(when (maybe-require-package 'ivy)
  (after-load 'ivy
    (setq-default ivy-use-virtual-buffers t
                  ivy-count-format "")
    ;; IDO-style directory navigation
    (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
    (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
    (when (maybe-require-package 'diminish)
      (diminish 'ivy-mode)))

  (add-hook 'after-init-hook
            (lambda ()
              (when (bound-and-true-p ido-ubiquitous-mode)
                (ido-ubiquitous-mode -1)
                (ido-mode -1))
              (ivy-mode 1))))


(when (maybe-require-package 'counsel)
  (setq-default counsel-mode-override-describe-bindings t)
  (when (maybe-require-package 'diminish)
    (after-load 'counsel
      (diminish 'counsel-mode)))
  (add-hook 'after-init-hook 'counsel-mode))


;;(when (maybe-require-package 'swiper)
;;  (after-load 'ivy
;;    (define-key ivy-mode-map (kbd "C-s") 'swiper)))



(provide 'init-ivy)
