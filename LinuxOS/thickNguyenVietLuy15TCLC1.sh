#!/bin/bash

a=0
until [ $a -eq 1 ]
do

echo "* Main Menu"
echo "-> Nhap K hoac k de khoi tao user"
echo "-> Nhap X hay x de xoa user"
echo "-> Nhap T hay t de thoat"
echo "Moi chon cong viec:"

	read option
	case "$option" in
		"T" | "t") 
			echo "Ket thuc"
			exit 0;;

		"X" | "x")
			username=$(zenity --entry --title "Messager" --text "Enter username you want to delete:")
			sudo deluser $username
			echo "Xoa user $username thanh cong";;

		"K" | "k")
			username=$(zenity --entry --title "Ten user" --text "Enter username:")

			if [ "$username" = "" -o $? -eq 1 ]
			then
				{
				zenity --info --text "Username invalid!" 
				exit 0
				}
			fi

			password=$(zenity --entry --hide-text --title "Mat khau" --text "Enter Password : $username")

			if [ "$password" = "" -o $? -eq 1 ]
			then
				{
				zenity --info --text "Password invalid!"
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
			echo "Tao user $username thanh cong";;
	esac
done
