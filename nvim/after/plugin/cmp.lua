local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local function has_words_before()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = vim.api.nvim_win_get_cursor(0)
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local lsp_symbols = {
    Text = "   (Text) ",
    Method = "   (Method)",
    Function = "   (Function)",
    Constructor = "   (Constructor)",
    Field = " ﴲ  (Field)",
    Variable = "[] (Variable)",
    Class = "   (Class)",
    Interface = " ﰮ  (Interface)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Enum = " 練 (Enum)",
    Keyword = "   (Keyword)",
    Snippet = "   (Snippet)",
    Color = "   (Color)",
    File = "   (File)",
    Reference = "   (Reference)",
    Folder = "   (Folder)",
    EnumMember = "   (EnumMember)",
    Constant = " ﲀ  (Constant)",
    Struct = " ﳤ  (Struct)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

cmp.setup {
    confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
    sources = {
        { name = "buffer", priority = 9 },
        { name = "nvim_lsp", priority = 8 },
        { name = "codeium", priority = 10 },
        { name = "nvim_lua", priority = 5 },
        { name = "path", priority = 7 },
        { name = "luasnip", priority = 6 },
    },
    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            if entry.source.name == "codeium" then
                item.kind = "   (Codeium)"
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    item.kind = "   (" .. entry.completion_item.data.detail .. ")"
                end
            end
            item.menu = ({
                buffer = "[Buffer]",
                codeium = "[A.I.]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[NLUA]",
                path = "[Path]",
                luasnip = "[Snippet]",
            })[entry.source.name]
            return item
        end,
    },
    snippet = {
        expand = function(args)
            local luasnip = require "luasnip"
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = '║',
      -- other options
    },
  },
mapping = cmp.mapping.preset.insert({
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior, count = 1 }),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior, count = 1 }),
      ['<A-up>'] = cmp.mapping.scroll_docs(-2),
      ['<A-down>'] = cmp.mapping.scroll_docs(2),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-right>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
}
