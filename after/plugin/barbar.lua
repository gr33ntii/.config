require'barbar'.setup {
   sidebar_filetypes = {
    NvimTree = true,
    undotree = {text = 'undotree'},
    ['neo-tree'] = {event = 'BufWipeout'},
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },
}
