return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "typescript-language-server",
        "rust-analyzer",
        "move-analyzer",
      },
    },
  },
}
