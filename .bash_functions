#!/bin/bash
function btc()
{
	btc1=( $(curl -s http://api.bitcoincharts.com/v1/markets.json | json_pp | grep -e 'USD' -e 'avg\" : [1-7]..[.]' | grep -v -e 'symbol' -e 'curr' |  sort | uniq | grep -o '[[:digit:]]..[.]' | sed 's|[.]||g' | awk '{ sum+=$0 ; print sum , NR}' | tail -1 ) )
	clear
	echo -e "\n\nDaily BTC Average: \n\n$(( ${btc1[0]} / ${btc1[1]} )) USD = 1 BTC\n\n"
}
function nnline() # USE STDIN $1 AND $2 FOR FILE AND NUM OF CHARS PER NEWLINE
{
	sed -e "s/.\{$2\}/&\n/g" $1
}
function ffind() # FIND (CASE INSENSITIVE) FROM ROOT EXCLUDING CYGDRIVE
{
	find /bin /dev /etc /home /lib /mnt /proc /sbin /srv /tmp /usr /var -iname "$1"
}
function stg() # GET THE FIRST CHARACTER FROM EACH WORD IN STDIN
{
	echo -e "\nGet the first char of every letter from STDIN."
	read -p "Input your string now:  " var
		while true; do
			printf %c $var ; printf "%s\n \n"
		done
}
# PRINT PATH WITH NEWLINE SEPARATION
function spotapi()
{
	uri=$(echo "$1" | sed 's/spotify:track://g')
	curl -X GET "https://api.spotify.com/v1/tracks/$uri" > spot.tmp
	var=$(cat spot.tmp)
	printf "%s\n" $var
	read -p "[ENTER] when finished!" ; clear
	bash -c $HOME/Documents/Scripting/BASH/spotify/spotpop.sh
}
function popularity()
{
	uri=$(echo "$1" | sed 's/spotify:track://g')
	curl -X GET "https://api.spotify.com/v1/tracks/$uri" > spot.tmp 2>/dev/null
	pop=$(awk '/popularity/{print $3}' spot.tmp | sed 's/,//g')
	echo "This song is a" $pop "out of 100 on the scale! That's terrible!"
	per=$(maths $pop/100)
	printf "%s" "Well, " $per% " was the best it could do."
	printf "\n"
	#grep -C 3 "popularity" spot.tmp | grep -o [[:digit:]]
	# echo $(grep -C 3 popularity | grep -o [[:digit:]])

}
function spott() # GET INFORMATION ABOUT SPOTIFY SONGS USING THE URI
{
	uri=$(echo "$1" | sed 's/spotify:track://g')
	api=$(curl -X GET "https://api.spotify.com/v1/tracks/$uri" 2>/dev/null | sed 's/"//g' | grep -i 'popularity' | sed 's|,||g')
	echo -e "\n$api\n"
}
function listhref() # GET THE URI FROM A SONG
{
	grep api $1 | sed 's/,$//g' | sed 's/href//g' | sed 's/://g' | sed 's/[  ]//g'
}
function SPC()
{
	echo -e "\n"
}
# CONVERT WITH TO WINDOWS
function wwd()
{
	pwd | sed 's/\//\\/g' | sed 's/^/C:\\cygwin64/g'
}
function wx()
{
	wwd=$( pwd | sed 's/\//\\/g' | sed 's/^/C:\\cygwin64/g' )
	explorer $(wwd)
}
# VARIOUS FUNCTIONS
function coloradd()
{
	cat $HOME/Documents/Scripting/BASH/bcolor
}
function lsop()
{
	ls /bin /sbin /usr/bin /usr/sbin | sort | uniq | grep $1
}
function bed()
{
	echo $bed
}
function path()
{
  old=$IFS
  IFS=:
  printf "%s\n" $PATH
  IFS=$old
}
function nrprint() # PRINT THE RECORD AMOUNT IN ANY DOCUMENT
{
	gawk '{ NR = "\n" NR } END { print NR " Records"  "\n" }' $1
}
function math() # BETTER CALCULATOR
{
  bc -l <<< "$@"
}
# SAME AS ABOVE BUT LEAVES ONLY 3 DECIMAL PLACES IN ANSWERS
function maths()
{
	bc -l <<< "$@" | zz
}
function nix() # REMOVES ALL DECIMAL PLACES WHEN PIPING FROM MATH
{
	sed 's/.[[:digit:]]*$//g'
}
function zz() # LEAVES ONLY 3 DECIMAL PLACES WHEN PIPING FROM MATH
{
  sed 's/.................$//g'
}
function bashup() # BACKUP USER BASH FILES TO BASHUP
{
	local TIME=`date +%m-%d`
	bashit=$HOME/Backup/Bashup
	tar -czvf bash$TIME.tar.gz $HOME/.bashrc $HOME/.bash_profile $HOME/.bash_aliases $HOME/.bash_functions $HOME/.bash_history 2>/dev/null
	mv -iv bash$TIME.tar.gz -t $bashit
}
function bak() # MAKE BACKUPS/REMOVE BACKUPS
{
  for i do
    case ${i##*/} in
      (?*.?*) cp -iv -- "$i" "${i%.*}.bak.${i##*.}";;
      (*) cp -iv -- "$i" "$i.bak"
    esac
  done
}
function debak() # REMOVE ALL .BAK FILES IN CURRENT DIR
{
	for file in *.bak ; do cp "$file" "${file//.bak}"; rm -iv *.bak; done
}
function talku() # CREATE BACKUPS
{
	awk -f '{$1=""; $3=""; print;}'
}
function backups() # BACKUP USING RSYNC
{
	clear
	wd=$(pwd)
	ls --color=auto -lgG $wd
	echo -e "\nWelcome to the backup tool! Enter the directory you would like to backup and the destination dir."
	read -p "If you would like to view another directory, enter it now:  " qwer
	if [ "$qwer" > 0 ]; then
		ls -lgG --color=auto $qwer | talkuawk '{print $1 $2 $3}'
	fi
	read -p "Source Directory/File:  " sbak
	read -p "Destination:  " sdest
	rsync -avzn $sbak $sdest ; sleep 4
	ls --color=auto -lA $sdest
	echo -e "\n"
	echo -e "\nYou have successfully backed up" $sbak "into" $sdest"!"
}
# SHORTCUT COMMANDS/EASE OF USE
function cdls() { cd "$@"; ls; }
function cd_up() { cd $(printf "%0.0s../" $(seq 1 $1)); }
# REPLACE SPACES IN FILE/DIR NAMES WITH - OR _
function sp-ce()
{
	for f in *\ *; do mv "$f" "${f// /-}"; done
}
function sp_ce()
{
  for f in *\ *; do mv "$f" "${f// /_}"; done
}
function delspace()
{
	for f in *\ *; do sed 's/ //g' $1; done		
}
# LIST ALL NON-DIR FILES IN A FOLDER (INCLUDING HIDDEN FILES)
# HELPER
function ah()
{
	gawk '{print $9}'
}
function lsfa()
{
	ls -A | grep '^[.]'
}
# LIST ONLY HIDDEN FILES
function grepa()
{
	grep -v '^[[:alpha:]]'
}
# LIST ALL NON-DIR FILES IN A FOLDER (NO HIDDEN FILES)
function lsf()
{
	ls -F | grep -v '/$'
}
function lsfd()
{
	ls -F | grep '/$'
}
function lsfad()
{
	ls -FA | grep '/$' | \grep '^[.]'
}
# USED TO MOVE FILES FOUND WITH THE LSF/LSFA FUNCTIONS
function mvf()
{
	lsff
	mv $(lsff) -t $1
	echo -e "\n"
	ls -l $1
}
# ECHO STDIN
function input()
{
	echo "$1"
}
# MAKE A DIRECTORY AND MOVE TO ITS LOCATION
function mdcd()
{
	mkdir -p $1 && mkdir -p $1 && cd $1
}
# SEE THE MB TOTAL OF A DIRECTORY
function kbtotal()
{
	echo `du -BK * | sort -n | awk '{print $1}' | awk '{s+=$1/1000} END {print s}'`MB
}
# BASH HELPERS
function funcls()	
{
	grep '()' $HOME/.bash_functions | awk '{print $2}' | sed 's/()$//' | sort | tail -n+3
}
# SEE ALIAS DESCRIPTIONS
function calias()
{
	awk '{print;} $NR % 1 == 0 { print ""; }' $HOME/.bash_aliases | less
}
function sp2ce()
{
	awk '{ print ; } $NR % 1 == 0 { print ""; }'
}
# SEE BASH FUNCTIONS
function cfunc()
{
	awk '{print;} $NR % 1 == 0 { print ""; }' $HOME/.bash_functions | less -R
}
# MAKING BLANK SCRIPTING FILES
function awker()
{
	touch $1.awk
	echo "#!/bin/awk" > $1.awk
	chmod +x $1.awk
}
function cmd()
{
	touch $1.sh
	echo "#!/bin/bash" > $1.sh
	chmod +x $1.sh
}
function genhtml()
{
	echo "<!DOCTYPE HTML>"
	echo "<html>"
	echo -e "<head>  \n"
	echo -e "<h1>  \n"
	echo -e "</h1>  \n"
	echo -e "</head>  \n"
	echo -e "<body>  \n"
	echo -e "</body>  \n"
	echo "</html>"
}
# GPG FUNCTION(S)
function degpg()
{
	gpg --secret-keyring $HOME/.gnupg/secring.gpg --decrypt-files $1.gpg
	ls -lA | grep $1
}
# ENCRYPT A FILE USING GPG KEY
function engpg()
{
	ls -lA | grep $1 ; gpg --encrypt $1
}
# LIST ALL GPG KEYS
function gpgkl()
{
	gpg --list-keys
}
# LIST ANY GPG ENCRYPTED FILES IN A DIRECTORY
function gpgl()
{
	ls -lA $1 | grep gpg
}	
# TARGZ A FILE AND ENCRYPT IT
function enzip()
{
	tar -cvzf $1.tar.gz $1
	engpg2 $1
	rm -f $1.tar.gz 1>/dev/null
}
# ENCRYPT A TARGZ
function engpg2()
{
	gpg --encrypt $1.tar.gz; gpgl
}
# COMPRESSION/DECOMP
# 7ZIP
function mx7z()
{
    tar -cvf - $1.tar $1 | 7za a -t7z -si -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $1.tar.7z
}
# UNZIP A TAR.GZ.7Z FILE
function un7x()
{
	FILENAME=$1.tar;
	7za x $FILENAME.7z;
	tar -xvf $FILENAME #; rm -f $FILENAME
}
# TAR.GZ STDIN
function targz()
{
	tar -cvzf $1.tar.gz $1
}
function targzview()
{
	gunzip $1.tar.gz
	tar -tvf $1.tar
	gzip $1.tar
}
function extargz()
{
	tar -xvzf $1.tar.gz
}
function tarview()
{
	tar -tvf $1.tar
}
function targzadd()
{
	gunzip $1.tar.gz
	tar -rvf $1.tar $2
	tar -tvf $1.tar
	gzip $1.tar
}
# RECURSIVE TARGZ+ZIP COMMANDS FOR FOLDERS
function maketar()
{
	tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; 
}
function makezip()
{
	zip -r "${1%%/}.zip" "$1" ; 
}
# EXTRACT ALL TYPES OF ARCHIVES
function exx ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       aunpack $1   ;;
      *.gz)        gunzip  $1   ;;
      *.tar)       tar xf  $1   ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip   $1    ;;
      *.Z)         aunpack $1   ;;
      *.7z)        aunpack $1   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# GHOSTSCRIPT CONVERSIONS
