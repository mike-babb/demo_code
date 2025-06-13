alias ll="
echo '---- WORKING DIRECTORY ----------------------------------------------';
pwd;
show_directories;
show_hidden_directories;
show_files;
show_hidden_files;
show_symbolic_links;
echo '---- WORKING DIRECTORY ----------------------------------------------';
pwd;
"


function show_directories () {
    # show directories
    local n_dirs=$(ls -lFhpX | grep "^d"  | wc -l)    
    if test $n_dirs -gt 0        
    then     
    echo '---- DIRECTORIES ----------------------------------------------------'
    ls -lFhpXd */ --color=always
    fi
}

function show_hidden_directories () {
    # show hidden directories
    local n_hidden_dirs=$(ls -lhpdAXF --color=always | grep '^d.* \.' --color=never | wc -l)
    if test $n_hidden_dirs -gt 0
    then    
    echo '---- HIDDEN DIRECTORIES ----------------------------------------------'
    ls -lhpdAXF --color=always | grep '^d.* \.' --color=never 
    fi
}

function show_files () {
    # show files
    local n_files=$(ls -lhpXF | grep '^-' | wc -l)
    if test $n_files -gt 0
    then 
    echo '---- FILES -----------------------------------------------------------'
    ls -lhpF --color=always | grep '^-' --color=never
    fi
}

function show_hidden_files () {
    # show hidden files
    local n_hidden_files=$(ls -lhpAXF --color=always | grep '^-.* \.' --color=never | wc -l)
    if test $n_hidden_files -gt 0
    then 
    echo '---- HIDDEN FILES ----------------------------------------------------'
    ls -lhpAXF --color=always | grep '^-.* \.' --color=never
    fi
}

function show_symbolic_links () {

    # show symbolic links    
    local n_links=$(ls -lhpAXF --color=always | grep '^l' --color=never | wc -l)    
    if test $n_links -gt 0        
    then     
    echo '---- SYMBOLIC LINKS --------------------------------------------------'
    ls -lhpAXF --color=always | grep '^l' --color=never    
    fi
}


# Bash aliases
alias .='cd .'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias bashclear='echo "" > ~/.bash_history'
alias cls='clear'
alias ls='ls -F --color=auto --show-control-chars'
alias ll.='ls -la'
alias lls='ls -la --sort=size'
alias llt='ls -la --sort=time'


# functions for automating git
function cool_time(){
local my_time=$(date +"%Y_%m_%d_%H_%M_%S")
echo $my_time
}

function do_a_commit(){
    local c_msg=""
    if [ $# -gt 0 ]
    then
        c_msg+="$*"
    else
        c_msg+="interim checkin "
    fi

    c_msg+=" "$(cool_time)

    git add -A;
    git commit -m "${c_msg}"
    git pull;
    git push;
}

function try_it(){
    
    local output_text=""
    if [ $# -gt 0 ]
    then 
        output_text+="$*"
    else
        output_text+="interim checkin"
    fi
    output_text+=" "$(cool_time)
    echo $output_text
}


