-- ~/.config/nvim/lua/plugins/vimtex.lua
-- Final configuration for VimTeX with Zathura and nvr synchronization.

return {
    "lervag/vimtex",

    -- CRITICAL: Prevents lazy-loading, which would break inverse search functionality.
    lazy = false,

    init = function()
        -- 1. Compiler Settings (using latexmk)
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            args = {
                "-pdf",
                "-silent",
                "-pvc", -- Persistent Viewer, Continuous Compilation (autofresh)
                "-synctex=1", -- Enables Synctex for bi-directional search
                "-interaction=nonstopmode",
            },
        }

        -- 2. Viewer Settings (using Zathura, which is correctly installed)
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_general_viewer = "zathura"

        -- 3. Inverse Search Configuration (PDF -> Editor Jump)
        -- FIX: Uses vim.v.servername (a variable) to pass the server name to nvr,
        -- resolving the E117 function error.
        vim.g.vimtex_view_general_options = '--synctex-editor-command "nvr --servername '
            .. vim.v.servername -- CORRECT Lua variable
            .. ' --remote +%{line} %{input}" -x'

        -- 4. Disable Conflicting Mappings
        -- Disables the 'K' mapping to avoid conflicts with the Language Server Protocol (LSP) hover.
        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
    end,

    -- 5. Keymaps (using LazyVim's default localleader \)
    keys = {
        { "<leader>ll", "<cmd>VimtexCompile<cr>", desc = "LaTeX: Compile" },
        { "<leader>lv", "<cmd>VimtexView<cr>", desc = "LaTeX: View/Refresh PDF" },
        { "<leader>lk", "<cmd>VimtexStop<cr>", desc = "LaTeX: Stop Compiler" },
    },
}
