-- my rebinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dd", vim.cmd.Ex) -- explorer
vim.keymap.set({"n","v"}, "<C-s>", vim.cmd.w) -- save
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', {noremap = true}) -- save and escape
vim.keymap.set("i", "<S-a><S-a>", "<C-o>0") -- home
vim.api.nvim_set_keymap('n', '<C-x>', ':wq<CR>', {noremap = false}) -- save and exit
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>:wq<CR>', {noremap = false}) --save and exit
vim.api.nvim_set_keymap('v', '<C-x>', ':wq<CR>', {noremap = false}) --save and exit
vim.keymap.set("i", "<S-f><S-f>", "<C-o>$") -- end
vim.keymap.set("n", "<S-a><S-a>", "<Home>") -- home
vim.keymap.set("n", "<S-f><S-f>", "<End>") -- end
vim.keymap.set("n", "<C-z>", "u") -- undo
vim.keymap.set("i", "<C-z>", "<C-o>u") -- undo
vim.api.nvim_set_keymap('v', '<c-z>', 'u', {noremap = true}) -- undo
vim.keymap.set("i", "<C-y>", "<C-o><C-r><End>") -- redo
vim.keymap.set({"n","v"}, "h", "<F17>") -- remap h to nothing for now
vim.keymap.set({"n","v"}, "j", "h") -- remap left
vim.keymap.set({"n","v"}, "l", "j") -- remap down
vim.keymap.set({"n","v"}, ";", "l") -- remap right
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>:w<CR>", {noremap = true}) -- esc
vim.api.nvim_set_keymap('n', "<C-a>", 'ggVG', {noremap = false})
vim.api.nvim_set_keymap('v', "<C-a>", "<Esc>", {noremap = false})
vim.keymap.set("i", "<C-a>", "<C-o>g<C-o>g<C-o>V<C-o>G", {noremap = false}) -- select all insert
vim.keymap.set("i", "<PageUp>", "") --
vim.keymap.set("i", "<PageDown>", "") --
vim.keymap.set({"n","i"}, "<Up>", "") --
vim.keymap.set({"n","i"}, "<Down>", "") --
vim.keymap.set({"n","i"}, "<Left>", "") -- 
vim.keymap.set({"n","i"}, "<Right>", "") --
vim.keymap.set("i", "<A-j>", "<C-o><Left>") --
vim.keymap.set("i", "<A-k>", "<C-o><Up>") --
vim.keymap.set("i", "<A-l>", "<C-o><Down>") --
vim.keymap.set("i", "<A-;>", "<C-o><Right>") --
vim.keymap.set("n", "<S-e><S-e>", "<C-^>") -- go to previous file
vim.api.nvim_set_keymap('n', '<A-l>', ':set paste<CR>m`o<Esc>j``:set nopaste<CR>', {noremap = true, silent = true}) -- insert new line normal mode
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true}) -- selected up in visual
vim.api.nvim_set_keymap('v', 'L', ':m \'>+1<CR>gv=gv', {noremap = true}) -- selected down in visual
vim.api.nvim_set_keymap('n', '<Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('i', '<Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('v', '<Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('n', '<S-Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('i', '<S-Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('v', '<S-Tab>', '', {noremap = false})
vim.api.nvim_set_keymap('n', '<C-b>', 'qw', {noremap = false})
vim.api.nvim_set_keymap('n', '<C-f>', '@w', {noremap = false})
vim.api.nvim_set_keymap('i', '<F4>f', '{', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>r', '[', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>v', '(', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>j', '}', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>u', ']', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>n', ')', {noremap = true})

-- hooklinesinker
vim.api.nvim_set_keymap('n', 'fd', [[<cmd>lua require'hooklinesinker'.save_position()<CR>]], {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'u', [[<cmd>lua require'hooklinesinker'.return_position()<CR>]], {noremap = false, silent = true})

-- markdown preview
vim.api.nvim_set_keymap('n', '<F4>f', ':MarkdownPreview<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F4>j', ':MarkdownPreviewStop<CR>', {noremap = true, silent = true})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- lsp-zero
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    -- 'csharp_ls',
    'gopls',
    'lua_ls',
    'eslint',
    'tsserver',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-l>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-f>'] = cmp.mapping.confirm({ select = true }),
    ["<C-y>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
    --[[  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)--]]
end)

lsp.setup()
-- lsp.setup({
--     cmd = { "eslint-language-server", "--stdio", "eslint" },
--     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
--     settings = {
--         eslint = {
--             run = "onSave",
--             settings = {
--                 react = { version = "detect" },
--             },
--             rulesCustomizations = {
--                 ["strict"] = {'error', 'global'},
--                 ["semi"] = { "warn", "always" },
--             },
--         },
--     },
-- })

local comment = require('Comment')

comment.setup({
        ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = nil,
        ---Block-comment toggle keymap
        block = nil,
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = nil,
        ---Add comment on the line below
        below = nil,
        ---Add comment at the end of line
        eol = nil,
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})

vim.diagnostic.config({
    virtual_text = true
})

-- codeium
vim.api.nvim_set_keymap('i', '<Tab>', '<Esc>:call codeium#Accept()<CR>a', {noremap = false, silent = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', '<Esc>:call codeium#Clear()<CR>a', {noremap = false, silent = true})

-- cursor
-- vim.cmd("set guicursor=n:block")
vim.cmd("set guicursor=n:ver25-blinkon500")
vim.cmd("set guicursor=v:ver25-blinkon0")
vim.cmd("set guicursor=i:ver25-blinkon100")

-- vim.api.nvim_set_keymap('v', '<C-d>', 'y:call system("wl-copy", getreg(\"\"))<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-d>', 'y:call system("wl-copy " . shellescape(getreg(\'\')))<CR>', {noremap = true, silent = true})

-- vim.api.nvim_set_option('colorcolumn', '90')
vim.api.nvim_exec([[
  autocmd BufRead,BufNewFile * setlocal colorcolumn=90
]], false)

require('luasnip/loaders/from_vscode').load()
-- require('luasnip/loaders/from_vscode').load({ paths = { "./friendly-snippets" } })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file)
vim.keymap.set("n", "<C-y>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>jj", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>kk", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>ll", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>;;", function() ui.nav_file(4) end)

-- require('github-theme').override.palettes({
--     github_dark_dimmed = {
--         comment = '#36D97D',
--     },
-- })

