(module magic.plugin.telescope
  {autoload {telescope telescope}})


(telescope.setup {
  :defaults {
    :file_ignore_patterns ["node_modules"]
  }
  :extensions {
    :fzf {
      :override_generic_sorter true
      :override_file_sorter    true
      :case_mode               :smart_case
    }
  }
})

;; Setup several extensions for Telescope
((. (require :telescope) :load_extension) :frecency)
((. (require :telescope) :load_extension) :project)
((. (require :telescope) :load_extension) :fzf)


(local builtin  (require :telescope.builtin))
(local ivy      (. (require :telescope.themes) :get_ivy))
(local ivy_layout { :height 15 } )
(local dropdown (. (require :telescope.themes) :get_dropdown))

{
;; Search dotfiles
:search_dotfiles
(fn []
  (builtin.find_files { :prompt_title :Config :cwd (vim.fn.stdpath :config) }))

;; Search notes
:search_notes
(fn []
  (builtin.file_browser { :prompt_title :Notes :cwd "~/dev/vaults" :depth 50  }))

;; Browse and find files in current files working directory
:find_file
(fn []
  (builtin.find_files (ivy { :cwd (vim.fn.expand "%:p:h" ) :layout_config ivy_layout})))

:live_grep
(fn []
  (builtin.live_grep))

;; Browse and search files in the CWD
:browse_files
(fn []
  (builtin.file_browser (ivy { :depth 15 :file_ignore_patterns ["node_modules"] :layout_config ivy_layout })))

;; Browse and search files in the currents file directory
:recent_files
  (fn []
     (telescope.extensions.frecency.frecency (dropdown {
                                                        :ignore_patterns   [ "*.git/*" "*.metals/*" "*.bloop/*" ]
                                                        :border            true
                                                        :previewer         false
                                                        :default_text      ":CWD:" })))

;; List the projects with telescope-project
:list_projects
(fn []
  (telescope.extensions.project.project (dropdown { :previewer false })))

;; Fuzzy find in current buffer
:buffer_find
(fn []
  (builtin.current_buffer_fuzzy_find (dropdown {:previewer false })))
}