function pdfpng()
{
    read -p "Enter your input PDF:  " inp
	read -p "Enter the desired resolution:  " res
	gs -dNOPAUSE -dBATCH -sDEVICE=png16m -r$res -sOutputFile="SMRPG-Strategy-Guide-%d.png" $inp.pdf
}

# Function Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
NC="\e[m"               # Color Reset

colors() 
{
	local fgc bgc vals seq0
	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black
			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}
			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}
# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
function asker()
{
	clear ; echo -e "\n"
	com=$(whereis $1 | awk '{print $2}')
	echo "Are you sure you want to run the command" "$com" "on" \"$2\"? '[y/n] ' ; echo -e "\nInput your answer and hit [ENTER]" ; read -p "$ " ans
	case "$ans" in
		y*|Y*) $1 $2 ; echo -e "\nThe command" \"$1\" "on" \"$2\" "completed without error!" ; echo -e "\n" ; ls -lA | grep "$2$" ; echo -e "\n" ;;
		*) echo "Error, command was not ran." ;;
	esac
}
function ask()          # See 'killps' for example of use.
{
  ans=(1 2 3 4 5 6 7)  
	echo ${ans[*]}
	echo -n "$@" '[y/n] ' ; read ans
  case "$ans" in
  	y*|Y*) echo ${ans[*]}; echo ${#ans[*]} ;;
  	*) echo ${ans[3]} ; echo ${ans[4]} ;;
  esac
}

