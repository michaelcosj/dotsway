### ZSHRC

# History
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Line Editor Mode
bindkey -v

setopt autocd nobeep
setopt append_history share_history histignorealldups

# source
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$ZDOTDIR/zshkeybindings"
source "$ZDOTDIR/aliasrc"

# prompt
prompt off # turn off grml prompt

autoload -Uz vcs_info
setopt prompt_subst

precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '[%b%u%c]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a%u%c]'

PROMPT="%F{blue}[%F{yellow}%~%F{blue}]"$'\n'"%(?..%F{red}%?)%F{blue}->%f"
RPROMPT='%F{cyan}${vcs_info_msg_0_}%f'

# completions
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/michael/.config/zsh/.zshrc'

export ZSH_COMPDUMP="~/.cache/.zcompdump"

autoload -Uz compinit
compinit

echo '\( ^-^)/ "Hello Sailor!"'
