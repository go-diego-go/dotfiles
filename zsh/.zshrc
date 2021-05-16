alias vim='nvim'
alias sublime='open -a "Sublime Text"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/sqlite/bin:$PATH"

fpath=(/usr/local/share/zsh-completions $fpath)

# Customize to your needs...
alias cat='bat'
alias ping='prettyping --nolegend'

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
# zinit light lukechilds/zsh-nvm

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

