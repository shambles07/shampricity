#NEW MIX

function eanniv --d "Madie 'n me."
	set -l ANNI 1474101800
	# date --date="@$ANNI"
	set -l TIMETIL (math $ANNI - (date +%s) | sed 's/-//g')
	printf "\n" ; and figlet -c -t -f 4max (echo "DATING "(math $TIMETIL / 24 / 60 / 60) DAYS ); and printf "\n"
end
#FILE CREATION FOR CODE

function filemake --description "Use [name] [ext] to create an executable file."
    touch $argv[1].$argv[2]
    sudo chmod +x $argv[1].$argv[2]
end

function awker --description "Create .awk file with $1."
    touch $argv.awk
    sudo chmod +x $argv.awk
end

function cmd --description "Create .sh file with $1."
    touch $argv.sh
    sudo chmod +x $argv.sh
end

function mkc --description "Create .c file with $1."
    touch $argv.c
    sudo chmod +x $argv.c
end

function pyn2 --description "Create .py file with $1."
	touch $argv.py
	chmod +x $argv.py
end

#SHORTCUT CMDS

function - --d "Warp to $OLDPWD."
	cd -
end

function .. --d "Back up one."
	cd ..
end

function ... --d "Back up two."
	cd ../..
end

function .... --d "Back up three."
	cd ../../..
end

function calc --description "Open new Calc document or file."
    scalc.exe $argv
end

function firefox --description "Open Firefox, or a file in it."
    firefox.exe $argv
end

function cdd --description "Jump back two directories"
    cd ..; and cd ..
end

function cl --description "Clear screen shortcut."
    clear $argv
end

function dis --description "Display image using ImageMagick."
	display $argv
end

function note --description "Open a file in notepad++."
	notepad++.exe $argv
end

function paint --description "Open Microsoft Paint."
	mspaint.exe $argv
end

function writer --description "Open new Writer document or file."
    swriter.exe $argv
end

function xdt --description "Xdotool shortcut."
    xdotool $argv
end

#TAR CMDS
function targz --description "Create a tar.gz archive."
	tar -cvzf $argv.tar.gz $1
end

function tarview --description "View the contents of a tar.gz archive."
	als $argv
end

function extargz --description "Extract a tar.gz archive."
	tar -xvzf $argv.tar.gz
end

function targzadd --description "Add a file to a tar.gz archive."
	gunzip $argv[1].tar.gz
	tar -rvf $argv[1].tar $argv[2]
	tar -tvf $argv[1].tar
	gzip $argv[1].tar
end

function maketar --description "Make a tar.gz from a directory."
	tar cvzf $argv.tar.gz  $argv 1>/dev/null; and l | grep $argv
end

#TELNET/CURL CMDS

function chm --description "Check local weather."
    curl wttr.in
end

function chw --description "Check Chicago weather using curl."
    curl wttr.in/chicago
end

function excuses --description "Excuses for why you cannot connect to this host!"
    telnet bofh.jeffballard.us 666
end

function freechess --description "Play chess in a terminal!"
    telnet freechess.org
end

function lessnet --description "List of telnet capable hosts with a variety of features."
    less $HOME/.telnet
end

function moon --description "TTY moon phase information."
    curl wttr.in/Moon
end

function moon-custom --description "Enter a date: e.g. 2016-May-07 for the night's moon phase."
    clear ; echo -e "\n" ; echo -e "\nWelcome to the custom moon phaser!"
    echo -e "\nEnter a year in 4-digit format:"
    read -l YEAR
    echo -e "\nType a month in the format May, Mar, Jun, etc."
    read -l MON
    echo -e "\nInput a 2-digit day of the month."
    read -l DAY
    clear
    curl wttr.in/Moon@$YEAR-$MON-$DAY
end

function starwars --description "Watch the first half of A New Hope in ASCII!"
    telnet towel.blinkenlights.nl 23
end

function telehack --description "Multifunctioned telnet environment."
    telnet telehack.com $argv
end

function weather --description "Check weather via website telnet interface."
    telnet rainmaker.wunderground.com
end

#PC INFO COMMANDS

function memf --description "Print RAM available in both MB and B. (Endless Loop)"
    while true
    clear
    echo "Free RAM in MB and Bytes:"
    echo (math (awk '/MemFree/{print $2}' /proc/meminfo) / 1024) MB
    echo (awk '/MemFree/{print $2}' /proc/meminfo) Bytes
    sleep 1
    end
end

function up --description "See computer uptime. (Endless Loop)"
    while true
    clear
    echo "Current Uptime:" (uptime | awk '{print $1}')
    sleep 0.5
    end
end

#COMMON CMDS+SHORTCUTS

function l --description "ls -l, but without showing user or group ownership (human readable)."
    ls -gGlh $argv
end

function ll --description "ls -lh"
    ls -lh $argv
end

function lsd --description "ls with directories first."
    ls --group-directories-first $argv
end

function md --description "Make new directory, creating whole structure if needed."
    mkdir -p $argv
end

function n --description "Nano shortcut."
	nano $argv
end

function where
    type -a $argv
end

function wiz
    whereis $argv
