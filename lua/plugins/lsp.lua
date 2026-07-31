return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
        },

        clangd = {
          cmd = {
            "clangd",
            "--query-driver=C:/msys64/mingw64/bin/*",
          },
        },
      },
    },
  },
}
