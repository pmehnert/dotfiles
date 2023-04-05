return {
    opt = {
        relativenumber = true,
        showcmd = true,
        shiftwidth = 4,
        signcolumn = "yes",
        cmdheight = 1,
    },
    g = {
        mapleader = " ",
        autoformat_enabled = true,
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 2, -- (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true,
        ui_notifications_enabled = true,
        onedark_terminal_italics = 1,
        onedark_color_overrides = {
            background = { gui = "#1E222A", cterm = "235", term = "0" },
        },
        gui_font_default_size = 12,
        gui_font_face = "JetBrainsMono Nerd Font",
    },
}
