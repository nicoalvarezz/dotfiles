# Inspired by Antionio Sarosi

from os import path
import subprocess
import json
from settings.path import qtile_path

def theme():
    theme = "dark-grey"

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme" : "{"theme"}"}}\n')
    
    theme_file = path.join(qtile_path, "themes", 'material-darker.json')
    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')
    
    with open(path.join(theme_file)) as f:
        return json.load(f)

if __name__ == "settings.theme":
    colors = theme()
