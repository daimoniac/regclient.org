#!/bin/sh

args="$@"
opt_a=0
opt_c=2
opt_d=1
opt_f="$(dirname $0)/../../static/casts/regctl-demo.cast"
opt_r=0
opt_s=10

while getopts 'acdfhrs:' option; do
  case $option in
    a) opt_a=1;;
    c) opt_c="$OPTARG";;
    d) opt_d="$OPTARG";;
    f) opt_f="$OPTARG";;
    h) opt_h=1;;
    r) opt_r=1;;
    s) opt_s="$OPTARG";;
  esac
done
set +e
shift `expr $OPTIND - 1`

if [ $# -gt 0 -o "$opt_h" = "1" ]; then
  echo "Usage: $0 [opts]"
  echo " -a: automatically continue without waiting for enter"
  echo " -c sec: time in seconds to wait before clearing the screen"
  echo " -d sec: time in seconds to wait after a command finishes"
  echo " -f filename: asciinema file to write"
  echo " -h: this help message"
  echo " -r: run the demo"
  echo " -s bps: speed (default $opt_s)"
  exit 1
fi

slow() {
  echo -n "\$ "
  sleep "$opt_d"
  echo -n "$@" | pv -qL $opt_s
  if [ "$opt_a" = "0" ]; then
    read lf
  else
    sleep "$opt_d"
    echo
  fi
}

if [ "$opt_r" = "0" ]; then
  printf '\e[8;26;100t' # set window size to 100x26
  # relaunch script inside of asciinema with -r (run) option
  asciinema rec "$opt_f" -i 3 --overwrite -c "$0 -r $args"
else
  cd "$(dirname $0)"
  clear
  # read lines of the script
  while IFS= read -r line <&3 || [ -n "$line" ]; do
  # if continuing a line, add prefix
  if [ -n "$multi_line" ]; then
    line="$(echo "$multi_line\n$line")"
    multi_line=""
  fi
  if [ "$line" != "${line#\#}" ]; then
    # comment to display only
    slow "$line"
  elif [ -z "$line" ]; then
    # on empty lines, clear the screen after a delay
    sleep "$opt_c"
    clear
  else
    # command to run
    if [ "$line" != "${line%\\}" ]; then
      # trailing backslash, set multi_line to be processed later
      multi_line="${line}\\"
    else
      # display command and run it
      slow "$line"
      eval "$line"
      echo # add a linefeed between commands
    fi
  fi
  done 3< "regctl-demo-script.sh"
  # cleanup
  rm -r busybox
fi
