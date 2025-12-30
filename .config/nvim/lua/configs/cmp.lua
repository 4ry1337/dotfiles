--- @module 'blink.cmp'
--- @type blink.cmp.Config
return {
	keymap = {
		-- 'default' (recommended) for mappings similar to built-in completions
		--   <c-y> to accept ([y]es) the completion.
		--    This will auto-import if your LSP supports it.
		--    This will expand snippets if the LSP sent a snippet.
		-- 'super-tab' for tab to accept
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- For an understanding of why the 'default' preset is recommended,
		-- you will need to read `:help ins-completion`
		--
		-- No, but seriously. Please read `:help ins-completion`, it is really good!
		--
		-- All presets have the following mappings:
		-- <tab>/<s-tab>: move to right/left of your snippet expansion
		-- <c-space>: Open menu or open docs if already open
		-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
		-- <c-e>: Hide menu
		-- <c-k>: Toggle signature help
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		preset = "default",
		-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
		--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
	},
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	completion = {
		-- By default, you may press `<c-space>` to show the documentation.
		-- Optionally, set `auto_show = true` to show the documentation after a delay.
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
	},
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	snippets = { preset = "luasnip" },
	-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
	-- which automatically downloads a prebuilt binary when enabled.
	--
	-- By default, we use the Lua implementation instead, but you may enable
	-- the rust implementation via `'prefer_rust_with_warning'`
	--
	-- See :h blink-cmp-config-fuzzy for more information
	fuzzy = { implementation = "lua" },
	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },
}
-- local cmp = require("cmp")
-- local luasnip = require("luasnip")
--
-- return {
-- 	cmp = {
-- 		snippet = {
-- 			expand = function(args)
-- 				luasnip.lsp_expand(args.body)
-- 			end,
-- 		},
-- 		completion = { completeopt = "menu,menuone,noinsert" },
-- 		mapping = cmp.mapping.preset.insert({
-- 			-- Select the [n]ext item
-- 			-- ["<C-n>"] = cmp.mapping.select_next_item(),
-- 			--['<Tab>'] = cmp.mapping.select_next_item(),
--
-- 			-- Select the [p]revious item
-- 			-- ["<C-p>"] = cmp.mapping.select_prev_item(),
-- 			--['<S-Tab>'] = cmp.mapping.select_prev_item(),
--
-- 			-- Scroll the documentation window [b]ack / [f]orward
-- 			["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 			["<C-f>"] = cmp.mapping.scroll_docs(4),
--
-- 			["<C-Space>"] = cmp.mapping.complete({}),
-- 			["<C-e>"] = cmp.mapping.close(),
--
-- 			-- Accept ([y]es) the completion.
-- 			--  This will auto-import if your LSP supports it.
-- 			--  This will expand snippets if the LSP sent a snippet.
-- 			-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 			["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
-- 			["<Tab>"] = cmp.mapping(function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_next_item()
-- 				elseif luasnip.expand_or_locally_jumpable() then
-- 					luasnip.expand_or_jump()
-- 				else
-- 					fallback()
-- 				end
-- 			end, { "i", "s" }),
-- 			["<S-Tab>"] = cmp.mapping(function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_prev_item()
-- 				elseif luasnip.locally_jumpable(-1) then
-- 					luasnip.jump(-1)
-- 				else
-- 					fallback()
-- 				end
-- 			end, { "i", "s" }),
-- 		}),
-- 		sources = {
-- 			{
-- 				name = "lazydev",
-- 				-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
-- 				group_index = 0,
-- 			},
-- 			{ name = "nvim_lsp" },
-- 			{ name = "luasnip" },
-- 			{ name = "buffer" },
-- 			{ name = "nvim_lua" },
-- 			{ name = "path" },
-- 		},
-- 	},
-- 	luasnip = {},
-- }
