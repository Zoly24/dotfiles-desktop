return {
    "saghen/blink.cmp",
    -- Use opts to override or extend the default settings provided by LazyVim.
    opts = function(_, opts)
        -- This tells blink.cmp to use LuaSnip as its snippet preset,
        -- fixing the compatibility issue.
        opts.snippets = {
            preset = "luasnip",
        }

        -- Also, explicitly confirm the 'snippets' source is enabled in the default list
        opts.sources.default = vim.tbl_deep_extend("force", opts.sources.default, { "snippets" })

        -- Optional: If <Tab> isn't working for jumping, check your keymap preset.
        -- LazyVim's default keymap preset usually enables SuperTab logic:
        -- opts.keymap = { preset = "super-tab" } -- if you need to enforce a change

        return opts
    end,
}
