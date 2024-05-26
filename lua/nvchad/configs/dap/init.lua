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
    command = '/nix/store/y26703q0r20c48wx52rgzmygs30n63r3-vscode-extension-ms-vscode-cpptools-1.20.5/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7',
  }
end

configure_debuggers()

return M
