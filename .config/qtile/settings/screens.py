# Nicolas Alvarez 

# No more than one monitor support yet
from libqtile.config import Screen
from libqtile import bar
from settings.widgets import my_widgets
import subprocess

status_bar = lambda widget : bar.Bar(widget, 26, opacity = 0.9, background = "#000000")
screens = [Screen(top=status_bar(my_widgets))]