local present, icons = pcall(require, "nvim-web-devicons")
if not present then
    return
end

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

icons.setup {
    override = {
        html = {
            icon = "",
            color = colors.baby_pink,
            name = "html"
        },
        css = {
            icon = "",
            color = colors.blue,
            name = "css"
        },
        js = {
            icon = "",
            color = colors.sun,
            name = "js"
        },
        ts = {
            icon = "ﯤ",
            color = colors.teal,
            name = "ts"
        },
        kt = {
            icon = "󱈙",
            color = colors.orange,
            name = "kt"
        },
        png = {
            icon = "",
            color = colors.dark_purple,
            name = "png"
        },
        jpg = {
            icon = "",
            color = colors.dark_purple,
            name = "jpg"
        },
        jpeg = {
            icon = "",
            color = colors.dark_purple,
            name = "jpeg"
        },
        mp3 = {
            icon = "",
            color = colors.white,
            name = "mp3"
        },
        mp4 = {
            icon = "",
            color = colors.white,
            name = "mp4"
        },
        out = {
            icon = "",
            color = colors.white,
            name = "out"
        },
        Dockerfile = {
            icon = "",
            color = colors.cyan,
            name = "Dockerfile"
        },
        rb = {
            icon = "",
            color = colors.pink,
            name = "rb"
        },
        vue = {
            icon = "﵂",
            color = colors.vibrant_green,
            name = "vue"
        },
        py = {
            icon = "",
            color = colors.cyan,
            name = "py"
        },
        toml = {
            icon = "",
            color = colors.blue,
            name = "toml"
        },
        lock = {
            icon = "",
            color = colors.red,
            name = "lock"
        },
        zip = {
            icon = "",
            color = colors.sun,
            name = "zip"
        },
        xz = {
            icon = "",
            color = colors.sun,
            name = "xz"
        },
        deb = {
            icon = "",
            color = colors.cyan,
            name = "deb"
        },
        rpm = {
            icon = "",
            color = colors.orange,
            name = "rpm"
        },
        lua = {
            icon = "",
            color = colors.blue,
            name = "lua"
        }
    }
}
