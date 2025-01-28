return {
	clangd = {
		fallbackFlags = { "-std=c++20" },
	},
	html = {},
	cssls = {},
	sqlls = {},
	dockerls = {},
	tailwindcss = {},
	eslint = {},
	ts_ls = {},
	rust_analyzer = {
		check = {
			command = "clippy",
		},
	},
	jdtls = {},
}
