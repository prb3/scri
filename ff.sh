[ $# -eq 0 ]&&{ h h ff;exit;};cf0 cwd pwd -P;eval "$LO2";lo2 is/a.o1
is "$1" '.*'&&! is "$1" '..*'&&{ lo2 relp;cf0 p relp "$1"&&set -- "$p" "${@:2}";}
gp(){ local f;is "$1" '/*'&&{ [ -e "$1" ]&&{ echo "$1";return 0;};return 1;};cf0 f o1 "$1";is f&&echo "$f"||return 1;}
is "$1" '..*'&&{ lo2 f5.f6;q="${1#..}";q="${q:-~}";! is "$q" '*[~?/]'&&q="$q?";cf0 - ls -Ap -- f6 "$q" -- f5 "ff ./{r} $2";exit;}
case $2 in v*)op="${2#v}";t="$FW/ftmp/vflow";case $op in f*)file="$1";args="${op#f}";args="${args# }";;s)ext="${1:-txt}";cat>"$t.$ext";file="$t.$ext";;p)dir="${1:-.}";file=$(ls "$dir"|fzf --preview='bat --color=always {}' 2>/dev/null)&&file="$dir/$file";;esac;[ -f "$file" ]&&{ cf0 cmd awk -v e="${file##*.}" '{split($1,a,","); for(i in a) if(a[i]==e){$1=""; sub(/^ +/,""); print; exit}}' "$UT/ffv.txt";is cmd&&eval "${cmd//\{\}/$file}${args:+ $args} </dev/tty";};;
d)cf0 f gp "$1"||exit 0;trash-put "$f"&&fnp e "$f" d;;
r*)n="${2#r}";cf0 f gp "$1"||exit 0;b="${f##*/}";! is "$n" '*.*' && is "$b" '*.*' && n="$n.${b##*.}";mv "$f" "${f%/*}/$n"&&fnp e "$f" "r$n";;
m*)t="${2#m}";lo2 hf;cf0 d hf "$t" -;[ -d "$d" ]||exit 0;cf0 f gp "$1"||exit 0;mv "$f" "$d/"&&fnp e "$f" "m$d/${f##*/}";;
z*)cf0 f gp "$1"||exit 0;t=${2#z};if [[ $f == *.tar*||$f == *.zip ]];then b=${f##*/};b=${b%.*};b=${b%.tar};d=./${b};[ -e "$d" ]&&{ read -p "cover?y/n " c;[[ $c != [yY] ]]&&exit 0;rm -rf "$d";};mkdir -p "$d";if [[ $f == *.zip ]];then unzip -q "$f" -d "$d";else tar xf "$f" -C "$d";fi;else o=${t:-${f##*/}.tar.xz};tar caf "$o" "$f"||{ echo "<2";exit 1;};fi;;
-)if is "$1" '/*';then f="$1";else f="$cwd/${1}";! is "$1" '*.*'&&f="$cwd/$1.txt";fi;cat>"$f";fnp e "$f" n;;
*)is "$1" '*/'&&{ mkdir -p "$cwd/${1%/}";exit 0;};if is "$1" '/*';then f="$1";[ -d "$f" ]&&{ nvim "$f";exit 0;};else f="$cwd/${1}";! is "$1" '*.*'&&f="$cwd/$1.txt";fi;:>>"$f";nvim "$f";fnp e "$f" n;;esac
