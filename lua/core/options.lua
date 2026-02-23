-- vim:fileencoding=utf-8:foldmethod=marker
local opt = vim.opt

opt.hidden = true -- Required to keep multiple buffers open multiple buffers
opt.iskeyword = opt.iskeyword + "-" -- treat dash separated words as a word text object"
opt.mouse = "a" -- Enable mouse
-- opt.clipboard = "unnamedplus"           -- Copy paste between vim and everything else

-- completions {{{
opt.updatetime = 50 -- Faster completion
opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
opt.completeopt = "menu,menuone,noselect"
opt.shortmess = opt.shortmess + "c" -- Don't pass messages to |ins-completion-menu|.
--}}}

-- files {{{
opt.undofile = true
opt.writebackup = false -- This is recommended by coc
opt.backup = false -- This is recommended by coc
-- opt.autochdir = true                    -- Your working directory will always be the same as your working directory
--}}}

-- indentation {{{
opt.softtabstop = 4 -- Insert 4 spaces for a tab
opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
opt.expandtab = true
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.smartindent = true -- Makes indenting smart
opt.autoindent = true -- Good auto indent
--}}}

-- UI {{{
opt.list = true
opt.listchars = "tab:>-,trail:~,extends:>,precedes:<,space:·"
opt.cursorline = true -- Enable highlighting of the current line
-- opt.background = "dark" -- tell vim what the background color looks like
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- Always show tabs
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.wrap = true -- Display long lines as just one line
opt.linebreak = true -- Don't break words when wrapping
opt.ruler = true -- Show the cursor position all the time
opt.signcolumn = "yes"
opt.laststatus = 2 -- Always display the status line
--}}}

-- windows {{{
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
opt.inccommand = "split"
--}}}

-- folds {{{
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--}}}

-- searching {{{
opt.hlsearch = false
--}}}

-- cmdline {{{
opt.showcmd = false
opt.wildmenu = true
opt.wildmode = "longest:list,full"
opt.termguicolors = true
opt.cmdheight = 2 -- More space for displaying messages
--}}}
