-- plugins/impatient

function install(use)
  use("lewis6991/impatient.nvim");
end

function config()
  local status_ok, impatient = pcall(require, "impatient")
  if not status_ok then
    return
  end

  impatient.enable_profile()
end
