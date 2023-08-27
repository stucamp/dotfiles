-- This remap is used to go back to the file/folder selection
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

-- Move selection throught the code (even autoindenting inside functions)
vim.keymap.set("v", "J", ":m '>+1<CR>gv+gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv+gv")

--Makes your cursor stay in the same place although you're appending lines
vim.keymap.set("n", "J", "mzJ`z")

-- Allows C-d and C-u (middle upwards or downwards jumping) with cursor (and
-- therefore the whole line) kept in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Avoid using quicksearch
vim.keymap.set("n", "Q", "<nop>")
