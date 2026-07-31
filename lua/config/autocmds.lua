vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local buf = args.buf

    -- Ignore non-file buffers
    if vim.bo[buf].buftype ~= "" then
      return
    end

    local root = require("lazyvim.util").root.get({ buf = buf })
    if root and vim.fn.getcwd() ~= root then
      vim.cmd.cd(root)
    end
  end,
})
