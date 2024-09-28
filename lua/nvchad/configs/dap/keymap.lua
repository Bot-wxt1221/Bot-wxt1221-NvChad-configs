local M = {}

local whichkey = require "which-key"
-- local legendary = require "legendary"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
  local keymap = {
    { "<leader>lR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor", mode = "n" },
    { "<leader>lE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input", mode = "n" },
    { "<leader>lC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint", mode = "n" },
    { "<leader>lU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI", mode = "n" },
    { "<leader>lb", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", mode = "n" },
    { "<leader>lc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", mode = "n" },
    { "<leader>ld", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", mode = "n" },
    { "<leader>le", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate", mode = "n" },
    { "<leader>lg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", mode = "n" },
    { "<leader>lh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables", mode = "n" },
    { "<leader>lS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes", mode = "n" },
    { "<leader>li", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", mode = "n" },
    { "<leader>lo", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", mode = "n" },
    { "<leader>lp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause", mode = "n" },
    { "<leader>lq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit", mode = "n" },
    { "<leader>lr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl", mode = "n" },
    { "<leader>ls", "<cmd>lua require'dap'.continue()<cr>", desc = "Start", mode = "n" },
    { "<leader>lt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", mode = "n" },
    { "<leader>lx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate", mode = "n" },
    { "<leader>lu", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", mode = "n" },
    { "<leader>le", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate", mode = "v" },
  }
  whichkey.add(keymap)
  --- require("legendary.integrations.which-key").bind_whichkey(keymap, opts, false)
  vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F5>",
                ":w<CR>:split<CR>:te g++ '%' -g -DONLINE_JUDGE -std=c++14 -Wall -O0 -o '%:r' -fsanitize=address -fsanitize=undefined<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                ":w<CR>:split<CR>:te g++ '%' -g -std=c++14 -Wall -O0 -o '%:r' -fsanitize=address -fsanitize=undefined<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F6>",
            ":w<CR>:split<CR>:te '%:r'<CR>i",
        {silent=true,noremap=true}
      )
        end,
    })
end

return M
