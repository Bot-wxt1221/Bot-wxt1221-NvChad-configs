
local M={}
function M.setup()
  local keymap= 
  {
    { "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Testcase", mode = "n" },
    { "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit Testcase", mode = "n" },
    { "<leader>td", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete Testcase", mode = "n" },
    { "<leader>tr", "<cmd>CompetiTest run<cr>", desc = "Run Testcase", mode = "n" },
    { "<leader>tp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive Problem", mode = "n" },
    { "<leader>tc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive Contest", mode = "n" },
  }
  require "which-key".add(keymap)
end
vim.cmd("nnoremap d \"_d")
vim.cmd("xnoremap d \"_d")
return M

