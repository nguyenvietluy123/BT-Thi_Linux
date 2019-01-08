#!/bin/bash
# chay doan shell scrip voi doi so dong lenh la file input actor_movies.txt
# $./thigk*.sh actor_movies.txt
# Dau tien, yeu cau nguoi dung nhap vao 2 title cua film.
#        Neu ca hai có trong file actor_movies.txt, tiep tuc;
#        nguoc lai, thoat
# Lap hien thi main menu yeu cau nguoi dung nhap vao tuy chon (go vao Q hay q de thoat):
#                       neu tuy chon la A (hay a), in tat ca dien vien co dong 1 trong hai film tren;
#                       neu tuy chon la C (hay C), in tat ca dien vien co dong chung ca hai film tren;
#                       neu tuy chon la O (hay o), in tat ca dien vien chi dong 1 film.
#                       neu tuy chon la Q (hay q), thoat khoi script
#                       neu tuy chon khac, hien thi thong bao Lua chon khong dung.

# Kiem tra tham so cua dong lenh co chinh xac la 1 hay khong
if [ $# -ne 1 ]
then
echo "Khuyen cao: Can nhap chinh xac mot tham so."
echo "Su dung: $0 <inputfile_name>"
exit 1
fi

# Yeu cau nguoi dung nhao vao 2 title cua film
echo "Moi nhap title cua film thu nhat:"
read movie1
echo "Moi nhap title cua film thu hai:"
read movie2
# Kiem tra ca hai film co trong file du lieu
# neu mot trong hai khong co thi thoat khoi script
# nguoc lai tiep tuc...
if [ `grep -c -i "$movie1" $1` -gt 0 ] && [ `grep -c -i "$movie2" $1` -gt 0 ]
then
echo "Ban nhap khop voi hai film nay: "
grep -m 1 -i -o ",[^,]*$movie1[^,]*," $1 | cut -d',' -f 2
grep -m 1 -i -o ",[^,]*$movie2[^,]*," $1 | cut -d',' -f 2
echo "Ca hai film co trong CSDL, vui long tiep tuc..."
#create two sets for the actors in each movie respectively
grep -i "$movie1" $1 | cut -f 1 -d',' > actors_in_movie1.txt
grep -i "$movie2" $1 | cut -f 1 -d',' > actors_in_movie2.txt
egrep -i "$movie1|$movie2" $1 | cut -f 1 -d',' > actors_in_movie3.txt
else
echo "Title cua film khong co."
exit 1
fi

# Yeu cau nguoi dung nhap vao tuy chon. Tao menu tai day.
# ???Tai day ban can in ra thong bao tuy chon

# Cau 3 bat dau tai day
# ???Tao vong lap yeu cau nguoi dung nhap vao tuy chon de tim kiem cho den khi nguoi dung go vao Q hoac q de Thoat
a=0
until [ $a -eq 1 ]
do
echo "Nhap tuy chon (A, C, O, Q)"
read usr_option
case "$usr_option" in
"A" | "a") echo "So dien vien co dong 1 trong 2 phim"
sort -u actors_in_movie1.txt actors_in_movie2.txt;;
"C" | "c") echo "So dien vien co dong ca 2 phim"
grep -f actors_in_movie1.txt -o actors_in_movie2.txt;;
"O" | "o") echo "So dien vien chi dong 1 trong 2 phim"
sort actors_in_movie1.txt actors_in_movie2.txt | uniq -u;;
"Q" | "q") exit 0;;
* ) echo "Lua chon khong dung";;
esac
done
