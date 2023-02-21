(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds '("https://lucidmanager.org/tags/emacs/index.xml"))
 '(pyim-dicts
   '((:name "pyim-tsinghua-dict" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/pyim-tsinghua-dict.pyim" :disable nil)
     (:name "cs" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/cs.pyim")
     (:name "mysql" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/mysql.pyim")
     (:name "math" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/zx.pyim" :disable t)
     (:name "math" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/math.pyim")
     (:name "aq" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/aq.pyim")
     (:name "food" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/food.pyim" :disable t)
     (:name "op" :file "~/.doom.d/lisp/package/pyim-tsinghua-dict/op.pyim" :disable nil)
     (:name "pyim-bigdict" :file "~/.doom.d/lisp/package/pyim-bigdict/pyim-bigdict.pyim")))
 '(warning-suppress-types '(((org-roam)) ((org-roam)) ((org-roam)) (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'pyim)
;(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
;(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(require 'liberime nil t)
(setq default-input-method "pyim")
(with-eval-after-load "liberime"
  (liberime-try-select-schema "luna_pinyin_simp")
  (setq pyim-default-scheme 'rime-quanpin))
;(require 'popup)

;(let ((liberime-auto-build t))
;  (require 'liberime nil t))
