# Quickfix Navigator

This plugin aims to provide a improved navigation for the quickfix list.

## Usage
When the quickfix list is open Ctrl+n/Ctrl+p will cycle through the quickfix list.
Using the keybind <leader>c the quickfix list can then be closed. 

## Installation

### Lazy.nvim
```lua
{ "salfel/quickfix-navigator", opts = {} },
```

## Configuration
The keymaps provided can be customized using the plugin's options

```lua
{ 
    "salfel/quickfix-navigator",
    opts = {
        keymaps = {
            previous = "<C-p>",
            next = "<C-n>",
            close = "<leader>c"
        }
    }
}
```
