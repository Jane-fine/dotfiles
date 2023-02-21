;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; my private config

;;; 绑定按键
(global-set-key (kbd "M-w") 'kill-region)              ; 交换 M-w 和 C-w，M-w 为剪切
(global-set-key (kbd "C-w") 'kill-ring-save)           ; 交换 M-w 和 C-w ， C-w 为复制 在evil－mode normal模式中。y复制（支持wsl2联系win剪切板（clipetty仓库有可以阅读的code），不知道怎么做到的），p粘贴
;;(global-set-key (kbd “<menu>”) nil)
;;(define-key key-translation-map (kbd “<menu>”) 'event-apply-super-modifier)
;;;key-banding form 21 days learning emacs
;; bind app key to super
;;(setq w32-apps-modifier 'super)
;;(setq w32-pass-lwindow-to-system nil)
;;(setq w32-lwindow-modifier 'super)
;;(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
;;(global-set-key (kbd "s-c") 'kill-region-ring-save) ;;对应Windows上面的Ctrl-c 复制
;;(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
;;(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
;;(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销-;;
;;(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切

;;; keymap 案例
;(map! :leader
;      (:prefix ("a" . "applications")
;       :desc "Export Org to HTML"
;       "e" #'org-html-export-to-html))

;;; multiple-cursors 多光标支持
;; (use-package multiple-cursors
;;   :ensure t
;;   :after hydra
;;   :bind
;;   (("C-x C-h m" . hydra-multiple-cursors/body)
;;    ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))
;;   :hydra (hydra-multiple-cursors
;; 		  (:hint nil)
;; 		  "
;; Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
;; ------------------------------------------------------------------
;;  [_p_]   Prev     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
;;  [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
;;  [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search      [_q_] Quit
;;  [_|_] Align with input CHAR       [Click] Cursor at point"
;; 		  ("l" mc/edit-lines :exit t)
;; 		  ("a" mc/mark-all-like-this :exit t)
;; 		  ("n" mc/mark-next-like-this)
;; 		  ("N" mc/skip-to-next-like-this)
;; 		  ("M-n" mc/unmark-next-like-this)
;; 		  ("p" mc/mark-previous-like-this)
;; 		  ("P" mc/skip-to-previous-like-this)
;; 		  ("M-p" mc/unmark-previous-like-this)
;; 		  ("|" mc/vertical-align)
;; 		  ("s" mc/mark-all-in-region-regexp :exit t)
;; 		  ("0" mc/insert-numbers :exit t)
;; 		  ("A" mc/insert-letters :exit t)
;; 		  ("<mouse-1>" mc/add-cursor-on-click)
;; 		  ;; Help with click recognition in this hydra
;; 		  ("<down-mouse-1>" ignore)
;; 		  ("<drag-mouse-1>" ignore)
;; 		  ("q" nil)))

;;rime
;;(use-package! rime
;;  :custom
;;  (default-input-method "rime")
;;  (rime-show-candidate 'posframe))
;;(use-package ox-hugo
;;  :ensure t   ;Auto-install the package from Melpa
;;  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
;;  :after ox)
;;;(use-package! cnfonts
;;  :init
;;  (cnfonts-mode 1)
;;  :config
  ;; 添加两个字号增大缩小的快捷键
  ;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  ;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize))
;;)
;;; pyim 个人配置
;;(use-package! liberime)
(use-package! pyim
  :init
;;  (setq pyim-title "C")
  ;;(require 'pyim-dregcache)
  (require 'pyim-cregexp)
  (require 'pyim-cstring)

  ;;(require 'pyim-basedict)    ;不好用;已通过dict－manger改用某某维护的tsing－dict
  :config
  ;;自带字典，目前够用
  ;;(pyim-basedict-enable)
  ;;(setq pyim-dcache-backend 'pyim-dregcache)
  (setq pyim-page-tooltip 'popup)       ;发现childframe不能上屏，toolbar也是
  (setq pyim-page-style 'two-lines)      ;调整 tooltip 选词框的显示样式
  (setq pyim-page-length 4)           ;显示 5 个候选词
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'quanpin)
  (setq-default pyim-punctuation-translate-p '(auto))
  (global-set-key (kbd "M-i") 'pyim-convert-string-at-point) ;金手指
  ;;(setq pyim-cloudim 'baidu)                                 ;不知道有没有生效
  (pyim-isearch-mode 1)

  ;;官网抄下来的指示器函数
  (setq pyim-indicator-list (list #'my-pyim-indicator-with-cursor-color #'pyim-indicator-with-modeline))
  (defun my-pyim-indicator-with-cursor-color (input-method chinese-input-p)
  (if (not (equal input-method "pyim"))
      (progn
        ;; pyim 未激活时的光标颜色设置语句
        (set-cursor-color "green"))
    (if chinese-input-p
        (progn
          ;; pyim 输入中文时的光标颜色
          (set-cursor-color "red"))
      ;; pyim 输入英文时的光标颜色
      (set-cursor-color "blue"))))
  
  (setq-default pyim-english-input-switch-functions ;下面任何一个返回t，pyim开启英文模式
              '(pyim-probe-program-mode
                pyim-probe-org-speed-commands
                pyim-probe-isearch-mode ;isearch 搜索时强制中文
                pyim-probe-org-structure-template
                ;;发现下面这个在 minibuffer 处由于金手指因按键冲突（M-p 输入minibuffer上个历史纪录）失效，而取消启用，但在某些模式下很好用，遂修改金手指为M-i。nice :)
                pyim-probe-dynamic-english  ;这个模式会根据前文是否为英文，返回t
                pyim-probe-evil-normal-mode ;判断是否为evil的normal模式，是返回t
                ))

  (setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))


  (global-set-key (kbd "M-f") 'pyim-forward-word)
  (global-set-key (kbd "M-b") 'pyim-backward-word)
)
;;
;;通过手动加词和删词自定义词库（用于弥补pyim 的多字）
;;`pyim-convert-string-at-point’ 金手指命令，可以比较方便的添加和删除词条，比如：
;;      在 “你好” 后面输入 2, 然后运行金手指命令，可以将 “你好” 加入个人词库。
;;      在 “你好” 后面输入 2-, 然后运行金手指命令，可以将 “你好” 从个人词库删除。
;;      如果用户选择了一个词条，则运行金手指命令可以将选择的词条加入个人词库。
;;`pyim-create-Ncchar-word-at-point’ 这是一组命令，从光标前提取 N 个汉字字符组成字 符串，并将其加入个人词库。
;;`pyim-outcome-trigger’ 以默认设置为例：在 “我爱吃红烧肉” 后输入 “5v”，可以将 “爱吃红烧肉” 这个词条保存到用户个人词库。
;;`pyim-create-word-from-selection’, 选择一个词条，运行这个命令后，就可以将这个 词条添加到个人词库。
;;`pyim-delete-word’ 从个人词库中删除当前高亮选择的词条。
;;
;;魔术转换变量
;;用户可以将待选词 “特殊处理” 后再 “上屏”，比如 “简体转繁体” 或者 “输入中文，上屏 英文” 之类的。
;; (defun my-converter (string)
  ;; (if (equal string "二呆")
      ;; "“一个超级帅的小伙子”"
    ;; string))
;; (setq pyim-outcome-magic-converter #'my-converter) ;未见

;; 可供参考的 shit 山
;;(require 'liberime nil t)
;;(require 'pyim-cregexp-utils)
;;
;;(require 'popup) ;使用 popup 包，（emacs overlay 机制）
;;
;;使用 Posframe 来绘制选词框
;;(require 'posframe) ;未安装
;;(setq pyim-page-tooltip 'posframe)
;;
;;按照优先顺序自动选择一个可用的 tooltip
;;(setq pyim-page-tooltip '(posframe popup minibuffer))
;;总是 minibuffer ?
;;

;;(setq pyim-page-style 'one-line)

;;;;
;;; 切换全角标点与半角标点
;;第一种方法：使用命令 `pyim-punctuation-toggle’，全局切换。
;;这个命令主要用来设置变量： `pyim-punctuation-translate-p’,
;;用户也可以手动设置这个变量， 比如：
;;(setq-default pyim-punctuation-translate-p '(yes))    ;使用全角标点。
;;(setq-default pyim-punctuation-translate-p '(no))     ;使用半角标点。
;;(setq-default pyim-punctuation-translate-p '(auto))   ;中文使用全角标点，英文使用半角标点。
;;第二种方法：使用命令 `pyim-punctuation-translate-at-point’ 只切换光标处标点的样式。
;;第三种方法：设置变量 `pyim-outcome-trigger’ ，输入变量设定的字符会切换光标处标点的样式。
;;
;;; 中英文切换绑定
;; pyim-toggle-input-ascii
;；(global-set-key (kbd "") 'pyim-toggle-input-ascii)
;; 另解
;; 通过`emacs -nw`在命令行中启动emacs，
;; 就可以接管wsl里的emacs窗口渲染
;; 并且使用windows里的输入法，‘来放到stdin,stdout中’？实现中英文输入
;;
;;
;;这个功能有一些限制，
;;搜索字符串中只能出现 “a-z” 和 “’”，
;;如果有其他字符（比 如 regexp 操作符），
;;则自动关闭拼音搜索功能。
;;开启这个功能后，一些 isearch 扩展有可能失效，
;;如果遇到这种问题， 只能禁用这个 Minor-mode，然后联系 pyim 的维护者，看有没有法子实现兼容。
;;用户激活这个 mode 后，可以使用下面的方式 强制关闭 isearch 搜索框中文输入（即使 在 pyim 激活的时候）。
;;(setq-default pyim-english-input-switch-functions
;;              '(pyim-probe-isearch-mode))

;;创建一个搜索中文的 regexp
;;(pyim-cregexp-build ".*nihao.*")
;;让 vertico, selectrum 等补全框架，通过 orderless 支持拼音搜索候选项功能。
(with-eval-after-load 'vertico
(defun my-orderless-regexp (orig-func component)
  (let ((result (funcall orig-func component)))
 (pyim-cregexp-build result)))
(advice-add 'orderless-regexp :around #'my-orderless-regexp))
;;(with-eval-after-load "liberime"
 ;; (liberime-try-select-schema "luna_pinyin_simp")
 ;; (setq pyim-default-scheme 'rime-quanpin))
 ;;
;;(defun completion--regex-pinyin (str)
;;  (orderless-regexp (pinyinlib-build-regexp-string str)))
;;(add-to-list 'orderless-matching-styles 'completion--regex-pinyin)

;;; pyim 配置参考
;;; https://gist.github.com/merrickluo/553f39c131d0eb717cd59f72c9d4b60d
;;(use-package! liberime-config)
;;  :init
;;  (setq pyim-title "R")
;;  :config
;;   (use-package pyim-basedict
;;     :config
;;     (pyim-basedict-enable))
;;  (setq pyim-dcache-auto-update nil)
  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;;  使用 M-p 快捷键，强制将光标前的拼音字符串转换为中文。

;;; Valign & ftable
(after! valign
  (add-hook 'org-mode-hook #'valign-mode)
  (add-hook 'markdown-mode-hook #'valign-mode))


;;; org mode
;;ui

;;在alltheicons支持下不太好看
(setq org-ellipsis "⤵")                 ;使用 ⤵ 来指待隐藏内容

;; tag
;;(setq org-tag-alist '(("前端" . ?w) ("专业" . ?s) ("考研" . ?k) ("日记" . ?d)))
(setq org-tag-alist-for-agenda '(("@work" . ?w) ("@home" . ?h) ("@game" . ?g)))


;;; latex
;;(setq reftex-default-bibliography "~/bib/file.bib")
;;; 中文断行问题
;; 下面一段是 zwz 的解决方案, 作者声明只适应 org-mode 8.0 以及以上版本
;; (defun clear-single-linebreak-in-cjk-string (string)
;;   "clear single line-break between cjk characters that is usually soft line-breaks"
;;   (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
;;          (start (string-match regexp string)))
;;     (while start
;;       (setq string (replace-match "\\1\\2" nil nil string)
;;             start (string-match regexp string start))))
;;   string)

;; (defun ox-html-clear-single-linebreak-for-cjk (string backend info)
;;   (when (org-export-derived-backend-p backend 'html)
;;     (clear-single-linebreak-in-cjk-string string)))

;; (add-to-list 'org-export-filter-final-output-functions       ;发现这里出现错误，原因不明
;;              'ox-html-clear-single-linebreak-for-cjk)

;;; 设置默认浏览器为 eaf 的
;; 参考设置
(use-package! eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :init
  :custom
  (eaf-browser-translate-language "zh-CN")
  (eaf-browser-continue-where-left-off t) 
  (eaf-browser-enable-adblocker t)
  (eaf-proxy-type "socks5")
  (eaf-browser-aria2-proxy-host "192.168.0.104")
  (eaf-browser-aria2-proxy-port "7890")
  (browse-url-browser-function 'eaf-open-browser) ;; Make EAF Browser my default browser
  :config
  (defalias 'browse-web #'eaf-open-browser)

  (require 'eaf-image-viewer)
  (require 'eaf-video-player)
  (require 'eaf-vue-demo)
  (require 'eaf-pdf-viewer)
  (require 'eaf-netease-cloud-music)
  (require 'eaf-jupyter)
  (require 'eaf-org-previewer)
  (require 'eaf-system-monitor)
  (require 'eaf-rss-reader)
  (require 'eaf-browser)
  (require 'eaf-org)
  (require 'eaf-mail)
  (when (display-graphic-p)
    (require 'eaf-all-the-icons))

  (require 'eaf-evil)
  (setq eaf-evil-leader-key "SPC")
  ;; 以下是过时的代码，不需要也能正常使用
  ;; (define-key key-translation-map (kbd "SPC")
  ;;   (lambda (prompt)
  ;;     (if (derived-mode-p 'eaf-mode)
  ;;         (pcase eaf--buffer-app-name
  ;;           ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
  ;;                          (kbd "SPC")
  ;;                        (kbd eaf-evil-leader-key)))
  ;;           ("pdf-viewer" (kbd eaf-evil-leader-key))
  ;;           ("image-viewer" (kbd eaf-evil-leader-key))
  ;;           (_  (kbd "SPC")))
  ;;       (kbd "SPC"))))
  )

;; (use-package eaf-browser
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework/app/browser")
;;; eaf 推荐的简单设置
;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-translate-language "zh-CN")
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (eaf-browser-aria2-proxy-host "192.168.0.104")
;;   (eaf-browser-aria2-proxy-port "7890")
;;   (browse-url-browser-function 'eaf-open-browser)
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser))
;;   ;;(eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   ;;(eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   ;;(eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   ;;(eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki


;;; roam2
;;(setq roam2-directory (concat (getenv "HOME") "/roam2/"))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/OneDrive/roam2"))
  ;; (setq org-roam-capture-templates
  ;;       '(("d" "default" plain "%?"
  ;;          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
  ;;                    "#+title: ${title}\n#+date: %U\n#+lastmod: \n\n")
  ;;          :immediate-finish t
  ;;          :unnarrowed t)
  ;;         ("b" "book notes" plain
  ;;          (file "~/orgnotes/Templates/booknoteTemplate.org")
  ;;          :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: BOOK")
  ;;          :unnarrowed t)
  ;;          time-stamp-start "#\\+lastmod: [\t]*"))
  :bind (("C-c n f" . org-roam-node-find)
         ;;("C-c n r" . org-roam-node-random) ;打开随机笔记
         ("C-c n g" . org-roam-graph)
         ("C-c n c" . org-roam-capture) ;一般用这种方式写reference
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
         (:map org-mode-map             ;前面几个在所有 mode-map 中，后面的只在 orgmode 下生效
               (("C-c n i" . org-roam-node-insert)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add) ;增加别名，利于检索
                ("C-c n r" . org-roam-ref-add)
                ("C-c n o" . org-id-get-create)
                ;;查看有哪些 nodes 被链接在 roam2node 中
                ("C-c n l" . org-roam-buffer-toggle))))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
;;; 集成 roam2 和 agenda
;; A collection of functions for note taking based on org and org-roam
(use-package! vulpea
  :hook ((org-roam-db-autosync-mode . vulpea-db-autosync-enable)))

(after! org-roam
  ;;* dynamic agenda https://github.com/brianmcgillion/doomd/blob/master/config.org
  ;; https://d12frosted.io/posts/2021-01-16-task-management-with-roam-vol5.html
  ;; The 'roam-agenda' tag is used to tell vulpea that there is a todo item in this file
  (add-to-list 'org-tags-exclude-from-inheritance "roam-agenda")

  (require 'vulpea)

  (defun vulpea-buffer-p ()
    "Return non-nil if the currently visited buffer is a note."
    (and buffer-file-name
         (string-prefix-p
          (expand-file-name (file-name-as-directory org-roam-directory))
          (file-name-directory buffer-file-name))))

  (defun vulpea-project-p ()
    "Return non-nil if current buffer has any todo entry.

TODO entries marked as done are ignored, meaning the this
function returns nil if current buffer contains only completed
tasks."
    (seq-find                                 ; (3)
     (lambda (type)
       (eq type 'todo))
     (org-element-map                         ; (2)
         (org-element-parse-buffer 'headline) ; (1)
         'headline
       (lambda (h)
         (org-element-property :todo-type h)))))

  (defun vulpea-project-update-tag (&optional arg)
    "Update PROJECT tag in the current buffer."
    (interactive "P")
    (when (and (not (active-minibuffer-window))
               (vulpea-buffer-p))
      (save-excursion
        (goto-char (point-min))
        (let* ((tags (vulpea-buffer-tags-get))
               (original-tags tags))
          (if (vulpea-project-p)
              (setq tags (cons "roam-agenda" tags))
            (setq tags (remove "roam-agenda" tags)))

          ;; cleanup duplicates
          (setq tags (seq-uniq tags))

          ;; update tags if changed
          (when (or (seq-difference tags original-tags)
                    (seq-difference original-tags tags))
            (apply #'vulpea-buffer-tags-set tags))))))

  ;; https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/
  (defun my/org-roam-filter-by-tag (tag-name)
    (lambda (node)
      (member tag-name (org-roam-node-tags node))))

  (defun my/org-roam-list-notes-by-tag (tag-name)
    (mapcar #'org-roam-node-file
            (seq-filter
             (my/org-roam-filter-by-tag tag-name)
             (org-roam-node-list))))

  (defun dynamic-agenda-files-advice (orig-val)
    (let ((roam-agenda-files (delete-dups (my/org-roam-list-notes-by-tag "roam-agenda"))))
      (cl-union orig-val roam-agenda-files :test #'equal)))

  (add-hook 'before-save-hook #'vulpea-project-update-tag)
  (advice-add 'org-agenda-files :filter-return #'dynamic-agenda-files-advice)
  )

;;; org-roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;;; 增加 org capture 的 hugo 模版
(with-eval-after-load 'org-capture
      (defun org-hugo-new-subtree-post-capture-template ()
	"Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
	(let*   ((date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
                 (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
                 (fname (org-hugo-slug title)))
	  (mapconcat #'identity
                     `(,(concat "* TODO " title)
		     ":PROPERTIES:"
		     ,(concat ":EXPORT_FILE_NAME: " fname)
                     ,(concat ":EXPORT_DATE: " date)
		     ":END:"
		     "%?\n")          ;Place the cursor here finally
		     "\n")))
;;每一个 org subtree 是一篇博客
      (add-to-list 'org-capture-templates
		   '("h"                ;`org-capture' binding + h
		     "Hugo post"
		     entry
		     ;; It is assumed that below file is present in `org-directory'
		     ;; and that it has a "Blog Ideas" heading. It can even be a
		     ;; symlink pointing to the actual location of all-posts.org!
		     (file+headline "/home/echozcz/blog/all-blog.org" "Blog Ideas")
		     (function org-hugo-new-subtree-post-capture-template))))

;;; wsl2 传输图片
;; (defun shell-command-on-str (cmd &optional str)
;;   "Insert result of calling CMD with STR as input.
;; STR is current-kill if unspecified."
;;   (interactive (list (read-shell-command "Shell command on region: ")))
;;   (setq str (or str
;;                 (current-kill 0)))
;;   (insert (with-temp-buffer
;;             (insert str)
;;             (shell-command-on-region (point-min) (point-max) cmd nil 'replace)
;;             (buffer-string))))

;; (defun wsl-update-clip (&rest _args)
;;   (interactive)
;;   (shell-command-on-str "clip.exe"))

;; (advice-add 'kill-new :after #'wsl-update-clip)

;; ;;;gnome-sceenshot
;; (use-package mathpix.el
;;   :custom ((mathpix-app-id "app-id")
;;            (mathpix-app-key "app-key"))
;;   :bind
;;   ("C-x c" . mathpix-screenshot))

;;; pdf-tools

;; doom help about how to config
;;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Zhang ChaoZhong"
      user-mail-address "echozcz@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;

;; 检查一个字体是否已经安装
(member "SimHei" (font-family-list))
;; (font-family-list)  ;显示可以使用的字体

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
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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
;
