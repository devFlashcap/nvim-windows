vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', function()
	print("NO! Use k")
end)
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', function()
	print("NO! Use j")
end)
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', function()
	print("NO! Use h")
end)
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', function()
	print("NO! Use l")
end)
