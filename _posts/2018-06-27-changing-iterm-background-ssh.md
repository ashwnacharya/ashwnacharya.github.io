---
layout: post
title:  "Change iterm backgrounds when you SSH into different terminals"
date:   2018-06-27 12:00:00 +0530
---

[Oh my zsh!](https://github.com/ohmyzsh/ohmyzsh) is awesome.

This is my favourite oh my zsh trick. 
All too often, you almost type the command in the wrong window. 
This can be disastrous when working with different environments. 

I want to change the background of my terminal whenever I ssh into production machines.

With oh my zsh you can create a file called `~/.oh-my-zsh/custom/iterm2-ssh.zsh` like so:

```
function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  # if you have trouble with this, change
  # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ $* == dev* ]]; then
            tabc Dev
        elif [[ $* == stg* ]]; then
            tabc Stage
        elif [[ $* == beta* ]]; then
            tabc Beta
        elif [[ $* == prod* ]]; then
            tabc Prod
        else
            tabc Default
        fi
    fi
    ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"
```


Here Dev, Beta, Stage, Prod are different environments.

I have corresponding themes created in my iterm.

Basically the ssh command is aliased to a shell function called colorssh which changes the theme based on whichever environment I ssh to.
Not my invention, this trick. I read it somewhere but I have been using this for ages.