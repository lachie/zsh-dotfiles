PROMPT='%F{yellow}%2c$(git_prompt_info)
>%f '
RPROMPT='%F{blue}$(rvm_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}+%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""