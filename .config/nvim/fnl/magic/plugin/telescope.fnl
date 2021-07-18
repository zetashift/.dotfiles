(module magic.plugin.telescope
  {autoload {core aniseed.core
             telescope telescope}})


(telescope.setup {
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
  (builtin.file_browser (ivy { :cwd (vim.fn.expand "%:p:h" ) :layout_config ivy_layout })))

:live_grep
(fn []
  (builtin.live_grep))

;; Browse and search files in the CWD
:browse_files
(fn []
  (builtin.file_browser (ivy { :depth 50 :layout_config ivy_layout })))

;; Browse and search files in the currents file directory
:recent_files
  (fn []
     (telescope.extensions.frecency.frecency (dropdown {
                                                        :persistent_filter false
                                                        :ignore_patterns   [ "*.git/*" "*.metals/*" "*.bloop/*" ]
                                                        :border            true
                                                        :previewer         false
                                                        :default_text      ":CWD:" })))

;; List the projects with telescope-project
:list_projects
(fn []
  (telescope.extensions.project.project (dropdown { :previewer false })))
}
