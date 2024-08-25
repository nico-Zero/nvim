return{
    "ThePrimeagen/harpoon",
    config = function ()
        require("harpoon").setup()
        require("telescope").load_extension('harpoon')
    end,
}
