return {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'go', 'gomod' },
      callback = function()
        vim.bo.indentexpr = ''
        vim.bo.autoindent = true
        vim.bo.smartindent = false
      end,
    })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()',
}
