# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    42corr.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcoutaud <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/11 16:12:25 by hcoutaud          #+#    #+#              #
#    Updated: 2021/08/14 12:24:36 by hcoutaud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

# Language to use for choosing pdfs
lang="fr"

# Availability of subjects
subjects=("c00 c01 c02 c03 c04 c05 c06")

# Essential constants
adminlogin="hcoutaud"
gitaddr="git@github.com:43app/43corr.git"

# Styles
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BLUE='\033[1;49;36m'
YELLOW='\033[1;49;33m'
LIGHTGREY='\033[38;5;138m'
LIGHTBLUE='\033[38;5;117m'

ITALIC='\033[3m'
BOLD='\033[1m'
UNDERLINE='\033[4m'


# ===== FUNCTIONS =====
usage(){ 
    echo "Usage: ./42racing.sh [options] subject"
	echo ""
	echo "Options :"
	echo "-h : Print this help text"
	echo "-a : Print all subjects currently available to use the program onto"
	echo ""
	echo ">>> 'subject' parameter should be typed in with format like \"sh00\" or \"c03\""
	echo ""
	echo "Note : all subjects may not be available, check github for updates at"
	echo "${gitaddr}"
	echo ""
}

function current_available()
{
	echo "Currently, you can evaluate with this program the following subjects :"
	echo ">> ${BOLD}${subjects}${NC} <<"
	echo ""
}

# GETOPTS
echo ""
while getopts ":h:a" option; do 
    case "$option" in
		a)
			current_available
			exit;;
        *) 
			usage
			exit;;
    esac 
done

# Check for the presence of the subject arg supposedly given by user
if [ -z "$1" ]
then
	usage
	exit
fi
subject=$1

# Check if subject name is valid AND available
is_valid_subject=true
if ! [[ " ${subjects[@]} " =~ " ${subject} " ]]; then 
	echo "${BOLD}Incorrect name${NC} for your subject"
	echo "Check -a option to print all currently available subjects"
	echo ""
	exit 1
fi

dest=$(pwd)
dest42exo=$(dirname $dest | sed 's/\/$//')
dest43corr=$(echo $dest | sed 's/\/$//')
pdf="${dest43corr}/subjects/pdf/${subject}/${lang}.subject.pdf"
txt="${dest43corr}/subjects/txt/${subject}/${lang}.subject.txt"

# Warn user
echo "This program was made by a non-professional"
echo "You, and only you, can assess properly the work of another"
echo "This is only setup program, NOT an automated evaluation program"
echo "Report any bug to ${adminlogin} on slack"
echo ""
read -p "Would you like to continue ? (y/[n]) "
printf -- '%s\n' ""
case "${REPLY}" in
    ([yY]) 
	break
	clear
	;;
    (*)    exit 1 ;;
esac
echo ""

# In dev
: '
# Check for login (ask if absent)
if [[ -z "${LOGNAME}" ]]; then
	echo "We were unable to locate your login for your header"
	echo "Your 42 login (to create your headers) >>"
	read LOGIN
	echo ""
else
	LOGIN="${LOGNAME}"
fi
echo "Hello ${LOGIN}, welcome to 42corr"
echo "You can check our github at ${gitaddr}"
echo ""
'

# In development
: '
# Create necessary tools for emacs to create personnal headers
git clone https://github.com/ggjulio/42header_emacs.git
cd 42header_emacs
./set_header.sh  "${LOGIN}" "marvin@42.fr"         # usage :  ./set_header.sh [LOGIN] [MAIL]
source ~/.zshrc
cd ..
rm -rf 42header_emacs
'

# In dev
# Create files and folders from pdf

#while IFS= read -r line; do
#	
#	if [[ $line == *"Dossier de rendu :"* ]]; then
#		dossier=$(echo $line | awk -F " : " '{print $2}' | sed 's/ //g' | sed 's/\/*$//')
#		
#		if [ -e $dossier ]; then
#			echo "Folder ${dossier} already exists, ignoring creation (delete it to create files inside it)\n"
#		
#		else
#			# Read .txt file
#			read -r line
#			fichier=$(echo $line | awk -F " : " '{print $2}' | sed 's/ //g')
#			read -r line
#			read -r line
#			proto=$(echo $line | sed 's/^ *//g')
#			
#			# Create folder
#			echo "Creating folder ${dossier} :";
#			mkdir -p "${dest}/${dossier}"
#			cd "./${dossier}"
#			
#			# Create files (ft_*.c, main.c)
#			echo "\tCreating file ${fichier}";
#			touch "./${fichier}"
#			cd ".."
#			echo ""
#		fi
#	fi
#done < "${path}"

