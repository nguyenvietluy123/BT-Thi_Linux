#!/bin/bash
username=$(zenity --entry --title "Ten user" --text "Enter username:")

if [ "$username" = "" -o $? -eq 1 ]
then
	{
		zenity --info --text "Tao CSDL" 
		exit 0
	}
fi

password=$(zenity --entry --hide-text --title "Mat khau" --text "Enter Password : $username")

if [ "$password" = "" -o $? -eq 1 ]
then
	{
		zenity --info --text "Tao CSDL"
		exit 0
	}
fi

#sudo -i
sudo useradd -p $password $username


if [ $? -ne 0 ]
then
	{
		zenity --info --text "Khong the tao username!"
		exit 1
	}
fi

exit 0
	
