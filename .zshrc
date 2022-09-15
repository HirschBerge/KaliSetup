
#Pasting this in at the beginning so any of my real aliases overwrite them
alias msfconsole='sudo msfconsole'
alias g++='/usr/bin/grc --colour=auto g++'
alias head='/usr/bin/grc --colour=auto head'
alias gcat='/usr/bin/grc --colour=auto cat'
alias make='/usr/bin/grc --colour=auto make'
alias ld='/usr/bin/grc --colour=auto ld'
alias ping6='/usr/bin/grc --colour=auto ping6'
alias tail='/usr/bin/grc --colour=auto tail'
alias traceroute6='/usr/bin/grc --colour=auto traceroute6'
alias blkid='/usr/bin/grc --colour=auto blkid'
alias common='/usr/bin/grc --colour=auto common'
alias df='/usr/bin/grc --colour=auto df'
alias diff='/usr/bin/grc --colour=auto diff'
alias dig='/usr/bin/grc --colour=auto dig'
alias du='/usr/bin/grc --colour=auto du'
alias env='/usr/bin/grc --colour=auto env'
alias fdisk='/usr/bin/grc --colour=auto fdisk'
alias findmnt='/usr/bin/grc --colour=auto findmnt'
alias free='/usr/bin/grc --colour=auto free'
alias gcc='/usr/bin/grc --colour=auto gcc'
alias getfacl='/usr/bin/grc --colour=auto getfacl'
alias id='/usr/bin/grc --colour=auto id'
alias ip='/usr/bin/grc --colour=auto ip'
alias ifconfig='/usr/bin/grc --colour=auto ifconfig'
alias ifc='/usr/bin/grc --colour=auto ifconfig'
alias iptables='/usr/bin/grc --colour=auto iptables'
alias iwconfig='/usr/bin/grc --colour=auto iwconfig'
alias jobs='/usr/bin/grc --colour=auto jobs'
alias last='/usr/bin/grc --colour=auto last'
alias log='/usr/bin/grc --colour=auto log'
alias lsattr='/usr/bin/grc --colour=auto lsattr'
alias lsblk='/usr/bin/grc --colour=auto lsblk'
alias lsmod='/usr/bin/grc --colour=auto lsmod'
alias lsof='/usr/bin/grc --colour=auto lsof'
alias lspci='/usr/bin/grc --colour=auto lspci'
alias mount='/usr/bin/grc --colour=auto mount'
alias netstat='/usr/bin/grc --colour=auto netstat'
alias nmap='/usr/bin/grc --colour=auto nmap'
alias php='/usr/bin/grc --colour=auto php'
alias ping='/usr/bin/grc --colour=auto ping'
alias ps='/usr/bin/grc --colour=auto ps'
alias sensors='/usr/bin/grc --colour=auto sensors'
alias ss='/usr/bin/grc --colour=auto ss'
alias sysctl='/usr/bin/grc --colour=auto sysctl'
alias systemctl='/usr/bin/grc --colour=auto systemctl'
alias tcpdump='/usr/bin/grc --colour=auto tcpdump'
alias traceroute='/usr/bin/grc --colour=auto traceroute'
alias tune2fs='/usr/bin/grc --colour=auto tune2fs'
alias ulimit='/usr/bin/grc --colour=auto ulimit'
alias uptime='/usr/bin/grc --colour=auto uptime'
alias vmstat='/usr/bin/grc --colour=auto vmstat'
alias whois='/usr/bin/grc --colour=auto whois'


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

export PATH=$PATH:/home/kali/.local/bin
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi




# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

configure_prompt() {
    prompt_symbol=㉿
    # Skull emoji for root terminal
    #[ "$EUID" -eq 0 ] && prompt_symbol=💀
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
            # Right-side prompt with exit codes and background processes
            #RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
            ;;
        oneline)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
        backtrack)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
    esac
    unset prompt_symbol
}

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    configure_prompt

    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}


