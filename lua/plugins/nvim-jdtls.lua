return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        require("java-setup").setup()
    end
}
