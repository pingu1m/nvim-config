-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	log_level = vim.log.levels.INFO,
	-- list of servers for mason to install
	github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
        -- download_url_template = "https://github.com/%s/releases/download/2022-10-24/%s/%s",
    },
	ensure_installed = {
		"bashls",
		"jsonls",
		"pyright",
		"rust_analyzer",
		"tsserver",
		"sqlls",
		"yamlls",
		-- "marksman",
		-- "taplo",
		-- "terraformls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed

})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
	-- 	"prettier", -- ts/js formatter
	-- 	"stylua", -- lua formatter
	-- 	"eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
