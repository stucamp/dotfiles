
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)


-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*Y]])
