# Nicolas Alvarez

from libqtile import widget
from settings.theme import colors
import os
import socket

# Icons from nerd fonts https://www.nerdfonts.com/cheat-sheet

my_sep = lambda: widget.Sep(linewidtw = 0, padding = 0, background = colors["dark"], foreground = colors["dark"])

powerline = lambda fg = 'light', bg = 'dark' : widget.TextBox(
    foreground = colors[fg],
    background = colors[bg],
    text = "", # Nerd Font -nf-oct triangle_left
    font = "UbuntuMono Nerd Font Bold",
    fontsize = 39,
    padding = -2 
)

icon = lambda fg = 'text', bg = 'dark', fontsize = 17, text = "?": widget.TextBox(
    foreground = colors[fg],
    background = colors[bg],
    font = "UbuntuMono Nerd Font Bold",
    fontsize = fontsize,
    text = text,
    padding = 4
)

my_workspaces = lambda: [
    my_sep(),
    widget.GroupBox(
        foreground = colors["light"],
        font='UbuntuMono Nerd Font',
        fontsize=19,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=1,
        active=colors['active'],
        inactive=colors['inactive'],
        rounded=False,
        highlight_method='block',
        urgent_alert_method='block',
        urgent_border=colors['urgent'],
        this_current_screen_border=colors['focus'],
        this_screen_border=colors['grey'],
        other_current_screen_border=colors['dark'],
        other_screen_border=colors['dark'],
        disable_drag=True
    ),
    #my_sep(),
    widget.WindowName(
        foreground = colors["focus"],
        fontsize = 17,
        padding = 5
    ),
]

prompt = "{0}@{1} ".format(os.environ["USER"], socket.gethostname())

my_widgets = [
    *my_workspaces(),
    powerline("color4"),
    icon(bg = "color4", text = " "), # nf-oct-diff_renamed
    widget.TextBox(
        #**base(bg = colors['color4']),
        font = "UbuntuMono Nerd Font Bold",
        background = colors['color4'],
        text = prompt,
    ),
    powerline("color3", "color4"),
    icon(bg = "color3", text = " "), # nf-fa-download
    widget.Pacman(background = colors["color3"], update_intervale = 1800, padding = 6),
    powerline("color2", "color3"),
    icon(bg = "color2", text = " "), # nf-fa-feed
    widget.Net(background = colors["color2"], padding = 4),
    powerline("color1", "color2"),
    widget.CurrentLayoutIcon(background = colors["color1"], scale = 0.65),
    widget.CurrentLayout(background = colors["color1"], padding = 4),
    powerline("color4", "color1"),
    icon(bg = "color4", text="  "),
    widget.Clock(
        background = colors["color4"],
        format='%d/%m/%Y',
        padding = 5
    ),
    icon(bg = "color4", text = " "),
    widget.Clock(
        background = colors["color4"],
        padding = 5
    ),
    powerline("dark", "color4"),
    widget.Systray(background = colors['dark'], padding = 5),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 17,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()