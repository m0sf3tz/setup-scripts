#work
#alias rest="./mktarg.sh default_env apss tz boot rpm common"    
#alias modem="./mktarg.sh default_env mpss common" 
#alias cd..="cd .."   
#alias cd...="cd ../.."  
#alias cd....="cd ../../.."
#alias findn="find . -name"
#alias grepr="grep -r"
#alias swimake="./mktarg.sh default_env"
#alias sclean="git clean i-f -x; git clean -f -X; git clean -f -d; git reset --hard"
#alias setup_env="ctags -R; cscope -R"
#alias xc="xclip-copyfile"                                                                                           
#alias xp="xclip-pastefile"

#home
alias cd..="cd .."
alias gob="go build"
alias xc="xclip-copyfile"
alias xp="xclip-pastefile"
alias hide="PS1=\"\u$ \"" 
alias clean="rm \.*\.swp"
alias setup_env="ctags -R"
alias cd...="cd ../../"
alias cd....="cd ../../../"
alias grepc="grep -r -i --include \*.c"lias gob="go build"


mkgo(){
  mkdir "$1"
  cd "$1"
}

#go build FILE_NAME.go; ./FILE_NAME
gor(){
  go build "${@}"

  if [ $? -ne 0 ]; then
    echo "Failed to compile $1"
  else
    echo "Starting to run $1..."
    FILE_NAME=$(echo $1 | cut -d'.' -f1)
    ./"$FILE_NAME"
  fi
}

idf(){
  source ~/esp/esp-idf/export.sh
}
idf-mon(){
  idf.py flash; idf.py monitor
}

export TERM=screen-256color
conda_enable(){
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/sam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/sam/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/home/sam/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/sam/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}
