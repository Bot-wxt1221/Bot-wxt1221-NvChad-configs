local M={}
function M.setup()
  local keymap = {
    t = {
      name = "CPH",
      a = { "<cmd>CompetiTest add_testcase<cr>", "Add Testcase" },
      e = { "<cmd>CompetiTest edit_testcase<cr>", "Edit Testcase" },
      d = { "<cmd>CompetiTest delete_testcase<cr>", "Delete Testcase" },
      r = { "<cmd>CompetiTest run<cr>", "Run Testcase" },
      p = { "<cmd>CompetiTest receive problem<cr>", "Receive Problem" },
      c = { "<cmd>CompetiTest receive contest<cr>", "Receive Contest" },
   },
  }
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
  require "which-key" .register(keymap, opts)

end
return M
