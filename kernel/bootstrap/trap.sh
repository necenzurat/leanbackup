# this is trap, not the music genre but the nice handler

errorLogger() {
  MYSELF="$0"     # equals to my script name
  LASTLINE="$1"   # argument 1: last line of error occurence
  LASTERR="$2"    # argument 2: error code of last command
  yellow "$APP encountered an error at "${TIME}" in ${MYSELF}: line ${LASTLINE}: exit status of last command: ${LASTERR}\n"

  red "Aborting, removing lockfile."
}

# smooth end of script
function exitCleanup(){
  green "Cleaning up..."; 
  rm -rf ${lockfile}
  echo "Have a nice day!"
  exit 1
}



trap 'errorLogger ${LINENO} $?' 1 2 3 6
trap 'exitCleanup' EXIT