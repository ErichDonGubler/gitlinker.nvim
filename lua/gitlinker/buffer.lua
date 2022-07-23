local M = {}

local api = vim.api
local path = require("plenary.path")

function M.get_relative_path(cwd)
  local cur_buf_rel = path:new(api.nvim_buf_get_name(0))
  local cur_buf_abs = path:new(cur_buf_rel:absolute())
  local cwd_abs = path:new(cwd):absolute()
  return cur_buf_abs:make_relative(cwd_abs)
end

function M.get_curr_line()
  return api.nvim_win_get_cursor(0)[1]
end

function M.get_range(mode, add_current_line_on_normal_mode)
  local lstart
  local lend
  if mode == "v" then
    lstart = vim.fn.getpos("v")[2]
    lend = vim.fn.getcurpos()[2]
  elseif add_current_line_on_normal_mode == true then
    lstart = M.get_curr_line()
  end

  return { lstart = lstart, lend = lend }
end

return M
