local builtin = require 'telescope.builtin'
vim.cmd [[command! -bar -bang -nargs=? WQ w<bang> | q<bang>]]
vim.cmd [[command! -bar -bang -nargs=? Wq w<bang> | q<bang>]]
vim.cmd [[command! -bar -bang -nargs=? Wa wa<bang>]]
vim.cmd [[command! -bar -bang -nargs=? W w<bang>]]

---@param c string
local function leader(c)
  return '<leader>' .. c
end

---@param c string
local function ctrl(c)
  return '<C-' .. c .. '>'
end

local M = {
  ---@type wk.Spec
  { leader '-', '<cmd>Oil<CR>', name = 'Oil', mode = 'n', silent = true, noremap = true },

  ---@type wk.Spec
  { '<C-\\>', '<C-\\><C-n>', name = 'Close Terminal', mode = 't', silent = true, noremap = true },

  ---@type wk.Spec
  {
    leader 'o',
    name = 'Harpoon',
    group = 'o',
    mode = 'n',
    { leader 'oh', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", name = "Toggle Harpoon's Menu" },
    { leader 'oa', "<cmd>lua require('harpoon.mark').add_file()<CR>", name = 'Add File to Harpoon' },
    { leader 'oq', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", name = 'Previous Harpoon Window' },
    { leader 'oe', "<cmd>lua require('harpoon.ui').nav_next()<CR>", name = 'Next Harpoon Window' },
  },

  ---@type wk.Spec
  {
    leader '/',
    name = 'Toggle Comment',
    mode = 'n',
    function()
      require('Comment.api').toggle.linewise.current()
    end,
  },

  ---@type wk.Spec
  {
    leader 'u',
    group = 'UndoTree',
    mode = 'n',

    ---@type wk.Spec
    { leader 'ut', '<cmd>UndotreeToggle<CR>', name = 'Toggle UndoTree' },

    ---@type wk.Spec
    { leader 'uf', '<cmd>UndotreeFocus<CR>', name = 'Toggle Focus' },
  },

  ---@type wk.Spec
  {
    ctrl 'b',
    '<C-b>zz',
    name = 'Scrol Down',
    mode = 'n',
    noremap = true,
  },

  ---@type wk.Spec
  {
    ctrl 'u',
    '<C-u>zz',
    mode = 'n',
    name = 'Scroll Up',
    noremap = true,
  },

  ---@type wk.Spec
  {
    ctrl 'd',
    '<C-d>zz',
    name = 'Scroll Down',
    mode = 'n',
    noremap = true,
  },

  ---@type wk.Spec
  {
    'n',
    'nzzzv',
    name = 'Search',
    mode = 'n',
    desc = 'Next',
    noremap = true,
  },

  ---@type wk.Spec
  {
    'N',
    'Nzzzv',
    name = 'Search',
    mode = 'n',
    desc = 'Previous',
    noremap = true,
  },

  ---@type wk.Spec
  {
    leader 'ie',
    'oif err != nil {<CR>}<Esc>Oreturn err<Esc>',
    name = 'Golang Error Handling',
    mode = 'n',
    desc = 'Golang Error Handling',
  },

  ---@type wk.Spec
  {
    ctrl 'c',
    ':%y+<CR>',
    name = 'Copy',
    mode = 'n',
    desc = 'Copy to Clipboard',
  },

  ---@type wk.Spec
  {
    'J',
    ":m '>+1<CR>gv=gv",
    name = 'Move line down',
    mode = 'v',
    desc = 'Move line down',
    noremap = true,
    silent = true,
  },

  ---@type wk.Spec
  {
    'K',
    ":m '<-2<CR>gv=gv",
    name = 'Move line up',
    mode = 'v',
    desc = 'Move line up',
    noremap = true,
    silent = true,
  },

  ---@type wk.Spec
  {
    leader 'g',
    group = 'Git',
    mode = 'n',
    { leader 'gs', '<cmd>LazyGit<CR>', name = 'Open LazyGit' },
  },

  ---@type wk.Spec
  {
    leader 'f',
    mode = 'n',
    group = 'Telescope',
    { leader 'ff', '<cmd>Telescope find_files<CR>', name = 'Find File' },
    { leader 'fa', '<cmd>Telescope find_files hidden=true<CR>', name = 'Find All Files' },
    { leader 'fw', '<cmd>Telescope live_grep<CR>', name = 'Live Grep' },
    { leader 'fb', '<cmd>Telescope buffers<CR>', name = 'Buffers' },
    { leader 'fh', '<cmd>Telescope oldfiles<CR>', name = 'History' },
    { leader 'fk', '<cmd>Telescope keymaps<CR>', name = 'Keymaps' },
    { leader 'fd', '<cmd>Telescope diagnostics<CR>', name = 'Diagnostics' },
    { leader 'f.', '<cmd>Telescope oldfiles<CR>', name = "Find Recent Files ('.' for repeat)" },
    {
      leader 'fg',
      group = 'Git',
      { leader 'fgb', '<cmd>Telescope git_branches<cr>', name = 'git branches' },
      { leader 'fgf', '<cmd>Telescope git_files<CR>', name = 'Git Files' },
      { leader 'fgc', '<cmd>Telescope git_commits<CR>', name = 'Git Commits' },
      { leader 'fgs', '<cmd>Telescope git_status<CR>', name = 'Git Status' },
    },
  },

  {
    leader 'c',
    group = 'LSP',
    mode = 'n',
    {
      leader 'ca',
      function()
        vim.lsp.buf.code_action()
      end,
      name = 'Code Action',
    },

    { '<leader>ct', '<cmd>Trouble<CR>', name = 'Trouble' },

    {
      leader 'cf',
      function()
        vim.lsp.buf.format { async = false }
      end,
      name = 'Format',
    },

    {
      leader 'cd',
      function()
        vim.diagnostic.open_float()
      end,
      name = 'Diagnostic',
    },

    {
      leader 'cr',
      function()
        vim.lsp.buf.rename()
      end,
      name = 'Rename',
    },
    {
      leader 'cp',
      function()
        vim.diagnostic.goto_prev()
      end,
      name = 'Go to previous error',
    },
    {
      leader 'cn',
      function()
        vim.diagnostic.goto_next()
      end,
      name = 'Go to next error',
    },
  },

  {
    'g',
    group = 'g',
    mode = 'n',
    { 'gd', vim.lsp.buf.definition, name = 'Definition' },
    { 'gD', builtin.lsp_declaration, name = 'Declaration' },
    { 'gi', builtin.lsp_implementation, name = 'Implementation' },
    { 'gt', builtin.lsp_type_definitions, name = 'Type Definition' },
    { 'gr', builtin.lsp_references, name = 'References' },
    { 'gO', builtin.lsp_document_symbols, name = 'Open Document Symbols' },
    { 'gW', builtin.lsp_dynamic_workspace_symbols, name = 'Open Workspace Symbols' },
  },

  ---@type wk.Spec
  {
    '<Esc>',
    '<cmd>nohlsearch<CR>',
    name = 'Highlight',
    mode = 'n',
  },

  ---@type wk.Spec
  {
    leader 'x',
    name = 'Close Buffer',
    mode = 'n',
    function()
      vim.cmd 'bd'
    end,
  },

  ---@type wk.Spec
  {
    'p',
    'p:let @+=@0<CR>:let @"=@0<CR>',
    name = 'Paste Without Copy',
    mode = 'x',
    desc = "Don't copy over visual selection after paste",
    silent = true,
  },

  {

    ctrl 'w',
    '<C-w>h',
    name = 'Switch Buffer To Left',
    mode = 'n',
    desc = 'Switch to the buffer to the left',
  },

  {
    ctrl 'l',
    '<C-w>l',
    name = 'Switch Buffer to Right',
    mode = 'n',
    desc = 'Switch to the buffer to the right',
  },

  {
    ctrl 'k',
    '<C-w>k',
    name = 'Switch Buffer to Top',
    mode = 'n',
    desc = 'Switch to the buffer to the top',
  },

  {
    ctrl 'j',
    '<C-w>j',
    name = 'Switch Buffer to Bottom',
    mode = 'n',
    desc = 'Switch to the buffer to the bottom',
  },
}

vim.keymap.set(
  'v',
  '<leader>/',
  ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = 'Toggle Comment', noremap = true, silent = true }
)

return M
