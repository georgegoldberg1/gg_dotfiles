local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "css",
        "fish",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "r",
        "sql",
        "toml",
        "yaml"
    },
    autotag = {
        enable = true,
    },
}
