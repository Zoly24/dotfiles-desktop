return {
    "L3MON4D3/LuaSnip",
    config = function(opts)
        -- 1. Load the core snippets (friendly-snippets + your custom ones)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- 2. Load Lua snippets from your custom folder
        -- This is the crucial part for your custom "nc" snippet.
        require("luasnip.loaders.from_lua").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
        })

        -- 3. Configure LuaSnip (optional, but good practice)
        require("luasnip").config.setup(opts)

        return opts
    end,
}
