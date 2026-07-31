vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local out = vim.fn.expand("%<")
  vim.cmd("botright 15split | terminal gcc " .. file .. " -o " .. out .. " && " .. out)
end)
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
vim.env.PATH = vim.env.PATH .. "C:/Users/Admin/Scoop/shims/lazygit.exe"
-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Copy entire line
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Paste over selection without overwriting clipboard
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

-- Escape terminal mode
vim.keymap.set("t", "jj", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
