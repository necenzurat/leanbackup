include () {
    [[ -f "$1" ]] && source "$1"
}


#todo, not working on VAR='--meh'
envloader () {
    if [ -f $1 ];then
        export $(cat $1 | sed 's/#.*//g' | xargs)
    fi
}
