return function(opts)
  local obj = {
    maps = {},
    opts = opts or {}
  }

  setmetatable(obj.maps, {
    __index = function(self, k)
      self[k] = {}
      return self[k]
    end,
  })

  function obj:set(mods, key, func, opts)
    self.maps[mods][key] = { func, opts }
  end

  function obj:register()
    vim.schedule(function()
      for mode, maps in pairs(self.maps) do
        for keymap, options in pairs(maps) do
          local cmd, opts = options[1], options[2]
          local keymap_opts = self.opts
          if type(opts) == "string" then
            keymap_opts["desc"] = opts
          end
          if type(opts) == "table" then
            keymap_opts = vim.tbl_deep_extend("force", keymap_opts, opts)
          end
          vim.keymap.set(mode, keymap, cmd, keymap_opts)
        end
      end
    end)
  end

  return obj
end
