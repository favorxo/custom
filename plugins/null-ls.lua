local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- js/ts
  b.formatting.prettierd,

  -- golang
  b.formatting.goimports,

  -- python
  b.formatting.black,

  -- lua
  b.formatting.stylua,

  -- rust
  b.formatting.rustfmt,

  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
  sources = sources,
}
