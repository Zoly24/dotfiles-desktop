return {
    "epwalsh/obsidian.nvim",
    version = "*", -- Use the latest release
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        -- Where your x86 Paging notes live
        workspaces = {
            {
                name = "OS-Notes",
                path = "~/Documents/Vaults/OS-Notes/",
            },
        },

        -- Where to put images when you paste them
        attachments = {
            img_folder = "assets",
        },

        -- UI settings for that "Obsidian" look in Neovim
        ui = {
            enable = true,
            update_debounce = 200,
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
            },
        },

        -- Use xdg-open so you can click links on Arch/Hyprland
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
        end,
    },
}
