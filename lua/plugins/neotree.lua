local mapping = require("core/mapping")
local icons = require("core/icons")

function install(use)
  use({
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v2.x",
    config = "neo_tree_config",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
  })
end

function neo_tree_config()
  local status_ok, tree = pcall(require, "neo-tree")
  if not status_ok then
    return
  end

  tree.setup({
    close_if_last_window = false,
    enable_diagnostics = false,
    popup_border_style = "rounded",
    sources = { "filesystem", "buffers", "git_status" },
    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = icons["FolderClosed"] .. " File" },
        { source = "buffers", display_name = icons["DefaultFile"] .. " Bufs" },
        { source = "git_status", display_name = icons["Git"] .. " Git" },
      },
    },
    default_component_configs = {
      indent = { 
        padding = 1, 
        indent_size = 1,
      },
      name = {
        use_git_status_colors = false,
      },
      git_status = {
        symbols = {
          added = "✚",
          modified  = "",
          renamed   = "",
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
        highlight = "NeoTreeMessage",
        align = "right",
      }
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        {
          "container",
          content = {
            { "name", zindex = 50, align = "left", },
            { "clipboard", zindex = 40 },
            { "git_status", zindex = 10, align = "left", hide_when_expanded = true },
            { "diagnostics", errors_only = true, zindex = 5, align = "left", hide_when_expanded = true },
          },
        },
      },
      file = {
        { "indent" },
        { "icon" },
        {
          "container",
          content = {
            {
              "name",
              zindex = 50,
              align = "left",
            },
            { "clipboard", zindex = 40 },
            { "bufnr", zindex = 30 },
            { "git_status", zindex = 20, align = "left" },
            { "diagnostics",  zindex = 5, align = "left" },
            { "modified", zindex = 10, align = "right" },
          },
        },
      },
    },
    window = {
      mappings = {
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
        ["h"] = "parent_or_close",
        ["l"] = "child_or_open",
        ["O"] = "system_open",
        ["S"] = "",
      },
    },
    filesystem = {
      -- follow_current_file = true,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOs: open file in default application in the background.
        -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
        vim.api.nvim_command("silent !open -g " .. path)
        -- Linux: open file in default application
        vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
      end,
    }
  })

  local maps = mapping({ silent = true, noremap = true })
  maps:set("n", "\\", "<cmd>Neotree focus<cr>", { desc = "Toggle Explorer" })
  maps:register()

  local hl = vim.api.nvim_set_hl;
  hl(0, "NeoTreeGitUntracked", { link = "DiagnosticOk" });
  hl(0, "NeoTreeGitUnstaged", { link = "DiagnosticInfo" });
end

