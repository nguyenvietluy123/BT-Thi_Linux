
if [ $# != 1 ]
then
echo "Khong dung tham so dong lenh."
elif [ $# == 1 ]
then
echo "- so dong lenh trong file la :"
wc -l actor_movies.txt
fi


if [ $# -ne 1 ]
then
echo "Khuyen cao: Can nhap chinh xac mot tham so."
echo "Su dung: $0 <inputfile_name>"
exit 1
fi

echo "* Main Menu"
echo "-> Nhap S hoac s de sap xep"
echo "-> Nhap T hoac t de tim phim"
echo "-> Nhap Q hay q de thoat"

a=0
until [ $a -eq 1 ]
do

echo "Moi chon cong viec:"
read option

case "$option" in

"Q" | "q") exit 0;;

"S" | "s")
echo "Da sap xep vao file actor"
sort -r actor_movies.txt > actor.txt;;

"T" | "t" )

* ) echo "Lua chon khong dung";;
esac
done

