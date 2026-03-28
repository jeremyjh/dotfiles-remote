# dotfiles-remote

Slim dotfiles for remote machines. No heavy dependencies — just vi keybindings, sane defaults, and a usable environment.

## What's included

- `.zshrc` — vi mode, `jk` to exit insert, `[I]/[N]` prompt, basic aliases
- `.inputrc` — vi mode for readline (affects bash, psql, etc.)
- `.vimrc` — sensible defaults, `jk` to escape, window navigation, no plugins
- `.tmux.conf` — prefix `C-a`, vim-style pane nav, `|`/`-` splits
- `.gitconfig` — colors, rerere, sane pull defaults

## Install

Requires [homeshick](https://github.com/andsens/homeshick) (or [homesick](https://github.com/technicalpickles/homesick)):

```bash
homeshick clone <repo-url>
homeshick link dotfiles-remote
```

Or symlink manually:

```bash
for f in home/.*; do ln -sf "$(pwd)/$f" ~/; done
```

## Local overrides

Any machine-specific config (env vars, private tokens, local PATH entries) goes in `~/.envlocal` — it's sourced by `.zshrc` if present and is not tracked.
