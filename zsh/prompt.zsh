autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# load git status
source $HOME/.dotfiles/zshplugins/zsh-git-prompt/zshrc.sh

# load hg status
function hg_super_status {
    hg prompt --angle-brackets "\
<on %{$fg[magenta]%}<branch>%{$reset_color%}>\
<|%{$fg[green]%}<bookmark>%{$reset_color%}>\
< at %{$fg[yellow]%}<rev>%{$reset_color%}>\
< %{$fg[yellow]%}(<tags|%{$reset_color%}, %{$fg[yellow]%}>)%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}" 2>/dev/null
}

directory_name() {
  echo "%0{$fg_bold[cyan]%}%0d%0{$reset_color%}"
}

user_name() {
  echo "%0{$fg[green]%}%n%0{$reset_color%} at %0{$fg[red]%}%m%0{$reset_color%}"
}

# smiley that indicates exit code of last command
smile () {
  echo "%(?,%{$fg[green]%}$(echo -e "\xE2\x98\xBA")%{$reset_color%},%{$fg[red]%}$(echo -e "\xE2\x98\xB9")%{$reset_color%})"
  #echo "%1(?,%{$fg[green]%}$(echo -e "\xE2\x98\xBA")%{$reset_color%},%{$fg[red]%}$(echo -e "\xE2\x98\xB9")%{$reset_color%})"
#  echo "%(?,%{$fg[green]%}:D%{$reset_color%},%{$fg[red]%}:o%{$reset_color%})"
}

# set rprompt to indicat insert or main mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%0{$fg_bold[red]%}[NORMAL]%0{$reset_color%}"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} %?"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

export PROMPT=$'\n$(user_name) : $(directory_name) $(hg_super_status)$(git_super_status)\n$(smile) # '

set_prompt () {
  export RPROMPT="%0{$fg_bold[cyan]%}%0{$reset_color%} %?"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
