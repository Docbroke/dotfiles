# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# to disable C-s blocking bash output
stty stop undef

## SOURCE ##
[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh
[[ -f ~/.env.sh ]] && source ~/.env.sh
[[ -f ~/.bin.sh ]] && source ~/.bin.sh
[[ -f ~/.prompt.sh ]] && source ~/.prompt.sh
source /usr/share/doc/pkgfile/command-not-found.bash

## wrap command lines, on terminal resize ##

# BASH OPTIONS {{{
shopt -s cdspell                 # Correct cd typos
shopt -s checkwinsize            # Update windows size on command
shopt -s histappend              # Append History instead of overwriting file
shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s extglob                 # Extended pattern
shopt -s no_empty_cmd_completion # No empty completion
#}}}
