return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "typescript-language-server",
        "rust-analyzer",
        "move-analyzer",
      },
    },
  },
}
