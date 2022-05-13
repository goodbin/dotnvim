-- plugins/comment

function install(use)
  use("numToStr/Comment.nvim");
end

function config()
  local status_ok, comment = pcall(require, "Comment");
  if not status_ok then
    return;
  end

  local status_ok, _ = pcall(require, "ts_context_commentstring");
  if not status_ok then
    return;
  end

  comment.setup({
    padding = true,
    sticky = true,
    pre_hoot = function(ctx)
      local U = require("Comment.utils");
      local TU = require("ts_context_commentstring.utils");
      local TI = require("ts_context_commentstring.internal");

      local location = nil;
      if ctx.ctype == U.ctype.block then
        location = TU.get_cursor_location();
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = TU.get_visual_start_location();
      end

      return TI.calculate_commentstring {
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        location = location,
      }
    end
  });
end
