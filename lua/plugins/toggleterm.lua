return{
    "akinsho/toggleterm.nvim",
    config = function ()
        require("toggleterm").setup({
            size = 20,
            start_in_insert = true,
            open_mapping = [[<A-\>]],
            direction = "float",
            autochdir=true,
            on_create=function ()
                vim.cmd("TermExec cmd='conda activate $CONDA_DEFAULT_ENV && clear'")
            end,
        })
    end,
}
