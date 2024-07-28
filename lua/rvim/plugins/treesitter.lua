return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = "BufReadPost",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  opts = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = RVimOptions.treesitter.ensure_installed,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = RVimOptions.treesitter.auto_install,
    -- List of parsers to ignore installing (for "all")
    ignore_install = RVimOptions.treesitter.ignore_install,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
