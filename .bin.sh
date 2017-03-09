## COLORED MAN PAGES, needs env.sh part ##
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

## get battery %
battery() {
echo $(< /sys/class/power_supply/BAT0/capacity)
}

# upload files #

# example [code] transfer file1 file2 file3 [/code]
transfer() {
if [ $# -lt 1 ]; then
echo -e "Example: transfer file.zip file2.txt file3.jpg"
return 1
fi
myArray=( "$@" )
for arg in "${myArray[@]}"; do
tmpfile=$( mktemp -t transferXXX )
if tty -s; then
basefile=$(basename "$arg" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
curl --progress-bar --upload-file "$arg" "https://transfer.sh/$basefile" >> $tmpfile
else curl --progress-bar --upload-file "-" "https://transfer.sh/$arg" >> $tmpfile
fi
cat $tmpfile
rm -f $tmpfile
done
}
