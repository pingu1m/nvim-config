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
  require('leap').leap {
    target_windows = { winid },
    targets = get_line_starts(winid),
  }
end



have a decent nvim config already, by which I mean LSP, Tree Sitter, and completion

install 'milisims/nvim-luaref' to get lua standard library docs in vim :help

install 'folke/lua-dev.nvim' to get better nvim platform completion and LSP inline docs (hover, etc)

bind a key for vim.lsp.buf.hover() (I use K)

'rafcamlet/nvim-luapad' can be helpful to spin up a quick lua repl. there are alternatives to this which are maybe better, like :help luafile


https://www.youtube.com/watch?v=n4Lp4cV8YR0


https://alpha2phi.medium.com/writing-neovim-plugins-a-beginner-guide-part-i-e169d5fd1a58


https://www.alanwsmith.com/posts/how-to-make-a-hello-world-neovim-plugin-with-lua--20eo42jkmlie


https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua


https://neovim.io/doc/user/lua.html