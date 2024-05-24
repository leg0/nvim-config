vim.api.nvim_create_autocmd(
	"BufEnter",
	{
		pattern = "*.lua",
		command = ":setlocal shiftwidth=2 tabstop=2"
	}
)
vim.api.nvim_create_autocmd(
	"BufEnter",
	{
		pattern = { "*.h", "*.c", "*.cpp", "*.hpp" },
		command = ":setlocal commentstring=//\\ %s",
	}
)