#   ________   ______   __    __  _______    ______
#  /        | /      \ /  |  /  |/       \  /      \
#  $$$$$$$$/ /$$$$$$  |$$ |  $$ |$$$$$$$  |/$$$$$$  |
#      /$$/  $$ \__$$/ $$ |__$$ |$$ |__$$ |$$ |  $$/
#     /$$/   $$      \ $$    $$ |$$    $$< $$ |
#    /$$/     $$$$$$  |$$$$$$$$ |$$$$$$$  |$$ |   __
#   /$$/____ /  \__$$ |$$ |  $$ |$$ |  $$ |$$ \__/  |
#  /$$      |$$    $$/ $$ |  $$ |$$ |  $$ |$$    $$/
#  $$$$$$$$/  $$$$$$/  $$/   $$/ $$/   $$/  $$$$$$/

setopt nonomatch
setopt appendhistory
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

autoload -Uz compinit;compinit -i
#             __  __
#            /  |/  |
#    ______  $$ |$$/   ______    _______   ______    _______
#   /      \ $$ |/  | /      \  /       | /      \  /       |
#   $$$$$$  |$$ |$$ | $$$$$$  |/$$$$$$$/ /$$$$$$  |/$$$$$$$/
#   /    $$ |$$ |$$ | /    $$ |$$      \ $$    $$ |$$      \
#  /$$$$$$$ |$$ |$$ |/$$$$$$$ | $$$$$$  |$$$$$$$$/  $$$$$$  |
#  $$    $$ |$$ |$$ |$$    $$ |/     $$/ $$       |/     $$/
#   $$$$$$$/ $$/ $$/  $$$$$$$/ $$$$$$$/   $$$$$$$/ $$$$$$$/


alias findflags='find /home -name *flag* -exec cat {} +'
alias findsuid='find / -type f -perm -04000 -ls 2>/dev/null'
alias ping='grc ping'
alias nmap='sudo grc nmap --open -n '
alias pcat='pwncat-cs'
alias -g sorts='sort | uniq -c | sort -n'
alias du='~/.scripts/dudu'
alias mp4renm='~/.scripts/setname'
alias musicplay='~/.scripts/musicplay'
alias renames="~/.scripts/rename"
alias -g web='~/.scripts/yt'
alias lsblk='clear && lsblk'
alias r='ranger'
alias hydra='sudo hydra -e nsr'
alias hdparm='sudo hdparm'
alias -g G='| grep -i --color=auto'
alias -s {txt,list,log}='vim'
alias -s {mp4,mkv,mp3}='mpv'
alias -s {jpg,png}='sxiv'
alias -s {pdf,epub}='zathura'
alias -s {doc,docx}='wps'
alias speedtest='speedtest-cli'
alias mpv='mpv --fs=yes'
alias zshrc='editZsh'
alias dtop='cd ~/Desktop && exa --group-directories-first -l'
alias dloads='cd ~/Downloads'
alias vi='nvim'
alias x='exit'
alias c='clear'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 777='chmod -R 777'
alias 755='chmod -R 755'
alias 775='chmod -R 775'
alias 600='chmod -R 600'
alias dd='dd status=progress'
alias ll='clear && exa --group-directories-first -l --icons'
alias la="clear && exa --group-directories-first -la --icons"
alias ls="clear && exa --icons"
alias rscp='rsync -rah --progress --ignore-existing'
alias intensemap=' nmap --open -n -A -T4 -v'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias c='clear'
alias find='time find'
alias grep='grep -i --color=auto'
alias mv='mv -i'
alias cp='pycp -i'
alias hi='echo "Hello there $USER"| lolcat'
alias python="python3"
alias pip="pip3"
alias ytplaylist='youtube-dl -i -f mp3 --yes-playlist --add-metadata'
alias bat='batcat'
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias YT="youtube-viewer"
alias shutdown='umount -R /mnt/ && sudo shutdown -h now'
alias sdn="sudo shutdown -h now"
alias f="$FILE"
alias e="nvim"
alias v="nvim"
alias xr="sudo xbps-remove -R"
alias xq="xbps-query"


# Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="gi merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'
alias nrs='sudo npm run serve'


# key bindings





