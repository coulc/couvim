return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      }
    })


    require('mason-lspconfig').setup({
      automatic_installation = true, 
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      }
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'ts_ls',
        'lua_ls',
        'json-lsp',
        'css-lsp',
        'html-lsp',
      },
    })
  end,
}
