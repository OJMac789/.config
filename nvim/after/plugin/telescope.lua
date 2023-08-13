local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

pcall(require('telescope').load_extension, 'yank_history')

require('telescope').setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "absolute" },
	}
}
--[[ vim.keymap.set('n', '<C-f>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }), ]]
--[[ vim.keymap.set('n', '<C-h>', require('telescope.builtin').oldfiles, { desc = '[S]earch [H]istory' }), ]]
--[[ vim.keymap.set('n', '<C-g>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' }), ]]
--[[ vim.keymap.set('n', '<C-s>', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch [W]ord' }), ]]
--[[ vim.keymap.set('n', '<Space>d', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' }), ]]
--[[ vim.keymap.set('n', '<A-s>', require('telescope.builtin').spell_suggest, { desc = '[S]uggest [S]pelling' }), ]]
--[[ } ]]
