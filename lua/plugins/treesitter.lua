return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = { enable = true },
	    autotag = { enable = true },
	    ensure_installed = {
		"lua",
		"python",
		"typescript",
		"php",
		"java",
		"kotlin",
		"tsx",
		"cpp",
		"query",
	    },
	    auto_install = false,
	})
    end 
}
