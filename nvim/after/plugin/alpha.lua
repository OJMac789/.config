local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local headers = require('magicvim.headers').ascii_art
local dashboard = require("alpha.themes.dashboard")
local function button(sc, txt, keybind, keybind_opts)
            local b = dashboard.button(sc, txt, keybind, keybind_opts)
            b.opts.hl = "Include"
            b.opts.hl_shortcut = "String"
            return b
        end
math.randomseed(os.time())
dashboard.section.header.val = headers[math.random(1, #headers)]

dashboard.section.buttons.val = {
	button("f", "  Find file", ":Telescope find_files <CR>"),
	button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	button("t", "  Find text", ":Telescope live_grep <CR>"),
	button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	button("q", "  Quit MagicVim", ":qa<CR>"),
}

local pluginCount = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
local plugins = 'MagicVim Loaded ' .. pluginCount .. ' Plugins! '
dashboard.section.footer.val = {
'', '', '', plugins
}

dashboard.section.footer.opts.hl = "Comment"
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
dashboard.config.layout[3].val = 5

dashboard.opts.opts.noautocmd = true
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function()
	  vim.go.laststatus = 0
          vim.opt.showtabline = 0
	  vim.opt.cmdheight = 0
  end,
  })
autocmd('BufUnload', {
  buffer = 0,
  desc = 'enable status, tabline and cmdline after alpha',
  callback = function()
          vim.go.laststatus = 2
          vim.opt.showtabline = 2
	  vim.opt.cmdheight = 1
  end,
  })
-- Disable the cursor while alpha dashbaord is open
      autocmd('User', {
        pattern = 'AlphaReady',
        desc = 'hide cursor for alpha',
        callback = function()
          local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
          hl.blend = 100
          vim.api.nvim_set_hl(0, 'Cursor', hl)
          vim.opt.guicursor:append('a:Cursor/lCursor')
        end,
      })
      autocmd('BufUnload', {
        buffer = 0,
        desc = 'show cursor after alpha',
        callback = function()
          local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
          hl.blend = 0
          vim.api.nvim_set_hl(0, 'Cursor', hl)
          vim.opt.guicursor:remove('a:Cursor/lCursor')
        end,
      })

alpha.setup(dashboard.opts)
