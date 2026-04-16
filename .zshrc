# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# source ~/powerlevel10k/powerlevel10k.zsh-theme

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.juliaup/bin:$HOME/.local/bin/:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/catppuccin_frappe.toml)"
fi

# alias ls='ls --color=auto'
alias ls='lsd'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -a'
alias li='ls -li'
alias vi='nvim'
alias vim='nvim'
alias cat='batcat --paging=never -p'
alias emacs="emacsclient -c -a 'emacs'"
alias emacstui="TERM=xterm-256color emacs -nw"

# Para que con control y flechas se mueva por las palabras
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Para el historial
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory

fpath+=${ZDOTDIR:-~}/.zsh_functions

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"

nvm_lazy_load() {
  unset -f node npm npx nvm

  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

node() { nvm_lazy_load; node "$@"; }
npm()  { nvm_lazy_load; npm "$@"; }
npx()  { nvm_lazy_load; npx "$@"; }
nvm()  { nvm_lazy_load; nvm "$@"; }


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Open in a popup if on tmux or Zellij, otherwise use --height mode No funciona en tmux < 3.3
# export FZF_DEFAULT_OPTS='--height 40% --popup bottom,40% --layout reverse --border top'
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border top'
