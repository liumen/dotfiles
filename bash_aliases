alias Gcommit='git commit'
alias Gpush='git push'

alias rm='$HOME/.bin/safe_rm.sh'
alias RM='/usr/bin/rm'
alias dropbox='dropbox-cli'
alias cmake='cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=YES'
alias mk='make -j$(nproc --all)'
alias oct='octave-cli'
alias vim='vim --servername vim' #necessary for vimtex backward search
alias weather='curl wttr.in/kitchener'
# alias tmux='tmux -2'
alias yay='yay --mflags --skipinteg'

alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias niagara='ssh -Y q47wu@niagara.computecanada.ca'
alias graham='ssh -Y q47wu@graham.computecanada.ca'
alias mount-graham="sshfs q47wu@graham.computecanada.ca:. $HOME/Remote/"

if [[ `uname -s` == "Linux" ]] 
then
  alias l='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l -N -F'
  alias ls='ls $LS_OPTIONS -A -N -hF'
elif [[ `uname -s` == "Darwin" ]]
then
  alias l='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l -F'
  alias ls='ls $LS_OPTIONS  -hF'
  alias g++='g++-10';
fi


if [[ -f .bash_aliases.local ]]; then
  . .bash_aliases.local
fi

