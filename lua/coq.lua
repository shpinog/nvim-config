vim.g.coq_settings = {
  keymap = { recommended = false },
  auto_start = 'shut-up',
  ["keymap.recommended"] = true,
  clients = {
    tmux = { enabled = false },
  },
}

require'coq'

