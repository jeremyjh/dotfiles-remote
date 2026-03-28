# vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
[[ -z "$terminfo[khome]" ]] || bindkey -M viins "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]"  ]] || bindkey -M viins "$terminfo[kend]"  end-of-line
[[ -z "$terminfo[kdch1]" ]] || bindkey -M viins "$terminfo[kdch1]" vi-delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# vi mode indicator in prompt
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) VIMODE='[N]' ;;
    *)     VIMODE='[I]' ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${VIMODE} %n@%m:%~%# '

# History
setopt histignorespace
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# Unbind C-s flow control
bindkey -r "^s"
stty -ixon

export TERM="xterm-256color"
export EDITOR=vim
export LESS="-R"

# PATH
export PATH="$HOME/.local/bin:$HOME/.bin:$PATH"

# ls: color on Linux, plain fallback elsewhere
if ls --color=auto &>/dev/null; then
  alias ls="ls --color=tty -loat"
else
  alias ls="ls -loat"
fi

alias k=kubectl

# Load local overrides if present
[[ -f ~/.envlocal ]] && source ~/.envlocal
