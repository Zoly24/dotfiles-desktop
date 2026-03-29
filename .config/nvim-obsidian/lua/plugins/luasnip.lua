return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local c = ls.choice_node

        ls.cleanup()

        ls.add_snippets("markdown", {

            -- Codeblock
            s(";cc", {
                t("```"),
                i(1, "language"),
                t({ "", "" }),
                i(2, "  "),
                t({ "", "```" }),
            }),

            -- Backlink a file
            s(";bl", {
                t("[["),
                i(1, "File Name"),
                t("|"),
                i(2, "Display Alias"),
                t("]]"),
            }),

            -- Trigger: ;m (Inline Math)
            s(";lim", {
                t("$"),
                i(1),
                t("$"),
            }),

            -- Trigger: ;M (Block Math)
            s(";lbm", {
                t({ "$$", "" }),
                i(1),
                t({ "", "$$" }),
            }),

            -- Make emphasis on point
            s(";emph", {
                t("> [!"),
                i(1, "TYPE"), -- e.g., WARNING, NOTE, QUOTE, ABSTRACT
                t("]"),
                t({ "", "> " }),
                i(2, ""),
            }),
        })

        -- #####################################################################
        --  UPDATED KEYMAP: Ctrl + j (With Blink-Killer)
        -- #####################################################################
        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            local ls = require("luasnip")

            -- 1. If Blink menu is open, tell it to "Abort" (hide)
            if package.loaded["blink.cmp"] then
                require("blink.cmp").hide()
            end

            -- 2. Expand the snippet or jump to the next spot
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true, desc = "LuaSnip Expand & Hide Blink" })

        -- Ctrl + k to go BACKWARDS (if you miss a spot)
        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true, desc = "LuaSnip Jump Back" })

        -- Ctrl + l to cycle choices (asm -> c -> cpp)
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)
    end,
}
