#!/bin/bash
while [ 1 ]
do
	username=$(zenity --entry --title "Ten user" --text "Nhập username:")

	if [ $? -eq 1 ]
	then
		{
			zenity --info --text "Da huy cong viec!"
			break
		}
	fi

	if [ "$username" = "" ]
	then
		{
			zenity --info --text "Du lieu nhap khong dung! Vui long thuc hien lai"
			#break
			continue
		}
	fi

	


	password=$(zenity --entry --hide-text --title "Mat khau" --text "Nhập Password : $username")

	if [ $? -eq 1 ]
	then
		{
			zenity --info --text "Da huy cong viec!"
			break
		}
	fi

	if [ "$password" = "" ]
	then
		{
			zenity --info --text "Du lieu nhap khong dung! Vui long thuc hien lai"
			#break
			continue
		}
	fi

	#sudo -i
	#sudo useradd -p $password $username


	if [ "$username" = "admin" ] && [ "$password" = "123456" ]
	then
		{
			zenity --info --text "Đăng nhạp thành công!"
			break
		}
	else
		{
			#zenity --confirm --text "Sai username hoac password! Nhan OK de nhap lai"
			zenity --entry --title "Sai username hoac password!" --text "Chon hanh dong tiep theo? (OK: tiep tuc nhap lai; Cacel: de thoat chuong trinh)"

			if [ $? -eq 1 ]
			then
				{
					zenity --info --text "Da huy cong viec"
					break 
					exit 0
				}
			fi
		}
	fi

	
done

exit 0

	
