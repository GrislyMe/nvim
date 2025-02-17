vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvimtools/hydra.nvim' },

  -- scheme
  { "tomasr/molokai",       lazy = true },
  { "morhetz/gruvbox",      lazy = true },
  { "Mofiqul/dracula.nvim", lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rebelot/kanagawa.nvim", lazy = true },

  -- leetcode
  --{
  --	"kawre/leetcode.nvim",
  --	build = ":TSUpdate html",
  --	dependencies = {
  --		"nvim-telescope/telescope.nvim",
  --		"nvim-lua/plenary.nvim", -- required by telescope
  --		"MunifTanjim/nui.nvim",

  --		-- optional
  --		"rcarriga/nvim-notify",
  --	},
  --	opts = {
  --		-- configuration goes here
  --	},
  --},

  -- git
  -- { "tpope/vim-fugitive" }, {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",           -- optional
      -- "echasnovski/mini.pick",      -- optional
    },
    config = true
  },


  --debug
  { "mfussenegger/nvim-dap" },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" },
    config = function()
      require('dapui').setup()
    end
  },

  -- auto complete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "dcampos/nvim-snippy" },
  { "dcampos/cmp-snippy" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    init = function()
      require("mason").setup()
    end,
    cmd = "Mason",
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  { "ray-x/lsp_signature.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.rustfmt,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  -- file explore
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- status bar
  { "majutsushi/tagbar" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- language support
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" }
  -- },
  { "nvim-treesitter/nvim-treesitter" },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6', --recommended as each new version will have breaking changes
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },

  -- terminal
  { "akinsho/nvim-toggleterm.lua" },

  -- other
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    opts = {},
    init = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = {
            "[[____________________________________________________________]]",
            "[[|                                                          |]]",
            "[[|    ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗      |]]",
            "[[|    ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║      |]]",
            "[[|    ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║      |]]",
            "[[|    ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║      |]]",
            "[[|    ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║      |]]",
            "[[|    ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝      |]]",
            "[[|                     █▀▀ █▀█ █ █▀ █░░ █▄█ █▀▄▀█ █▀▀       |]]",
            "[[|                     █▄█ █▀▄ █ ▄█ █▄▄ ░█░ █░▀░█ ██▄       |]]",
            "[[|                                                          |]]",
            "[[|__________________________________________________________|]]",
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  --ai
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    init = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "right", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },
})
