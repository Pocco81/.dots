local colors = {
			white = "#F2F2F7",
			darker_black = "#1b1f27",
			black = "#0E171C", --  nvim bg
			black2 = "#252931",
			one_bg = "#282c34", -- real bg of onedark
			one_bg2 = "#353b45",
			one_bg3 = "#30343c",
			grey = "#42464e",
			grey_fg = "#565c64",
			grey_fg2 = "#6f737b",
			light_grey = "#6f737b",
			red = "#E28D8D",
			baby_pink = "#E28D8D",
			pink = "#ff75a0",
			line = "#2a2e36", -- for lines like vertsplit
			green = "#ADD692",
			vibrant_green = "#ADD692",
			nord_blue = "#81A1C1",
			blue = "#61afef",
			yellow = "#E3DAA3",
			sun = "#E3DAA3",
			purple = "#b4bbc8",
			dark_purple = "#c882e7",
			teal = "#519ABA",
			orange = "#fca2aa",
			cyan = "#a3b8ef",
			statusline_bg = "#332E41",
			lightbg = "#3e4058",
			lightbg2 = "#201C2B",
}

local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        -- mappings = true,
        always_show_bufferline = false
    },
    highlights = {
        fill = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        background = {
            guifg = colors.grey_fg,
            guibg = colors.black2
        },
        -- buffers
        buffer_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        buffer_selected = {
            guifg = colors.white,
            guibg = colors.black,
            gui = "bold"
        },
        -- tabs
        tab = {
            guifg = colors.light_grey,
            guibg = colors.one_bg3
        },
        tab_selected = {
            guifg = colors.black2,
            guibg = colors.nord_blue
        },
        tab_close = {
            guifg = colors.red,
            guibg = colors.black
        },
        indicator_selected = {
            guifg = colors.black,
            guibg = colors.black
        },
        -- separators
        separator = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        separator_visible = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        separator_selected = {
            guifg = colors.black2,
            guibg = colors.black2
        },
        -- modified
        modified = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_visible = {
            guifg = colors.red,
            guibg = colors.black2
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.black
        },
        -- close buttons

        close_button = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_visible = {
            guifg = colors.light_grey,
            guibg = colors.black2
        },
        close_button_selected = {
            guifg = colors.red,
            guibg = colors.black
        }
    }
}
