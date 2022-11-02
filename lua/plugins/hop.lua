
status, hop = pcall(require, 'hop')

if not status then
  return
end

hop.setup({
    keys ='etovxqpdygfblzhckisuran'
})

local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
vim.keymap.set('', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})

vim.keymap.set('', 'w', function() hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, {remap=true})
vim.keymap.set('', 'b', function() hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, {remap=true})

vim.keymap.set('', 'j', function() hop.hint_lines({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, {remap=true})
vim.keymap.set('', 'k', function() hop.hint_lines({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, {remap=true})

--- HopChar1 hint_char1
--- HopChar2 hint_char2
--- HopLines hint_lines
--- HopPattern hint_patterns
--- HopWord hint_words
