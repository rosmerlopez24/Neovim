return {
  -- For more information visit this Repo
  -- https://github.com/marko-cerovac/material.nvim
  {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 1000,
    lazy = RVimOptions.colorscheme ~= "material",
    opts = {
      contrast = {
        terminal = false,
        sidebars = true,
        floating_windows = false,
        cursor_line = false,
        non_current_windows = false,
        filetypes = {},
      },
      plugins = {
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
      },
    },
    config = function(_, opts)
      require("material").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/shaunsingh/nord.nvim
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1000,
    lazy = RVimOptions.colorscheme ~= "nord",
    config = function()
      vim.g.nord_italic = false
    end,
  },

  -- For more information visits this Repo
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = RVimOptions.colorscheme ~= "catppuccin",
    opts = {
      flavour = RVimOptions.style,
      integrations = {
        cmp = true,
        gitsigns = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        indent_blankline = {
          enabled = true,
          scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    lazy = RVimOptions.colorscheme ~= "tokyonight",
    opts = {
      style = RVimOptions.style, -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = false, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/uloco/bluloco.nvim
  {
    "uloco/bluloco.nvim",
    name = "bluloco",
    lazy = RVimOptions.colorscheme ~= "bluloco",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = RVimOptions.style, -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/rose-pine/neovim
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = RVimOptions.colorscheme ~= "rose-pine",
    priority = 1000,
    opts = {
      --- @usage 'auto'|'main'|'moon'|'dawn'
      variant = RVimOptions.style,
      --- @usage 'main'|'moon'|'dawn'
      dark_variant = RVimOptions.style,
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = true,

      --- @usage string hex value or named color from rosepinetheme.com/palette
      groups = {
        background = "base",
        background_nc = "_experimental_nc",
        panel = "surface",
        panel_nc = "base",
        border = "highlight_med",
        comment = "muted",
        link = "iris",
        punctuation = "subtle",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- Change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/Recipes
      highlight_groups = {
        ColorColumn = { bg = "rose" },

        -- Blend colours against the "base" background
        CursorLine = { bg = "foam", blend = 10 },
        StatusLine = { fg = "love", bg = "love", blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = "gold", inherit = false },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/navarasu/onedark.nvim
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = RVimOptions.colorscheme ~= "onedark",
    priority = 1000,
    opts = {
      -- Main options --
      style = RVimOptions.style, -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = {
        "dark",
        "darker",
        "cool",
        "deep",
        "warm",
        "warmer",
        "light",
      }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
}
