vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- vim.api.nvim_set_keymap('n', '<C-g>n', ':ChatGPT<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-g>e', ':ChatGPTRun explain_code<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-g>a', ':ChatGPTEdihWithInstruction<CR>', { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap('n', '<C-g>a', ':GpAppend<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-g>v', ':GpChatToggle<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>t', ':GpChatToggle tabnew<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>n', ':GpChatNew<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>i', ':GpImage<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>c', ':GpContext<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>]', ':GpNextAgent<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-g>[', ':GpNextAgent<CR>', { noremap = true, silent = true })
 -- 
-- vim.api.nvim_set_keymap('v', '<C-g>r', ":<C-u>'<,'>GpRewrite<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('v', '<C-g>y', ":<C-u>'<,'>GpChatPaste<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    'n', '<C-l>', ':vertical resize +5<CR>',
    { noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap(
    -- 'n', '<C-h>', ':vertical resize -10<CR>',
    -- { noremap = true, silent = true }
-- )

vim.api.nvim_set_keymap(
    'n', '<C-m>', ':resize +2<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n', '<C-h>', ':resize -2<CR>',
    { noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap(
    -- 'n', '<C-h>', ':resize -5<CR>',
    -- { noremap = true, silent = true }
-- )
--
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
