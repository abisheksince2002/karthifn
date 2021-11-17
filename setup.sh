#!/bin/bash
progress()
{
	{
    		for ((i = 0 ; i <= 100 ; i+=100)); do
        		sleep 2
        		echo $i
    		done
	} 	| whiptail --gauge "File is Loading ..." 6 60 0

}
progress1()
{
	{
    		for ((i = 0 ; i <= 100 ; i+=100)); do
        		sleep 2
        		echo $i
    		done
	} 	| whiptail --gauge "Permission Validating ..." 6 60 0

}

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=8
BACKTITLE="Search Generator"
TITLE="Welcome to Search Generator"
MENU="Kindly Choose one of the following options:"

OPTIONS=(1 "Permit Storage Access"
         2 "Selecting & Searching a File"
	 3 "Previous Output"
	 4 "About us"
	 5 "Quit")

CHOICE=$(whiptail --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
		if zenity --question --title="Permit Storage Access" --text="Kindly Give Permission To Access" --height="200" --width="300" ;then
			progress1
			zenity --info --timeout 2 --title="YES" --text="ACCESS GRANTED" --height="100" --width="150"
			if zenity --question --title="Permit Read and Write Access" --text="Kindly Give Permission To Access" --height="200" --width="300" ;then
				progress1
				zenity --info --timeout 2 --title="YES" --text="ACCESS GRANTED" --height="100" --width="150"
				bash setup.sh
			else
				zenity --info --timeout 2 --title="NO" --text="ACCESS DININED" --height="100" --width="150"
				bash setup.sh
			fi

		else
			zenity --info --timeout 2 --title="NO" --text="ACCESS DININED" --height="100" --width="150"
			bash setup.sh
		fi

		;;
        2)
     		a11=$(whiptail --title "Enter a File Extention" --inputbox "Example .txt,.doc,.docx,.html(Any One)" 10 60 3>&1 1>&2 2>&3)
		progress
		alfa=$(zenity --file-selection --title="Select a File" --multiple --file-filter=*$a11)
          	progress
		zoo=$(whiptail --title "Enter a Word" --inputbox "Enter a Word You Want To Search(Example america)" 10 60 3>&1 1>&2 2>&3)
		grep -i $zoo $alfa > a21.txt
		bash setup.sh
            	;;
	3)
		mousepad a21.txt
		bash setup.sh
		;;
	4)
		bash about_us.sh
		;;
	5)
		exit
		;;
esac
