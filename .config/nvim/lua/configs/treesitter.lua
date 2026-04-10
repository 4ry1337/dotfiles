local parsers = {
	"rust",
	"c",
	"cpp",
	"sql",
	"javascript",
	"lua",
	"bash",
	"markdown",
	"markdown_inline",
	"html",
	"css",
	"yaml",
	"json",
	"toml",
}

local function try_attach(buf, lang)
	if not vim.treesitter.language.add(lang) then
		return
	end
	vim.treesitter.start(buf, lang)
	vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

return function()
	require("nvim-treesitter").install(parsers)

	local available = require("nvim-treesitter").get_available()
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local buf, ft = args.buf, args.match
			local lang = vim.treesitter.language.get_lang(ft)
			if not lang then
				return
			end

			local installed = require("nvim-treesitter").get_installed("parsers")
			if vim.tbl_contains(installed, lang) then
				try_attach(buf, lang)
			elseif vim.tbl_contains(available, lang) then
				require("nvim-treesitter").install(lang):await(function()
					try_attach(buf, lang)
				end)
			else
				try_attach(buf, lang)
			end
		end,
	})
end
