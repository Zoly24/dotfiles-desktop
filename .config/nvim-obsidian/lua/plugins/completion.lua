return {
    "saghen/blink.cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    opts = {
        snippets = {
            preset = "luasnip",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    config = function(_, opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("blink.cmp").setup(opts)
    end,
}
