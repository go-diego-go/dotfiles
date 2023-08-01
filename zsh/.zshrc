# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
#
alias vim='nvim'
alias sublime='open -a "Sublime Text"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/sqlite/bin:$PATH"

fpath=(~/.zfunc /usr/local/share/zsh-completions $fpath)

# Customize to your needs...
alias cat='bat'
alias ping='prettyping --nolegend'
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias top="htop"

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias help='tldr'

alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'

zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC="yes"

zinit light zdharma/fast-syntax-highlighting

zinit light MichaelAquilina/zsh-you-should-use
zinit light unixorn/git-extra-commands
zinit light StackExchange/blackbox
zinit light lukechilds/zsh-nvm

zinit ice from"gh-r" as"program"; zinit light junegunn/fzf-bin

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zinit ice pick"init.sh"; zinit light b4b4r07/enhancd

zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

setopt autocd autopushd 

autoload -U compinit
compinit

bindkey -v

zinit light zsh-users/zsh-syntax-highlighting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# 1Password CLI shell completion
eval "$(op completion zsh)"; compdef _op op

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diego/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/path.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# The next line enables shell command completion for gcloud.
if [ -f '/Users/diego/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diego/google-cloud-sdk/completion.zsh.inc'; fi
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
source /Users/diego/.config/op/plugins.sh
