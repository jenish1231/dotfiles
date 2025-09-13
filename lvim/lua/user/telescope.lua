lvim.builtin.telescope.defaults.find_files = ({
  find_command = { "fd", "-t=f", "-a" },
  path_display = { "absolute" },
  wrap_results = true
})

lvim.builtin.telescope.theme = "center"

lvim.builtin.telescope.on_config_done = function(telescope)
  telescope.setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }
  telescope.load_extension("ui-select")
end
