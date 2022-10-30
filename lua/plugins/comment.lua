
-- require('kommentary.config').use_extended_mappings()

-- vim.g.kommentary_create_default_mappings = false

-- vim.api.nvim_set_keymap("n", "<leader>hh", "<Plug>kommentary_line_default", {})
-- vim.api.nvim_set_keymap("n", "<leader>h", "<Plug>kommentary_motion_default", {})
-- vim.api.nvim_set_keymap("x", "<leader>h", "<Plug>kommentary_visual_default", {})

-- vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
-- vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
-- vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
-- vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
-- vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
-- vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})







status, Comment = pcall(require, "Comment")

if not status then
    print("Comment plugin not installed")
  return
end

Comment.setup({
--   opleader = {
--     line = '<leader>c',
--     block = '<leader>b',
--   },
})



-- Comment.setup({
--   -- Linters prefer comment and line to have a space in between markers
--   padding = " ",
--   -- Should comment out empty or whitespace only lines
--   comment_empty = false,
--   -- Should key mappings be created
--   create_mappings = true,
--   -- Normal mode mapping left hand side
--   line_mapping = "gcc",
--   -- Visual/Operator mapping left hand side
--   operator_mapping = "gc",
--   -- Hook function to call before commenting takes place
--   hook = function()
--     -- If you want to disable auto commenting on some filetypes set it here
--     -- For example: don't comment out HTML files, but do comment out PHP files
--     if vim.bo.filetype == "html" then
--       return true
--     end
--   end,
-- })