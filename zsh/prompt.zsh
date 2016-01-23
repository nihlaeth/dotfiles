autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# load git status
source $HOME/.dotfiles/zshplugins/zsh-git-prompt/zshrc.sh

directory_name() {
  echo "%{$fg_bold[cyan]%}%0d%{$reset_color%}"
}

user_name() {
  echo "%{$fg[green]%}%n%{$reset_color%} at %{$fg[red]%}%m%{$reset_color%}"
}

# smiley that indicates exit code of last command
smile () {
  echo "%(?,%{$fg[green]%}$(echo -e "\xE2\x98\xBA")%{$reset_color%},%{$fg[red]%}$(echo -e "\xE2\x98\xB9")%{$reset_color%})"
}

# set rprompt to indicat insert or main mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

export PROMPT=$'\n$(user_name) : $(directory_name) $(git_super_status)\n$(smile)# '

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
