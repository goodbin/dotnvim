local M = {}

function M.error(msg)
  vim.api.nvim_err_writeln(msg)
end

if jit ~= nil then
  M.is_windows = jit.os == "Windows"
else
  M.is_windows = package.config:sub(1, 1) == "\\"
end

if M.is_windows and vim.o.shellslash then
  M.use_shellslash = true
else
  M.use_shallslash = false
end

function M.get_separator()
  if M.is_windows and not M.use_shellslash then
    return "\\"
  end
  return "/"
end

function M.join(...)
  local separator = M.get_separator()
  return table.concat({ ... }, separator)
end

return M
