# I ♥ my bash prompt
PS1='\[\e[0;31m♥ \e[0;91m\]\W \[\e[0;35m\]❯\[\e[0m\] '

# Allows you to cd into directory merely by typing the directory name
shopt -s autocd 

e () { emacs "$@" & disown; }

alias stripescapes='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias paravim="clojure -Sdeps "{:deps {paravim {:mvn/version \""RELEASE\""}}}" -m paravim.start"
alias e="emacsclient -t --socket-name=/tmp/emacs1000/server"
