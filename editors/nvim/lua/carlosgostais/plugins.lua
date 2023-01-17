vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
use {
  'nvim-telescope/telescope.nvim', 
  requires = { {'nvim-lua/plenary.nvim'} }
}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  end
  )  
