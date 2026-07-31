return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      theme = "dragon",
      transparent = false,
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
