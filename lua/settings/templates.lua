-- settings/templates

function install(use)
  use("tibabit/vim-templates");
end

function config()
  vim.g.tmpl_search_paths = { vim.fn.stdpath('config') .. "/templates" };

  if vim.g.project_copyright then
    vim.g.tmpl_copyright = vim.g.project_copyright;
  end

  if vim.g.project_license then
    vim.g.tmpl_license = vim.g.project_license;
  end

  if vim.g.user_author then
    vim.g.tmpl_author_name = vim.g.user_author;
  end
end
