------------------------
------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
  "php"
}

------------------------
-- Plugins
------------------------
lvim.plugins = {
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
}

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
  { command = "phpcsfixer", filetypes = { "php" } },
}

lvim.format_on_save = {
  enabled = true,
  pattern = {"*.html", "*.js", "*.go", "*.php" },
}

------------------------
-- Linting
------------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "phpcs", filetypes = { "php" } },
}

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

------------------------
-- LSP
------------------------
local lsp_manager = require "lvim.lsp.manager"

------------------------
-- LSP PHP
------------------------
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
lsp_manager.setup("intelephense")
local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js" },
}
dap.configurations.php = {
  {
    name = "Listen for Xdebug",
		type = "php",
		request = "launch",
		port = 9003,
  },
  {
    name = "Debug currently open script",
		type = "php",
		request = "launch",
		port = 9003,
    cwd = "${fileDirname}",
    program = "${file}",
    runtimeExecutable = "php",
  },
}

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end
    map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
    map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
    map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
    map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
    map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
    map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
    map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
    map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
    map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}

lvim.transparent_window = true

------------------------
-- 
------------------------
lvim.builtin.alpha.dashboard.section.header.val = {}
local function footer()
  return "Darkiosys"
end

lvim.builtin.alpha.dashboard.section.footer.val = footer()
