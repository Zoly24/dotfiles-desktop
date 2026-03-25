return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        default = {
            dir_path = "assets", -- Saves images to your 'assets' folder
            use_absolute_path = false,
            relative_to_current_file = true,
            template = "![[$FILE_NAME]]",
        },
    },
    keys = {
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
    },
}
