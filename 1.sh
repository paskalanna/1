#!bin/bash
LANG="ru_RU.UTF-8"
echo "Made by Anna Paskal"
echo "This program determines if the file was accessed after the specified date."
echo "Current directory:"
pwd
dir=$(pwd)
if [ -z "$(ls -A $pwd)" ]; then
	echo "There are no files in the directory."
	break
else
continue
fi
echo "Enter file name:"
while true; do
read file1
echo "Search by file name $file1"
find . -iname $file1
	if [ -e $file1 ] ; then
		echo "Excellent! File found!"
		echo "Enter the date as <year> - <month> - <day> <hour>: <minutes>: <seconds> (for example, 1999-09-10 12:00:00):"
		read date_str
		DATE=$(date -d "$date_str" +%s)
		ACCESS_DATE=$(stat -c %X "$file1")
			if [ $ACCESS_DATE -gt $DATE ]; then
  				echo "The file was accessed after the specified date."
				echo "End of the program. Bye-bye <3"
				break
			else
				exit 120
			fi
		break
	else
		echo "File not found. Try again? (Y / N)"
		read yn
		if [ $yn = Y ]
			then
				echo "Enter file name:"
				continue
			else 
				echo "End of the program. Bye-bye <3"
				break
fi
fi
done
