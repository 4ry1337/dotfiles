local cmp = require("cmp")
local luasnip = require("luasnip")

return {
	cmp = {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },
		mapping = cmp.mapping.preset.insert({
			-- Select the [n]ext item
			["<C-n>"] = cmp.mapping.select_next_item(),
			--['<Tab>'] = cmp.mapping.select_next_item(),

			-- Select the [p]revious item
			["<C-p>"] = cmp.mapping.select_prev_item(),
			--['<S-Tab>'] = cmp.mapping.select_prev_item(),

			-- Scroll the documentation window [b]ack / [f]orward
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),

			["<C-Space>"] = cmp.mapping.complete({}),
			["<C-e>"] = cmp.mapping.close(),

			-- Accept ([y]es) the completion.
			--  This will auto-import if your LSP supports it.
			--  This will expand snippets if the LSP sent a snippet.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = {
			{
				name = "lazydev",
				-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
				group_index = 0,
			},
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "nvim_lua" },
			{ name = "path" },
		},
	},
	luasnip = {},
}