end

#TERMINAL COMMANDS

function nbash --description "Open a new tab in Bash. (XDT)"
    xdotool key ctrl+shift+t
    xdotool keyup ctrl+shift+t
    xdotool type bash
    xdotool keydown Return
    xdotool keyup Return
    xdotool type clear
    xdotool key Return
    xdotool keyup Return
end

function new --description "Open a new terminal tab. (XDT)"
    xdotool key ctrl+shift+t; xdotool keyup ctrl+shift+t
end

function nroot --description "Open a new term tab as root. (XDT)"
    xdotool key ctrl+shift+t
    xdotool keyup ctrl+shift+t
    xdotool type 'su root'
    xdotool keydown Return
    xdotool keyup Return
    xdotool type Werebotion1!
    xdotool keydown Return
    xdotool keyup Return
    xdotool type clear
    xdotool key Return
    xdotool keyup Return
end

#PACKAGE MANAGEMENT

function pacmans --description "Equivalent to pacin, runs pacman -S $1 for installing from Arch Repos."
    sudo pacman -S $argv
end

function paq --description "Query version information of a package."
    sudo pacman -Q
end

function paqi --description "Full query information on a package, same as pacloc."
    sudo pacman -Qi
end

#XDOTOOL  OTHER

function rdolph --description "Activate Dolphin window in background. (XDT)"
    xdt search "Dolphin" windowactivate --sync mousemove --restore
end

function selectall --description "Select all by clicking M1 3x. (XDT)"
    xdt click --repeat 3 1
end

#FUNCTION HELPERS

function ctxt --description "Open file that shows how to create colorful text in commands."
    less /home/shambi07/Documents/PC-Info+Help/.colortext
end

#MATH  COMMANDS

function sumof --description "Get sum of all numbers in a file. (perl)"
    math (perl -nle '$sum += $_ } END { print $sum' $argv)
end

#GPG ENCRYPTION

function gpgen --description "Generate a GPG Key."
    gpg --gen-key
end

function degpg --description "Decrypt a GPG file."
    gpg --decrypt-file $argv
end

function engpg --description "Encrypt a GPG file."
    gpg --default-recipient-self --encrypt-files $argv
end

function gpgl --description "List GPG Keys in keyring."
    gpg --list-keys
end

#FISH HELPERS

function alldesc
    desc --all | grep -v The | awk '{print $1}'
end

function bfish --description "Open the myfunctions.fish file with Nano."
    nano -w $HOME/.config/omf/myfunctions.fish
end


function cfish --description "Pipe the myfunctions.fish file through less."
    less $HOME/.config/omf/myfunctions.fish
end

function ccfish -d "Run cat on myfunctions.fish boi!"
		cat $HOME/.config/omf/myfunctions.fish
end

function nfish --description "Edit fish.nanorc with nano."
    nano -w $HOME/.nano/fish.nanorc
end

function desc --description 'Print the description of a Fish function.'

  # Check that $argv is not empty
  if test (count $argv) -eq 0;
    desc desc;
    printf 'Usage: desc { --all | function }\n'
    return 1
  end

  # Do we want to print *all* descriptions?
  if test $argv = '--all'
    for f in (functions | sed -E 's/(.*), /\1\n/g')
      desc $f;
    end;
    return 0

  else
    # Check that $argv is indeed a Fish function
    if not functions -q $argv
      printf '"%s" is not a function.\n' $argv
      return 1
    end

    # Check that the function has a description
    if not functions $argv | grep -q -e 'function '$argv' .*--description'
      printf 'The function "%s" has no description.\n' $argv
      return 2
    end

    # Print description
    printf '%s\t- %s\n' $argv (functions $argv | \
      grep 'function '$argv'.*--description' | sed -E "s|.*'(.*)'.*|\1|")
  end
end

function fishrc --description "Get new functions from myfunctions.fish to be added to the .nanorc file."
    echo (alldesc | sed 's/"//g') | sed 's/\s/|/g' > $HOME/.newfish
    cd $HOME
    cat $HOME/.newfish >> $HOME/.nano/syntax/fish.nanorc
    nano -w $HOME/.nano/syntax/fish.nanorc &
end

function gofish --description "Open myfunctions.fish directory ($HOME/.config/omf/)."
    cd /home/shambi07/.config/omf/
    pwd
end

function addrc --description "Use this to append the resuls of fishrc to the fish.nanorc file."
    #echo "#" >> $HOME/.nano/syntax/fish.nanorc
    /usr/bin/kate $HOME/.fishfunc*
    /usr/bin/kate $HOME/.nano/syntax/fish.nanorc
    # (ls -lAgG /home/shambi07/ | grep .fishfunc | awk \'\{\print \$7}\') >> $HOME/.nano/syntax/fish.nanorc
end

function nconf --description "Open config.fish with nano."
    nano /usr/share/fish/config.fish
end

function soursh --description "Source the myfunctions.fish file after editing."
    source $HOME/.config/omf/myfunctions.fish
end

function z -d "jump around"
	cd (bash -c "source $Z_SCRIPT_PATH; _z $argv; echo \$PWD")
end

