if zenity --question --title="Permit Storage Access" --text="Kindly Give Permission To Access" --height="200" --width="300" ;then
	zenity --info --timeout 2 --title="YES" --text="ACCESS GRANTED" --height="100" --width="150"
	if zenity --question --title="Permit Read and Write Access" --text="Kindly Give Permission To Access" --height="200" --width="300" ;then
		zenity --info --timeout 2 --title="YES" --text="ACCESS GRANTED" --height="100" --width="150"
	else
		zenity --info --timeout 2 --title="NO" --text="ACCESS DININED" --height="100" --width="150"
	fi	

else
	zenity --info --timeout 2 --title="NO" --text="ACCESS DININED" --height="100" --width="150"
fi	
