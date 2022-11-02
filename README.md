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



## Shortcuts

```bash


export PGPASSWORD="s&M668bC"

# stats-development-airflow-v5-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com
# stats-dev-airflow-v6-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com

mysql -h stats-development-airflow-v5-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com -u airflow -D airflow -p"s&M668bC" -e 'select id, `key`, `val`, is_encrypted, null as description from airflow.variable'  -N -B | psql -h stats-dev-airflow-v6-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com -U airflow -p 3306 -d airflow -c "copy airflow.variable from stdin USING DELIMITERS E'\t' WITH NULL AS 'NULL'"

mysql -h stats-development-airflow-v5-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com -u airflow -D airflow -p"s&M668bC" -e 'select id , conn_id, COALESCE(conn_type, ""), host, `schema`, login, password, port, extra, is_encrypted, is_extra_encrypted, null as description from airflow.connection'  -N -B | psql -h stats-dev-airflow-v6-db-1.c4evcv7jsyjv.us-west-2.rds.amazonaws.com -U airflow -p 3306 -d airflow -c "copy airflow.connection from stdin USING DELIMITERS E'\t' WITH NULL AS 'NULL'"



```