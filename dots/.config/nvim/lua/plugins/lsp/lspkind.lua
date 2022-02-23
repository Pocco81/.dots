local present, lspkind = pcall(require, "lspkind")
if not present then
    return
end

lspkind.init()
