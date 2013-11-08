#/bin/bash
#####################################################
#####	    Run in file to convert Encoding	#####
#####	    					#####
#####	Search  (*.css *.php *.js *.tpl)	#####
#####	in the directory where you run 		#####
#####	the script				#####
#####################################################


#Encoding of a file.
from="iso-8859-1"
#Encoding to convert.
to="utf-8"

total=(`find -name '*.php' -or -name '*.css' -or -name '*.js' -or -name '*.tpl' | wc -l`)
COUNTER=0
PRECENT=0
for file in $(find -name '*.php' -or -name '*.css' -or -name '*.js' -or -name '*.tpl'); do
	enco=(`file -i $file | grep $from | cut -d ":" -f 1`)
	if [ -n "$enco" ]; then
		mv $enco "$enco".old
		iconv "$enco".old -f $from -t $to > $enco 
		chmod 777 $enco
		echo "Convirtiendo $enco"
		rm "$enco".old
	fi
	let "COUNTER += 1"
	let PERCENT=$COUNTER*100/$total; 
	
	echo -n -e "#####  $PERCENT%  #####\r"
done
	echo  "#####  Finalizado  #####"
