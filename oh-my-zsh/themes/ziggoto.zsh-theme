PROMPT='%{$fg_bold[green]%}fabio@gw%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$VI_MODE$(git_prompt_info)%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[yellow]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})%{$reset_color%}"
