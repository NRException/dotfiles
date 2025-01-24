#Custom stuff

alias c=clear
alias tmk=tmux kill-server

gitall() {
    git add --all
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"
