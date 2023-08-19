PROMPT='${STATUS} ${PROMPT_PREFIX}$(get_path)$(git_prompt_info)$(git_prompt_status)${PROMPT_SUFFIX}'
local STATUS="%(?:%{$fg_bold[yellow]%}⌘:%{$fg_bold[red]%}⌘)"
local PROMPT_PREFIX="%(?:%{$fg_bold[cyan]%}:%{$fg_bold[red]%})"
local PROMPT_SUFFIX=" %(?:%{$fg_bold[yellow]%}▶ :%{$fg_bold[red]%}▶ )"
function get_path(){
  local path=""
  current_dir=$PWD
  if [[ $current_dir != / && ! -e $current_dir/.git ]]; then
    current_dir=$current_dir:h
  fi
  if [[ $current_dir != / ]]; then
       parent_dir=${current_dir%\/*}
       shorten_path=""
       if [[ $current_dir = $HOME ]]; then
          shorten_path=%~
       else
          shorten_path=$PWD
       fi
       path=${shorten_path#$parent_dir/}
  fi
  if [[ $PWD = $HOME ]]; then
    path=%~
  fi
  echo $path 
}

# export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[yellow]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
