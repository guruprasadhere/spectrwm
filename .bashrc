PS1="\u\w\\$ "
if [[ -z "$DISPLAY" ]]
then
    DISPLAY=":0"
    export DISPLAY
fi
