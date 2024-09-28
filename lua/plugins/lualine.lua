return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'tokyonight',
                section_separators = '',
                component_separators = '',
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetyee' },
                lualine_y = { 'progress', "location" },
                lualine_z = {
                    { require("recorder").displaySlots }, { require("recorder").recordingStatus },
                },
            },
        }
    end,
}
