# Nicolas Alvarez

# Qtile Keybindins

from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"
teminal = "alacritty"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------------Window Configs------------------

    # Switch between windows in current stack pane
    ([mod], "k", lazy.layout.down()),
    ([mod], "j", lazy.layout.up()),
    
    # Change window sizes
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "k", lazy.layout.shuffle_down()),
    ([mod, "shift"], "j", lazy.layout.shuffle_up()),

    # Move between different layouts
    ([mod], "Tab", lazy.next_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Restat Qtile
    ([mod, "control"], "r", lazy.restart()),

    # Shutdown Qtile
    ([mod, "control"], "q", lazy.shutdown()),

    # ------------------App Configs------------------

    # Open Terminal
    ([mod], "Return", lazy.spawn(teminal)),

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("brave")),

    # File explorer
    ([mod], "f", lazy.spawn("thunar")),

    # VsCode
    ([mod], "c", lazy.spawn("code")),

    # Redshitf (night light)
    ([mod], "r", lazy.spawn("redshift -o")), # On
    ([mod, "shift"], "r", lazy.spawn("redshift -x")), # Off

    # Screenshot
    ([mod], "s", lazy.spawn("scrot")),

    # ------------------Hardware Config------------------
    # Not using this configs at the moment

    # Volume
    #([], "XF86AudioLowerVolume", lazy.spawn(
    #    "pactl set-sink-volume @DEFAULT_SINK@ -5%")),

    # ([], "XF86AudioRaiseVolume", lazy.spawn(
    #     "pactl set-sink-volume @DEFAULT_SINK@ +5%")),

    # ([], "XF86AudioMute", lazy.spawn(
    #     "pactl set-sink-mute @DEFAULT_SINK@ toggle")),

    # Brightness    
    # ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    # ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
