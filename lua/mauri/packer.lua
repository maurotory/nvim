-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }

}
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  use ({ 
	  "rose-pine/neovim", as = "rose-pine" ,
	  config = function()
		vim.cmd('colorscheme rose-pine')
	end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use 'mbbill/undotree'
  use('tpope/vim-fugitive')
  use { 'mhartington/formatter.nvim' }

  -- packer.nvim
use({
  "robitx/gp.nvim",
	config = function()
		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				-- openai = {
					-- endpoint = "https://api.openai.com/v1/chat/completions",
					-- secret = os.getenv("OPENAI_API_KEY"),
          -- disable = true
				-- },

				-- azure = {...},

				-- copilot = {
					-- endpoint = "https://api.githubcopilot.com/chat/completions",
					-- secret = {
						-- "bash",
						-- "-c",
						-- "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
					-- },
				-- },

				-- pplx = {
					-- endpoint = "https://api.perplexity.ai/chat/completions",
					-- secret = os.getenv("PPLX_API_KEY"),
				-- },

				-- ollama = {
					-- endpoint = "http://localhost:11434/v1/chat/completions",
				-- },

				googleai = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
					secret = os.getenv("GOOGLEAI_API_KEY"),
				},

				anthropic = {
					endpoint = "https://api.anthropic.com/v1/messages",
					secret = os.getenv("ANTHROPIC_API_KEY"),
          disable = false
				},
			},
			agents = {
				{
					provider = "anthropic",
					name = "claude-3.7-sonnet-20250219",
					chat = true,
					command = true,
					-- string with model name or table with model name and parameters
					model = { model = "claude-3-7-sonnet-20250219", temperature = 0.8, top_p = 1 },
					system_prompt = os.getenv("ANTHROPIC_SYSTEM_PROMPT"),
				},
			},
		}
		require("gp").setup(conf)
		vim.keymap.set("n", "<space>g", ":GpChatRespond<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<space>c", ":GpChatClose<CR>", { noremap = true, silent = true })

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
})
  use('neovim/nvim-lspconfig')
  use('MunifTanjim/prettier.nvim')
  use 'jose-elias-alvarez/null-ls.nvim'
--  use 'fatih/vim-go'
--  -- Packer
  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup()
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  use {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v1.x",
	  requires = {
		  {"neovim/nvim-lspconfig"},
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"saadparwaiz1/cmp_luasnip"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-nvim-lua"},

		  -- Snippets
		  {"L3MON4D3/LuaSnip"},
		  {"rafamadriz/friendly-snippets"},
	  }
  }
end)