function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do
        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi
        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pk $fs | awk 'END {print $4}' ) )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"^"
            else
               out=$out"-"
            fi
        done
        free=$(printf "%'d\n" ${free[0]})
        total=$(printf "%'d\n" ${total[0]})				
				out=${info[2]}" "$out"] ("$free"KB free on "$fs")"
        echo -e $out
    done
}
function superdf()
{
    for fs ; do
        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi
				read -p "[BM]egabytes, [BK]ilobytes, [BG]igabytes, or [BT]erabytes:  " var
				var2=$($var | rev)
        local info=( $(command df -P -$var $fs | awk 'END{ print $2,$3,$5 }') )
				local total3=( $(command df -P -$var $fs | echo $(($(awk 'END{ print $2}')/1000))) )
        local total=( $(command df -P -$var $fs | awk 'END {print $2}' ) )
				local free=( $(command df -P -$var $fs | awk 'END {print $4}' ) )        
				local free3=( $(command df -P -$var $fs | echo $(($(awk 'END {print $4}')/1024))) )	
        local nbstars=$(( 10 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<10;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
				fs=$(echo $(echo $fs | sed 's|/cygdrive/||g' | tr a-z A-Z) Drive)
				free=$(printf "%'d\n" ${free[0]})
				total=$(printf "%'d\n" ${total[0]})
        out=${info[2]}" "$out"] ("$free $var2"/"$total $var2")"
        echo -e $fs "\n"$out
    done
}

function dutotal()
{
	awk '{ print $0/1024 "MB"}'<<<$(du -k | awk '{ print $1 }' | tail -1)
}

function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}
# AWK HELPERS
function awkh()
{
	less ~/Documents/general-help/code/awk/awkinfo
#	echo "awk '{\$1=""; print \$0}' : to print all but the first, \$1\$2= for first two, etc."
}
function htotal()
{
    history | awk '{print $1}' | tail -n 1
}
# CPIO FUNCTIONS
function cpbashup()
{
	local TIME=`date +%d%b`
	/usr/bin/find /home/shambi07/ -name "*.bash*" | cpio -o > $HOME/Backup/Cpioarchive/bashup$TIME.cpio 
	echo -e "\n" 
	gzip $HOME/Backup/Cpioarchive/bashup$TIME.cpio
	echo -e "\n"
	ls -lA $HOME/Backup/Cpioarchive/ | grep bashup
}
function cpiomake()
{
	local TIME=`date +%m-%d`
	read -p "Input the full path of the backup directory:  " path
	base=`basename $path`
	title=$base-$TIME
	find $path -depth -print | cpio -oaV > $title.cpio ; gzip $title.cpio
}
function cpiofull()
{
  local TIME=`date +%m-%d`
  base=`basename $PWD`
  title=$base-$TIME
  find $PWD -depth -print | cpio -oaV > $title.cpio ; gzip $title.cpio
}
function cpfind()
{
	echo 'Usage is like this: find LOCATION -(i)name "*.extension" | cpio -o > ARCHIVE.cpio [put iname for case insensitive searches]'
	#find /home/shambi07/ -iname $1 | cpio -o > $2.cpio
}
# MAKE A FULL DIRECTORY BACKUP
function cpiomd()
{
	find . -depth -print0 | cpio --null -pvd $1
}
# MAKE A CPIO ARCHIVE OUT OF YOUR CURRENT DIR
function cpiodir()
{
	ls | cpio -ov > $1.cpio
}
# VIEW CPIO ARCHIVES
function cpview()
{
	cpio -it < $1.cpio
}
# EXTRACT CPIO ARCHIVES TO THEIR ORIGINAL LOCATION
function excpio()
{
	cpio -iv < $1.cpio
}
# EXTRACT A CPIO ARCHIVE TO THE CURRENT DIRECTORY
function excpwd()
{
	cpio -idv --no-absolute-filenames < $1.cpio
}
# USED FOR PRINTING VARIABLES TO A FOLDER
function curvar()
{
    local TIME=`date +%b%d-%H-%M-%S`
    loc=$HOME/Backup/Variables
    file=Variables-$TIME
    touch $file
    echo "#!/bin/bash" > $file
    set >> $file
    targz $file $file 2>/dev/null
    rm -f $file 1>/dev/null
    mv $file.tar.gz -t $HOME/Backup/Variables 2>/dev/null
    ls -la $loc | awk '{print $5,$9}' | grep $file.tar.gz
}
function setout()
{
	local TIME=`date +%d%b`
	loc=$HOME/Backup/Variables
	file=set$TIME
	touch $file
	echo "#!/bin/bash" > $file
	set | tr '[a-z]' '[A-Z]' | awk '{print;} $NR % 1 == 0 { print ""; }' >> $file
	targz $file $file 2>/dev/null
	rm -f $file 1>/dev/null
	mv $file.tar.gz -t $HOME/Backup/Variables 2>/dev/null
	ls -la $loc | awk '{print $5,$9}' | grep $file.tar.gz
}
# PERL CODE
function psumof()
{
	perl -nle '$sum += $_ } END { print $sum' $1
}
# MORE AWK
function sumof()
{
	awk '{sum+=$0} END {print sum}' $1
}