--- settings/languages/dlang/init.lua
enabled = false
function install(use)
  -- print("install Dlang")
end

function config() end

function lsp_config(nvim_lsp, caps, on_attach)
  -- local nvim_lsp = require("lspconfig");
  -- local configs = require("lspconfig/configs");
  -- local util = require("lspconfig/util");

  -- if not nvim_lsp.serve_lsp then
  --     configs.serve_lsp = {
  --         default_config = {
  --             cmd = {"serve-d"},
  --             filetypes = {"d"},
  --             root_dir = function(fname)
  --                 return util.find_git_ancestor(fname) or
  --                     util.root_pattern("dub.json")(fname) or
  --                     util.root_pattern("dub.sdl")(fname)
  --             end,
  --         },
  --         settings = {},
  --     }
  -- end
  -- Bug serve-d
  -- nvim_lsp.serve_lsp.setup({});
end