#  $$$$$$$$\ $$\   $$\ $$\   $$\  $$$$$$\$$$$$$$$\$$$$$$\  $$$$$$\  $$\   $$\  $$$$$$\
#  $$  _____|$$ |  $$ |$$$\  $$ |$$  __$$\__$$  __\_$$  _|$$  __$$\ $$$\  $$ |$$  __$$\
#  $$ |      $$ |  $$ |$$$$\ $$ |$$ /  \__| $$ |    $$ |  $$ /  $$ |$$$$\ $$ |$$ /  \__|
#  $$$$$\    $$ |  $$ |$$ $$\$$ |$$ |       $$ |    $$ |  $$ |  $$ |$$ $$\$$ |\$$$$$$\
#  $$  __|   $$ |  $$ |$$ \$$$$ |$$ |       $$ |    $$ |  $$ |  $$ |$$ \$$$$ | \____$$\
#  $$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$\  $$ |    $$ |  $$ |  $$ |$$ |\$$$ |$$\   $$ |
#  $$ |      \$$$$$$  |$$ | \$$ |\$$$$$$  | $$ |  $$$$$$\  $$$$$$  |$$ | \$$ |\$$$$$$  |
#  \__|       \______/ \__|  \__| \______/  \__|  \______| \______/ \__|  \__| \______/



changetarget(){
  newip=$1
  sed -r 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/"$newip"/ -i ~/.zshrc
  echo -en "Changed target to $newip\n"
  sourceZsh
}
export TARGET="10.10.121.169"



shadowy(){
  unshadow passwd shadow > passwords.txt
  john --wordlist=/usr/share/wordlists/rockyou.txt passwords.txt

}

mkd(){
  mkdir -pv $@
  cd $@
}

filesys(){
	clear
	echo -n "Drive:\t\t     FileSystem:   Size: Used: Avl:  Use:  Mount Point\n"
	sudo df -hT |grep -v tmp | grep -v File | grep "nfs\|ext4"| sort -nrk 6
}


qnfo(){
	grc --colour=auto ping -c 3 $1
	grc --colour=auto traceroute $1
	grc --colour=auto nmap -sT $1

}



open(){
        opout $1
        nvim $1
	rm *.bbl *.log *.run.xml *.blg *.bcf *.aux *.toc *.out
}
lat(){
        pdflatex $1.tex ; biber $1 ; pdflatex $1.tex
}


fullcommit(){
        ga
        gcm $1
        gp
}


 ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


sourceZsh(){
    source ~/.config/zsh/.zshrc
#    backupToGitHub ~/.zshrc
    echo "New .zshrc sourced."
}

editZsh(){
    nvim ~/.config/zsh/.zshrc
    source ~/.config/zsh/.zshrc
#    backupToGitHub ~/.zshrc
    echo "New .zshrc sourced."
}



pingMon(){
	echo -e " There has been `ping $1 -c $2 G "packet loss" | awk '{ print  $6, $7, $8 }'` to $1"
}







mn(){
	man -k . | dmenu -fn "MeslosLGS NF" -l 30 | awk '{print $1}' | xargs -r man -Tpdf | zathura -
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#   ________   ______   ________
#  /        | /      \ /        |
#  $$$$$$$$/ /$$$$$$  |$$$$$$$$/
#  $$ |__    $$ |  $$ |$$ |__
#  $$    |   $$ |  $$ |$$    |
#  $$$$$/    $$ |  $$ |$$$$$/
#  $$ |_____ $$ \__$$ |$$ |
#  $$       |$$    $$/ $$ |
#  $$$$$$$$/  $$$$$$/  $$/t

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export TUNIP=$(ifconfig| grep -A 1 "tun0" |grep "inet " | awk '{print $2 }')
export LOCIP=$(ifconfig| grep -A 1 "eth0" |grep "inet " | awk '{print $2 }')
export PAYPORT="6969"
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
alias vpns='sudo openvpn Documents/Hirschels.ovpn'
vpnconnected=$(ifconfig |grep ": f" |awk -F":" '{ print $1 }' |grep "tun0")
if [ -z "$vpnconnected" ]
then
	vpns
else
	echo "Already connected to vpn..."
fi
eval "$(starship init zsh)"
