# Load version control information
autoload -Uz vcs_info
precmd() {
    vcs_info
    if [[ -n $vcs_info_msg_0_ ]]; then
        if [[ -n "$(git status --porcelain)" ]]; then
            # Check if there are merge conflict markers in any file
            if [[ $(git status | grep "Unmerged paths") ]]; then
                vcs_info_msg_0_=" %F{red}${vcs_info_msg_0_}%f"
            else
                vcs_info_msg_0_=" %F{yellow}${vcs_info_msg_0_}%f"
            fi
        else
            vcs_info_msg_0_=" %F{green}${vcs_info_msg_0_}%f"
        fi
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b)'
# zstyle ':vcs_info:*' unstagedstr '%F{yellow}'
# zstyle ':vcs_info:*' stagedstr '%F{yellow}'

setopt PROMPT_SUBST

#change the PROMPT look
prmt='%B%1~%b${vcs_info_msg_0_} %# '
#prmt='[%B%1~%b${vcs_info_msg_0_}]> '

PROMPT=$prmt

RPROMPT='%t'

#Seting colors
export CLICOLOR=1
#export LSCOLORS=Gxfxcxdxbxegedabagacad
#export LSCOLORS=GxFxcxdxbxegedabagacad
export LSCOLORS=ExFxCxDxBxegedabagacad
alias ls='ls -p'


# Aliases
# useful aliases
alias cls='clear'
alias ll='ls -al'