function fill_main()
{
    # mainpath must end with "main.c"
    mainpath=$1
    proto=$2
    echo "#include <stdio.h>"   >> $mainpath
    echo "#include <unistd.h>"	>> $mainpath 
    echo "#include <string.h>"	>> $mainpath
    echo ""						>> $mainpath
    echo "$proto"				>> $mainpath
    echo ""						>> $mainpath
    echo "int main()"			>> $mainpath
    echo "{"					>> $mainpath
    echo "\t"					>> $mainpath
    echo "}"					>> $mainpath
}
echo "/---------------------------------------------------------------\\"
echo " ${LIGHTGREY}=====${NC} ${LIGHTBLUE}Setting up your environment to evaluate Piscine ${subject}${NC} ${LIGHTGREY}=====${NC}"
echo "\\---------------------------------------------------------------/"
# Put pdf in current directory (user friendly program ;p)
echo "${ITALIC}Putting pdf subject in current directory, and opening it !${NC}"
cp "${dest43corr}/subjects/pdf/${subject}/${lang}.subject.pdf" "${dest42exo}"
open "${dest42exo}/${lang}.subject.pdf"
echo ""

# Array containing all exercises/filenames (useful for the inf loop)
exercises=""
fichiers=""

# Analyse folder from subject (Create/Check files and folders)
while IFS= read -r line; do	
    if [[ $line =~ "Dossier de rendu :" ]]; then
        dossier=$(echo $line | awk -F " : " '{print $2}' | sed 's/ //g' | sed 's/\/*$//')
        if [ ! -e "${dest42exo}/${dossier}" ]; then
            echo "Folder ${RED}${dossier}/${NC} seems to be missing (${UNDERLINE}${BOLD}double check${NC})"
			echo ""
        else
			exercises="${exercises} ${dossier}"
            read -r line
            fichier=$(echo $line | awk -F " : " '{print $2}' | sed 's/ //g')
			fichiers="${fichiers} ${fichier}"
			fichier_noc=$(echo $fichier | sed 's/.c//')
			read -r line
            while ! [[ "$line" =~ "Elle devra être prototypée de la façon suivante :" ]]; do
				read -r line
			done
			read -r type
			read -r line
			read -r fct
			proto="${type} ${fct}"
			

 			echo "Entering ${BOLD}${dossier}${NC}"
			
            # Create/Check files (ft_*.c, main.c)
            if [ ! -e "${dest42exo}/${dossier}/${fichier}" ]; then
				echo "\t${RED}•${NC} The file ${ITALIC}${RED}${fichier}${NC} seems to be missing (${UNDERLINE}${BOLD}double check${NC})"
			else
				echo "\t${GREEN}•${NC} The file ${ITALIC}${GREEN}${fichier}${NC} is present"
			fi
			
			# Copy main file for the exercise (Create with default sample if not known in db)
			if [ ! -e "${dest42exo}/${dossier}/main.c" ]; then
				if [ -e "${dest43corr}/main/${subject}/${dossier}/main.c" ]; then
					cp "${dest43corr}/main/${subject}/${dossier}/main.c" "${dest42exo}/${dossier}"
					echo "\t${GREEN}•${NC} Added a ${GREEN}${ITALIC}main.c${NC} file adapted for ${ITALIC}${fichier}${NC}"
				# Or create a generic one if none is available
				else
					rm "${dest42exo}/${dossier}/main.c"
					touch "${dest42exo}/${dossier}/main.c"
					fill_main "${dest42exo}/${dossier}/main.c" "${proto}"
					fichier_nom=$(echo $(echo ${fichier} | sed 's/.c//'))
					echo "\t${GREEN}•${NC} Generated a basic ${ITALIC}${GREEN}main.c${NC} file, because no ${ITALIC}${fichier_nom}${NC}-specific"
					echo "\t   main.c is yet available (check on github for updates)"
				fi
			else
				echo "\t${GREEN}•${NC} One ${ITALIC}${GREEN}main.c${NC} file already exists for this exercise"
			fi
		fi
        echo ""
    fi
done < "${txt}"


# Norminette check
echo "================================================================"
echo ""
echo "Checking with '${YELLOW}norminette${NC} -R CheckForbiddenSourceHeader' :"
echo ""
find "${dest42exo}" -type f -name 'ft_*.c' -exec norminette -R CheckForbiddenSourceHeader {} \;
echo ""

# Checking for hidden files
echo "================================================================"
echo ""
echo "Searching for hidden files :"
echo ""
lines=$(find "${dest42exo}" -type d \( -path "${dest42exo}/.git" -o -path "${dest42exo}/43corr" \) -prune -false -o -type f \( -name '.*' -a ! -name '.gitignore' \))
nlines=$(echo $lines | wc -l)
if [ $nlines -eq 0 ]; then
	echo "${GREEN}No hidden files ;D${NC}"
else
	echo "${RED}$lines${NC}"
