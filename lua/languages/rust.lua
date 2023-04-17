enabled = true

function install(use)
  use({ "rust-lang/rust.vim", config = "rust_config" })
end

function rust_config()
  vim.g.rust_recommended_style = true
  vim.g.rustfmt_fail_silently = false
  vim.g.syntastic_rust_checkers = {}
  vim.g.rust_fold = true
  vim.g.rustfmt_command = "rustup run nightly -- rustfmt"
end

function lsp_config(nvim_lsp, caps, on_attach, flags)
  local cargo_config = vim.g.project_cargo or {}
  cargo_config["loadOutDirsFromCheck"] = true
  cargo_config["allFeatures"] = true
  cargo_config["autoreload"] = true
  cargo_config["buildScripts"] = {
    enable = true,
  }

  nvim_lsp.rust_analyzer.setup({
    capabilities = caps,
    on_attach = on_attach,
    flags = flags,
    settings = {
      ["rust-analyzer"] = {
        cargo = cargo_config,
        rustfmt = {
          extraArgs = { "+nightly" },
        },
        completion = {
          addCallArgumentSnippets = false,
          postfix = {
            enable = false,
          },
          autoimport = {
            enable = false,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })
end
