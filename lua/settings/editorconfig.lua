-- settings/editorconfig

function install(use)
  use("editorconfig/editorconfig-vim");
end

function config()
  vim.g.EditorConfig_disable_rules = {'trim_trailing_whitespace'}
end
