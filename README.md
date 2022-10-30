# Pingu1m's Nvim lua config

Hi, this is my nvim config. In the future I will make this easier to use for someone that wants a minimal install with sane defaults and finally, have full control of what is being added.


TODO:
- https://github.com/github/copilot.vim
- https://github.com/sindrets/diffview.nvim
- Comments
- Sneak, Leap, Easymotion, Hop
- format on save
- lexima or auto pairs
- https://github.com/lukas-reineke/indent-blankline.nvim
- dashboard plugin
- feline-nvim
- copilot

To Try:
- https://github.com/kdav5758/TrueZen.nvim
- https://github.com/romgrk/doom-one.vim
- https://github.com/airblade/vim-rooter
- lazygit
- https://www.youtube.com/watch?v=indguFY7wJ0
- https://github.com/CRAG666/code_runner.nvim

Themes:
- https://github.com/folke/tokyonight.nvim

Configs:
- https://github.com/kkalamarski/neovim-config


Reference:
https://github.com/rockerBOO/awesome-neovim

Dump

nnoremap <silent> <leader>i :vert :1T pipenv shell ipython<CR><bar>:1Tclear<CR>
nnoremap <leader>y /%%<CR>Nwyn :nohls<CR>
nnoremap <leader>p :1T %paste<CR>


```lua
require("yabs"):setup {
    languages = {

      -- Lua
      lua = {
        tasks = {
          run = {
            command = "luafile %",
            type = "lua",
          },
        },
      },

      -- Python
      python = {
        tasks = {
          run = {
            command = "python %",
            output = "echo",
          },
          monitor = {
            command = "nodemon -e py %",
            output = "terminal",
          },
        },
      },

      -- Others
    },
  }
  require("telescope").load_extension "yabs"
```