local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- g.mapleader = " "

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH


require("nvchad.configs.dap.init").setup()
require('competitest').setup{
 template_file ="/home/wxt/OI/Temp.cpp",
 compile_command ={
    cpp={exec="g++",args={"$(FNAME)","-Wall","-std=c++14","-DONLINE_JUDGE","-fsanitize=undefined,address","-o",".cph/$(FNOEXT).cphbin"}}
  },
  run_command={
    cpp={exec="./.cph/$(FNOEXT).cphbin"}
  },
  testcases_directory="./.cph",
  evaluate_template_modifiers=true,
  multiple_testing=2,
  maximum_time=20000,
} -- to use default configuration
require("nvchad.configs.cph").setup()

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "markdown", "markdown_inline", "lua", "typescript", "html" ,'c','cpp'},
  sync_install = true,
 highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
})


local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table

-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
