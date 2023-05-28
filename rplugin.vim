" perl plugins


" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/Users/ayushpoddar/.config/nvim/plugged/chatgpt.nvim/rplugin/python3/chatgpt_nvim.py', [
      \ {'sync': v:false, 'name': '_chat_closed', 'type': 'function', 'opts': {}},
      \ {'sync': v:false, 'name': '_chat_query', 'type': 'function', 'opts': {}},
      \ {'sync': v:false, 'name': 'ChatGPT', 'type': 'command', 'opts': {'nargs': '*'}},
     \ ])


" ruby plugins


" python plugins