fi
echo""

# Initializing the first exercise to evaluate
exercises_len=$(echo $(echo ${exercises} | awk -F ' ' '{print NF; exit}'))
current_ex_num=1

function get_current_ex()
{
	current_ex_num=$1
	echo $(echo $exercises | awk -v numex="${current_ex_num}" -F ' ' '{ printf "%s", $numex }')
}

function get_current_file()
{
	current_ex_num=$1
	echo $(echo $fichiers | awk -v numf="${current_ex_num}" -F ' ' '{ printf "%s", $numf }')
}

function switch_ex()
{
	# Exercises are numbered from 1 to n (not 0 to n-1)
	direction=$1
	current_ex_num=$2
	exercises_len=$3
	if [ $direction -gt 0 ] && [ ${current_ex_num} -lt ${exercises_len} ]; then
		echo $(( ${current_ex_num} + 1 ))
	elif [ $direction -lt 0 ] && [ ${current_ex_num} -gt 1 ]; then
		echo $(( ${current_ex_num} - 1 ))
	else
		echo "${current_ex_num}"
	fi
}

# Begin prompt
echo "================================================================"
echo "Type your ${BLUE}command${NC} (type ${ITALIC}help(h)${NC} to get a list of valid commands)"
echo ""

# Event loop
error=""
message=""
current_ex=$(echo $(get_current_ex ${current_ex_num}))
file=$(echo $(get_current_file ${current_ex_num}))
while [ 1 ]; do
	printf "\033[0F"
	printf "\033[0K"
	printf "\r${RED}${error}${NC}${YELLOW}${message}${NC} "
	printf "${BOLD}${current_ex}${NC} ${BLUE}>>${NC} "
	read command
	if [[ $command = "prev" || $command = "p" ]]; then
		current_ex_num=$(echo $(switch_ex -1 ${current_ex_num} ${exercises_len}))
		current_ex=$(echo $(get_current_ex ${current_ex_num}))
		file=$(echo $(get_current_file ${current_ex_num}))
		error=""
		message=""
	elif [[ $command = "next" || $command = "n" ]]; then
		current_ex_num=$(echo $(switch_ex 1 ${current_ex_num} ${exercises_len}))
		current_ex=$(echo $(get_current_ex ${current_ex_num}))
		file=$(echo $(get_current_file ${current_ex_num}))
		error=""
		message=""
	elif [[ $command = "compile" || $command = "c" ]]; then
		gcc -Wall -Werror -Wextra -o "${dest42exo}/${current_ex}/compile43corr.out" "${dest42exo}/${current_ex}/${file}" "${dest42exo}/${current_ex}/main.c" > "${dest42exo}/${current_ex}/compile43corr.log" 2>&1
		error=""
		message="log file created at \"${current_ex}/\" (type ${ITALIC}l${NC} to see)"
	elif [[ $command = "run" || $command = "r" ]]; then
		if [ ! -e "${dest42exo}/${current_ex}/compile43corr.out" ]; then
			error="Compile first"
			message=""
		else
			osascript -e "tell app \"Terminal\"
    					  	do script \"${dest42exo}/${current_ex}/compile43corr.out\"
						  end tell" > /dev/null 2>&1
			error=""
			message="Launched in new terminal window"
		fi
	elif [[ $command = "help" || $command = "h" ]]; then
		error=""
		message="(compile(c), edit_file(ef), edit_main(e), help(h), log_compil(l), next(n), prev(p), quit(q), run(r))"
	elif [[ $command = "log" || $command = "l" ]]; then
		vim "${dest42exo}/${current_ex}/compile43corr.log"
		error=""
		message=""
	elif [[ $command = "edit_main" || $command = "e" ]]; then
		vim "${dest42exo}/${current_ex}/main.c"
		error=""
		message=""
	elif [[ $command = "edit_file" || $command = "ef" ]]; then
        vim "${dest42exo}/${current_ex}/${file}"
        error=""
        message=""
	elif [[ $command = "quit" || $command = "q" ]]; then
		break > /dev/null 2>&1
	elif [[ $command = "" ]]; then
		error=""
		message=""
	else
		error="UNVALID"
		message=""
	fi
done

echo ""
echo "============================THE END============================="
echo ""


echo " ..|''.|   ..|'||    ..|'||  '||'|.       '||  ..|'||  '||'|."
echo ".|'    '  .|'   ||  .|'   ||  ||  ||       || .|'   ||  ||  ||"
echo "||   .... ||     || ||     || ||   ||      || ||     || ||''|.  "
echo "'|.   ||  '|.    || '|.    || ||   ||      || '|.    || ||   || "
echo " ''|..'|   ''|..|'   ''|..|' .||..|'   || .|'  ''|..|' .||..|'  "

echo ""
echo "================================================================"
