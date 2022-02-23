local g = vim.g
local fn = vim.fn

g.dashboard_disable_at_vimenter = 0 -- dashboard is disabled by default
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

-- g.dashboard_custom_header = {
--     "                                   ",
--     "                                   ",
--     "                                   ",
--     "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ",
--     "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
--     "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
--     "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
--     "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
--     "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
--     "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
--     " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
--     " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
--     "    ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆       ",
--     "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
--     "                                   "
-- }

g.dashboard_custom_header = {
"                     ,                          ",
"                ,.  | \\                        ",
"               |: \\ ; :\\                      ",
"               :' ;\\| ::\\                     ",
"                \\ : | `::\\                    ",
"                _)  |   `:`.                    ",
"              ,' , `.    ;: ;                   ",
"            ,' ;:  ;\"'  ,:: |_                 ",
"           /,   ` .    ;::: |:`-.__             ",
"        _,' _o\\  ,::.`:' ;  ;   . '            ",
"    _,-'           `:.          ;\"\"\\,        ",
" ,-'                     ,:         `-;,        ",
" \\,                       ;:           ;--._   ",
"  `.______,-,----._     ,' ;:        ,/ ,  ,`   ",
"         / /,-';'  \\     ; `:      ,'/,::.:::  ",
"       ,',;-'-'_,--;    ;   :.   ,',',;::::::   ",
"      ( /___,-'     `.     ;::,,'o/  ,:::::::   ",
"       `'             )    ;:,'o /  ;\"-   -::  ",
"                      \\__ _,'o ,'         ,::  ",
"                         ) `--'       ,..::::   ",
"                         ; `.        ,:::::::   ",
"                          ;  ``::.    :::::::   ",
}



-- g.dashboard_custom_header = {
-- "          ▄              ▄    ",
-- "         ▌▒█           ▄▀▒▌   ",
-- "         ▌▒▒█        ▄▀▒▒▒▐   ",
-- "        ▐▄█▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐   ",
-- "      ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐   ",
-- "    ▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌   ",
-- "   ▐▒▒▒▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▌  ",
-- "   ▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐  ",
-- "  ▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ ",
-- "  ▌░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ ",
-- " ▌▒▒▒▄██▄▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▐ ",
-- "▐▒▒▒▐▄█▄█▌▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▒▒▌",
-- "▐▒▒▒▐▀▐▀▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ ",
-- "▐▒▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ ",
-- " ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌  ",
-- "  ▀▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒▄▒▒▒▒▌  ",
-- "     ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀   ",
-- "       ▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀     ",
-- "          ▀▀▀▀▀▀▀▀▀▀▀▀        ",
-- }

g.dashboard_custom_section = {
    a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                 SPC f w"}, command = "Telescope live_grep"},
    d = {description = {"洛 New File                  SPC f n"}, command = "DashboardNewFile"},
    e = {description = {"  Bookmarks                 SPC b m"}, command = "Telescope marks"},
    f = {description = {"  Load Last Session         SPC s l"}, command = "SessionLoad"},
	g = {description = {"  Settings                  SPC s s"}, command = ':new ~/.config/nvim/lua/nvd_settings.lua | only'},
}

g.dashboard_custom_footer = {
    "   ",
    "Pocco81"
}
