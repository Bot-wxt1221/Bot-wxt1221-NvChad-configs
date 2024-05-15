local M = {}

local function configure()
end

local function configure_exts()
end

local function configure_debuggers()
end

function M.setup()
	configure() -- Configuration
	configure_exts() -- Extensions
	configure_debuggers() -- Debugger
  require("nvchad.configs.dap.keymap").setup()
  require("nvchad.configs.dap.ui").setup()
  require("nvchad.configs.dap.icon").setup()
  require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp", "rust" } })
  local dap = require('dap')
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/nix/store/1fzkgz9x4zfg3p35qn6izlr6yv9mj2kr-vscode-extension-ms-vscode-cpptools-1.20.2/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7',
  }
end

configure_debuggers()

return M
