return {
  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = {
      options = {
        icons_enabled = true,
        theme = RVimOptions.colorscheme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "nvim-tree",
            "NvimTree",
            "lazy",
          },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = vim.o.laststatus == 3,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { "nvim_lsp" },
            -- Displays diagnostics for the defined severity types
            --
            sections = { "error", "warn", "info", "hint" },

            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = "DiagnosticError", -- Changes diagnostics' error color.
              warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
              info = "DiagnosticInfo", -- Changes diagnostics' info color.
              hint = "DiagnosticHint", -- Changes diagnostics' hint color.
            },
            symbols = {
              error = RVimOptions.icons.diagnostics.Error,
              warn = RVimOptions.icons.diagnostics.Warn,
              info = RVimOptions.icons.diagnostics.Info,
              hint = RVimOptions.icons.diagnostics.Hint,
            },
            colored = true, -- Displays diagnostics status in color if set to true.
            update_in_insert = true, -- Update diagnostics in insert mode.
            always_visible = true, -- Show diagnostics even if there are none.
          },

          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            path = 1,
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
        },
        lualine_x = {
          {
            "diff",
            colored = true, -- Displays a colored diff status if set to true
            -- Changes the symbols used by the diff.
            symbols = {
              added = RVimOptions.icons.git.added,
              modified = RVimOptions.icons.git.modified,
              removed = RVimOptions.icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "encoding" },
          { "progress", separator = "", padding = { left = 1, right = 1 } },
          { "location", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          function()
            return "󰥔 " .. os.date("%R")
          end,
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = true, -- Shows shortened relative path when set to false.
            hide_filename_extension = false, -- Hide filename extension when set to true.
            show_modified_status = true, -- Shows indicator when the buffer is modified.
            mode = 0, -- 0: Shows buffer name
            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
            use_mode_colors = true,
            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "# ", -- Text to show to identify the alternate file
              directory = " ", -- Text to show when the buffer is a directory
            },
          },
        },
        lualine_z = {
          {
            "tabs",
            tab_max_length = 40, -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
            max_length = vim.o.columns / 3, -- Maximum width of tabs component.
            -- Note:
            -- It can also be a function that returns
            -- the value of `max_length` dynamically.
            mode = 0, -- 0: Shows tab_nr
            -- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
            use_mode_colors = true,
            show_modified_status = true, -- Shows a symbol next to the tab name if the file has been modified.
          },
        },
      },
      extensions = { "nvim-tree", "lazy" },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufReadPost",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "nvim-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
        },
      },
    },
    main = "ibl",
  },

  -- A Lua fork of vim-devicons.
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Icon provider
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
