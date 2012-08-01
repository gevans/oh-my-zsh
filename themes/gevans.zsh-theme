# PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

typeset -A host_repr

# translate hostnames into shortened, colorcoded strings
host_repr=('gabriels-imac.lv.cox.net' "%{$fg_bold[blue]%}imac"
           'Chriss-Mac-Pro.local'     "%{$fg_bold[blue]%}mac-pro"
           'gevans-laptop'      "%{$fg_bold[blue]%}vaio")

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# user part, color coded by privileges
local user="%(!.%{$fg[blue]%}.%{$fg[blue]%})%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
local host="@${host_repr[$(hostname)]:-$(hostname)}%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[magenta]%}%c%{$reset_color%}"

if [ -s ~/.rvm/scripts/rvm ] ; then
  source ~/.rvm/scripts/rvm

  local rvm_ruby="%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}"
fi

ZSH_THEME_GIT_PROMPT_PREFIX='['
ZSH_THEME_GIT_PROMPT_SUFFIX=']'

PROMPT='${time} ${user}${host}:${pwd} $(rbenv version-name)
$(git_prompt_info) %% '
