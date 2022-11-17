
status, leap = pcall(require, 'leap')

if not status then
  return
end

leap.add_default_mappings()


local function get_line_starts(winid)
  local wininfo =  vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line('.')

  -- Get targets.
  local targets = {}
  local lnum = wininfo.topline
  while lnum <= wininfo.botline do
    local fold_end = vim.fn.foldclosedend(lnum)
    -- Skip folded ranges.
    if fold_end ~= -1 then
      lnum = fold_end + 1
    else
      if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
      lnum = lnum + 1
    end
  end
  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
  local function screen_rows_from_cur(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
    return math.abs(cur_screen_row - t_screen_row)
  end
  table.sort(targets, function (t1, t2)
    return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
  end)

  if #targets >= 1 then
    return targets
  end
end

-- Usage:
local function leap_to_line()
  winid = vim.api.nvim_get_current_win()
  leap.leap {
    target_windows = { winid },
    targets = get_line_starts(winid),
  }
end

require('neoscroll').setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = nil,       -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

-- vim.keymap.set('n', 'f', "<cmd>lua leap_to_line()<cr>", {})

-- hop.setup({
--     keys ='etovxqpdygfblzhckisuran'
-- })

-- local directions = require('hop.hint').HintDirection

-- vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
-- vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
-- vim.keymap.set('', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
-- vim.keymap.set('', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})

-- vim.keymap.set('', 'w', function() hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, {remap=true})
-- vim.keymap.set('', 'b', function() hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, {remap=true})

-- vim.keymap.set('', 'j', function() hop.hint_lines({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, {remap=true})
-- vim.keymap.set('', 'k', function() hop.hint_lines({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, {remap=true})

-- --- HopChar1 hint_char1
-- --- HopChar2 hint_char2
-- --- HopLines hint_lines
-- --- HopPattern hint_patterns
-- --- HopWord hint_words
