;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

;;(package! tldr)
(package! rime)

;;; pyim
(package! pyim
  :recipe (:host github
           :repo "tumashu/pyim"
           :files ("*.el" "tests/*.el")))
;;
(package! liberime-config
  :recipe (:host github :repo "merrickluo/liberime"
           :files ("Makefile" "src" "liberime.el")))

;; 绘词框
(package! posframe)

;;(package! ox-hugo) ；已在init通过(＋)实现

(package! orderless)
;;(package! pyim)
;;(package! pyim-basedict)

;;; blog by wordpress
(package! org2blog)

;;; double-link note
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;; When using org-roam via the `+roam` flag
(unpin! org-roam)
(package! org-roam-ui)
;; When using bibtex-completion via the `biblio` module
(unpin! bibtex-completion helm-bibtex ivy-bibtex)


;; vulpea : org 和 rog－roam 的笔记功能集合
(package! vulpea)

;;
(package! mathpix.el
  :recipe (:host github :repo "jethrokuan/mathpix.el"
           :files ("mathpix.el")))

;; some magit dependencies break with Emacs 28, as the function defvar-keymap is only added in Emacs 29.
;;The solution is to pin an older version of the packages, as Doom currently does not support Emacs 29.
(package! transient
      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
      :recipe (:host github :repo "magit/transient"))

(package! with-editor
          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
          :recipe (:host github :repo "magit/with-editor"))

;;; Emacs 中英文字体配置工具。可以比较方便地实现中文字体和英文字体等宽
;; 适用于处理中英文混合表格不能对齐的中文 org-mode 用户
(package! cnfonts)
;; 更好的解决方案 Valign 搭配 ftable , 较于cnfonts 包，没有切换profile 功能了，性能也稍差
;; 但是是根据像素来实现对齐的，所以图片也支持对齐，但是实际上并没有改变×字体×的大小
(package! valign)
;; 要使 table.el 表与 valign 一起使用，
;; 每个单元格的右侧必须至少有一个空格，左侧必须没有空格。
;; 您可以使用 ftable.el 为您自动布局表格。
(package! ftable)
;; 源位于ELPA,先不加git 试试
