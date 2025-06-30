local ts_repeatable_move = require("nvim-treesitter-textobjects.repeatable_move")

local M = {}

--- Repeat the last last demicolon jump forward
function M.forward()
  local keys = ts_repeatable_move.repeat_last_move({ forward = true, repeated = true })
  if type(keys) == "string" then
    vim.cmd([[normal! ]] .. vim.v.count1 .. keys)
    return true
  else
    return keys
  end
end

--- Repeat the last last demicolon jump backward
function M.backward()
  local keys = ts_repeatable_move.repeat_last_move({ forward = false, repeated = true })
  if type(keys) == "string" then
    vim.cmd([[normal! ]] .. vim.v.count1 .. keys)
    return true
  else
    return keys
  end
end

--- Like `forward`, but repeats based on the direction of the original jump.
function M.next()
  return ts_repeatable_move.repeat_last_move({ repeated = true })
end

--- Like `backward`, but repeats based on the direction of the original jump.
function M.prev()
  local opts = {
    forward = not ts_repeatable_move.last_move.opts.forward,
    repeated = true,
  }
  return ts_repeatable_move.last_move and ts_repeatable_move.repeat_last_move(opts)
end

return M
