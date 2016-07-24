#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# PROMPT="%f%F{cyan}[%n@%m %d]%f
# ¶(⁄•˅̮•∖)⁋ ❯ "

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$PATH:$PATH
export MANPATH="/usr/local/man:$MANPATH"
PATH=$PATH:~/local/bin
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PATH=$PATH:~/local/bin
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
LS_COLORS='rs=0:di=36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=35:*.jpeg=01;35:*.gif=35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=35:*.svg=35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
GREP_OPTIONS="--color=always"; export GREP_OPTIONS
export TREE='-C'
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# ===== git
alias gb="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/"
alias gc="git clone"
alias gcm="git commit -m"
alias gdb="git branch -D"
alias gbd="git branch -D"
alias delete="git branch -D"
alias ch="git checkout"
alias co="git checkout"
alias chpeco='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias copeco='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias checkout="git checkout"
alias checkoutpeco='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias push="git push origin"
alias gg="git grep"
alias gs="git status"
alias com="git checkout master"
alias chm="com"
alias master="com"
alias gcom="com"
alias gpom="git push origin master"
alias gphm="git push heroku master"
alias pull="git pull"
alias gr="git reset"

# unix commands
alias k="kill -9"
alias cl="clear"
alias ctags="`brew --prefix`/bin/ctags"

# mac commands
alias pc="pbcopy"

# vagrant
alias vs="vagrant ssh"

# ruby
alias rb="ruby"
alias bi="bundle install"
alias be="bundle exec"
alias pr="pry-remote"
alias powres="powder restart"
alias pres="powres"
alias powlog="powder log"

alias cd..="cd ../"
alias c="cd"
alias c.="cd ../"
alias c..="cd ../../"
alias psa="psaux"
alias psaux="ps aux | grep"
alias k="kill -9"
alias myip="ifconfig | grep 192"
alias ls='/usr/local/bin/gls -F --group-directories-first --color=auto' # color=auto
alias lsltr='/usr/local/bin/gls -Fltr --group-directories-first --color=auto' # color=auto
alias z="v ~/.zshrc"
alias zr="v ~/.zshrc"
alias vr="v ~/.vimrc"
alias v="vim"
alias mvim="open -a MacVim"
alias l="ls"
alias lsa="ls -a"
alias lsla="ls -la"
alias s="szsh"
alias szsh="source ~/.zshrc && exec -l $SHELL"
eval "$(rbenv init -)"
function chpwd() {
  ls
}
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
# git checkout peco
function gcopeco() {
    git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`
}

# gitpeco
function gp() {
    echo `git ls-files | peco`
}

# gitbranchpeco
function gitbranchp() {
    echo `git branch | peco`
}

# vimgitpeco
function vg() {
    vim `git ls-files | peco`
}
alias vv='vg'

# vimpeco
function vp() {
    vim `find . -name "*" | peco`
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
source /usr/local/opt/nvm/nvm.sh

alias sl="/usr/local/bin/sl"

# クイズを出す
ruby ~/Codes/shell-quiz/main.rb

# load private config
source ~/Codes/dotfiles/.zshrc-private
