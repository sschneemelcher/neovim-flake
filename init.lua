lua << EOF
vim.opt.guicursor = ""
vim.opt.errorbells = false

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.swapfile = false;
vim.opt.undofile = true
vim.opt.undodir = os.getenv( "HOME" ) .. '/.vim/undodir'
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.cmdheight = 1

vim.opt.updatetime = 50

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.vim_markdown_folding_disabled=1

vim.cmd('colorscheme catppuccin')

-- set language for all .tex files to latex
vim.g.tex_flavor = "latex"

vim.api.nvim_create_autocmd('BufWinEnter', {
	desc = 'Enable spell checking in latex files',
	pattern = '*.tex',
    command = 'setlocal spell spelllang=en_us'
})


-- open netwr
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>so %<cr>")

-- Emacs Style file navigation
local dir = vim.api.nvim_buf_get_name(0)
-- gets the /foo.bar part of the path
local fname = dir:match("/[%a%d]*%.[%a%d]*$")
if fname then
    dir = dir:gsub(fname, "")
end
vim.keymap.set("n", "<C-x><C-f>", string.format(":e %s", dir))

-- Emacs Style buffer navigation
vim.keymap.set("n", "<C-x>b", ":b")

vim.keymap.set("n", "<C-x>g", "<cmd>Neogit<cr>")

vim.keymap.set("n", "<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })
end)

vim.keymap.set("n", "<leader>ff", function()
    require('telescope.builtin').find_files()
end)

vim.keymap.set("n", "<leader>d", function()
    require('telescope.builtin').diagnostics()
end)

vim.keymap.set("n", "<leader>fb", function()
    require('telescope.builtin').buffers()
end)

vim.keymap.set("n", "<leader>gh", function()
    require('telescope.builtin').help_tags()
end)

vim.keymap.set("n", "<C-p>", function()
    require('telescope.builtin').git_files()
end)

vim.keymap.set("n", "<leader>fg", function()
    require('telescope.builtin').live_grep()
end)

vim.keymap.set("v", "<leader>ds", function()
    require('dap-python').debug_selection()
end)


vim.keymap.set("n", "<leader>dd", function()
    require('dap').continue()
end)

vim.keymap.set("n", "<leader>bp", function()
    require('dap').toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>s", function()
    require('dap').step_into()
end)

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'catppuccin',
        disabled_filetypes = {},
        always_divide_middle = false,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'diagnostics',
                colored = true,
                update_in_insert = true,
                always_visible = false
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
EOF
