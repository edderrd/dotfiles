# detect operating system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

##
# Kill process by a port
##
function port-kill() {
    if [ -z "$1" ]; then
        echo "No port given to kill process";
    else
        sudo lsof -i ":$1" | awk '{print $2}' | grep -v PID | xargs kill -9
    fi
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

