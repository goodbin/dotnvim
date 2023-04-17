function install(use)
  use({"lewis6991/impatient.nvim", config = "config"})
end

function config()
  local status_ok, impatient = pcall(require, "impatient")
  if status_ok then
    impatient.enable_profile()
  end
end
