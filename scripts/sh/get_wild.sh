#!/bin/sh

#MUSIC_PATH="/tmp/GetWild.m4a"
MUSIC_PATH="/Users/smap7/tmp/Cartoon_Battle_Vadodara.mp3"

checkNoSleepCtrl()
{
  if [ ! -f $(which NoSleepCtrl) ]; then
    echo "Please install NoSleepCtrl from "
    echo "  https://github.com/integralpro/nosleep/releases"
    echo " "
    echo "Install it with CLI included in it. It's necessary to prevent"
    echo "your macbook from going to sleep when somebody closes the clamshell."
    echo "When you launch this script it will automatically turn the 'NoSleep'"
    echo "mode ON and when you exit the script with Ctrl-C, the 'NoSleep' mode"
    echo "will automatically be turned OFF."
    echo "(You are not required to be running it in the tray)"
    echo " "
    exit
  fi
}

forceVolume()
{
  local volume=$(osascript -e "(get volume settings)'s output volume")
  local muted=$(osascript -e "(get volume settings)'s output muted")
  while :; do
    NoSleepCtrl -a -s 1
    NoSleepCtrl -b -s 1
    osascript -e "set volume 100" # vol
    sleep 0.1
  done &
  local pid=$!
  trap "
    NoSleepCtrl -a -s 0
    NoSleepCtrl -b -s 0
    kill $pid
    osascript -e 'set volume output volume $volume'
    osascript -e 'set volume output muted $muted'
    exit
  " SIGINT
}

isClamshellOpen()
{
  [ $(
    ioreg -r -k AppleClamshellState -d 4 |
    grep AppleClamshellState |
    head -1 |
    cut -d = -f 2
  ) = Yes ]
}

getWildAndTough()
{
  # Check NoSleepCtrl available
  checkNoSleepCtrl

  # Init local variables
  local intrusion_detected=false
  local counter=0

  # Launch volume forcer
  forceVolume

  # Execution loop
  while :; do
    if $intrusion_detected || $(isClamshellOpen); then
      let counter=5
      say -v Otoya "爆破スイッチが起動されました"
      say -v Otoya "5秒後に爆発します"
      while [ $counter -gt 0 ]; do
        say -v Otoya $counter
        let counter-=1
        sleep 1
      done
      afplay $MUSIC_PATH
      intrusion_detected=true
    fi
    sleep 1
  done
}

getWildAndTough
