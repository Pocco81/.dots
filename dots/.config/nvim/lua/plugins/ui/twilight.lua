local present, twilight = pcall(require, "twilight")
if not present then
    return
end

twilight.setup {
    dimming = {
        alpha = 0.25, -- amount of dimming
        color = {"Normal", "#ffffff"}
    },
    context = 10, -- amount of lines we will try to show around the current line
    expand = {
        "function",
        "method",
        "table",
        "if_statement"
    }
}
