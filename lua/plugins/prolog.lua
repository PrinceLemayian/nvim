return {
  -- Treesitter parser for Prolog
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "prolog" })
    end,
  },

  -- Send lines/selections to a running swipl session
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 15,
      direction = "horizontal",
    },
    keys = {
      { "<leader>tp", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>tl", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send line to terminal" },
      { "<leader>ts", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v", desc = "Send selection to terminal" },
    },
  },
}
