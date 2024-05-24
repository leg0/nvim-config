return {
	"terrortylor/nvim-comment",
  event = "BufEnter",
	init = function()
		print("initializing comment")
	end,
	config = function()
		require "nvim_comment".setup{
			marker_padding = true,
			create_mappings = true,
			line_mapping = "<C-/>",
		}
		local opts = function(desc)
		  return { desc = desc, noremap = true, silent = true }
		end
		local keymap = vim.api.nvim_set_keymap

		-- Toggle comments (Ctrl+/)
		keymap("i", "<C-_>", "<ESC>l:CommentToggle<cr>i", opts 'Toggle comment')
		keymap("o", "<C-_>", "<ESC>l:CommentToggle<cr>:startr<cr>", opts 'Toggle comment')
		keymap("v", "<C-_>", ":CommentToggle<cr>gv", opts 'Toggle comment')
		keymap("n", "<C-_>", ":CommentToggle<cr>",   opts 'Toggle comment')
		keymap("v", "<C-/>", ":CommentToggle<cr>gv", opts 'Toggle comment')
		keymap("n", "<C-/>", ":CommentToggle<cr>",   opts 'Toggle comment')
		keymap("v", "<A-/>", ":CommentToggle<cr>gv", opts 'Toggle comment')
		keymap("n", "<A-/>", ":CommentToggle<cr>",   opts 'Toggle comment')
	end,
}
