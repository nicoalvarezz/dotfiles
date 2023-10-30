# NVIN cofigs

This configs are for nvimhchad. To use them just install nvimchad as normal and place them in the specified locations.

# File Locations

The `init.lua` file store the remaps

```lua
init.lua ---> nvim/lua/custom

```

The `lspconfig.lua` stores the language server configs
```lua
lspconfig.lua -----> nvim/lua/custom/config
```

The `plugins.lua` store extra plugins that are going to be installed when applied.
```lua
plugins.lua -----> nvim/lua/custom
```

Is important to highlight that if some of the folders mentioned here are not found by defualt is ok to create them. 

# First steps

First steps to install and setpu nvimchad
0. Install nvim if not installed
    - `brew install nvim`
1. Save a backup of your previous configs
    - `nv ~/.config/nvim ~/.config/nvim.backup` 
2. Remove local nvin cache to prevent any issues
    - `rm -rf ~/.local/share/nvim`
3. Run the following command to install `nvimchad`
    - `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1`
4. If asked to install sample config deny it.

# Reference

You can find a great reference to install nvimchad [here](https://www.youtube.com/watch?v=Mtgo-nP_r8Y).

