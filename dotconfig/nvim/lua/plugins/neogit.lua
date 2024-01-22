return {
  {
    "NeogitOrg/neogit",
    opts = {
      integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        -- use {
        --   'TimUntersberger/neogit',
        --   requires = {
        --     'nvim-lua/plenary.nvim',
        --     'sindrets/diffview.nvim'
        --   }
        -- }
        --
        diffview = true,
      },
      mappings = {
        status = {
          -- Adds a mapping with "B" as key that does the "BranchPopup" command
          -- ["ca"] = "Commit --amend --verbose",
          -- ["c"] = "Commit --verbose",
        },
      },
    },
  },
}
