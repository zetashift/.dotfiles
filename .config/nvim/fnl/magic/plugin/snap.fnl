
(module plugin.snap {autoload {snap snap}})

;; Small actions system
(local actions {})

;; Adds an action
(defn action [name action] (tset actions name action))

(let [layout (snap.get :layout)
      fzf (snap.get :consumer.fzf)
      limit (snap.get :consumer.limit)
      producer-jumplist (snap.get :producer.vim.jumplist)
      producer-vimgrep (snap.get :producer.ripgrep.vimgrep)
      producer-help (snap.get :producer.vim.help)
      select-help (snap.get :select.help)
      select-jumplist (snap.get :select.jumplist)
      select-vimgrep (snap.get :select.vimgrep)
      preview-help (snap.get :preview.help)
      preview-vimgrep (snap.get :preview.vimgrep)
      preview-jumplist (snap.get :preview.jumplist)]

  (fn create [config] (snap.create config {:layout layout.bottom :reverse true}))

  (local reverse true)
  (local args [:--hidden :--iglob :!.git/*])

  ;; Add my defaults
  (local file (snap.config.file:with { :preview true :consumer :fzf :layout layout.bottom :suffix :» }))
  (local vimgrep (snap.config.vimgrep:with { :preview true :layout layout.bottom :limit 50000 :suffix :» }))

  (snap.maps [
    ;; Search files
    [:<Leader><Leader> (file {:prompt "Find files" :producer :ripgrep.file : args}) {:command :find-files}]
    ;; Search git files
    [:<Leader>fg (file {:prompt "Search Git Files" :producer :git.file}) {:command :git-files}]
    ;; Search buffers
    [:<Leader>bb (file {:prompt "Search buffers" :producer :vim.buffer}) {:command :buffers}]
    ;; Grep
    [:<Leader>ff (vimgrep {:prompt "Find in files"}) {:command :grep}]
    ;; Grep
    [:<Leader>fw (vimgrep {:prompt "Grep with current word" :filter_with :cword}) {:command :currentwordgrep}]
    ;; Grep current word
    [:<Leader>fm (vimgrep {:prompt "Grep with selection" :filter_with :selection}) {:modes :v}]
    ;; Oldfiles
    [:<Leader>fr (file {:prompt "Recent files" :producer :vim.oldfile}) {:command :oldfiles}]])

  (snap.register.map
    [:n]
    [:<Leader>fh]
    (create (fn [] {:prompt :Help>
                    :producer (fzf producer-help)
                    :select select-help.select
                    :views [preview-help]})))

  (snap.register.map
    [:n]
    [:<Leader>fj]
    (create (fn [] {:prompt :Jumplist>
                    :producer (fzf producer-jumplist)
                    :select select-jumplist.select
                    :views [preview-jumplist]})))

  ;; Action system
  (snap.register.map
    [:n]
    [:<Leader>fa]
    (create (fn [] {:prompt :Action>
                    :producer (fzf (fn [] (vim.tbl_keys actions)))
                    :select (fn [action] (vim.schedule (. actions (tostring action))))}))))
