return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- If true, filtered items are dimmed out instead of hidden
        hide_dotfiles = false, -- Set this to false
        -- If you also want to show files ignored by .gitignore, set:
        -- hide_gitignored = false,
      },
    },
  },
}
