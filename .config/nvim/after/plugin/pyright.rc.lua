local status, pyright = pcall(require, "nvim-lspconfig")
if (not status) then return end

pyright.setup {}
