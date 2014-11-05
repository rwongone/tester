# run from root of project 
# $1 is command, "init", "test"
# $2 is name of root directory
EXE="./a.out"

if [ $1 ] && [ $1 == "init" ]
then
	if [ $2 ]
	then
		mkdir -p $2/tests
		mkdir -p $2/testout
		mkdir -p $2/refout
		mkdir -p $2/diff
	else
		mkdir -p tests
		mkdir -p testout
		mkdir -p refout
		mkdir -p diff
	fi
else
	if [ $2 ]
	then
		EXE=$2
	fi
	for file in ./tests/*
	do
		echo "$file"
		$EXE < $file > ./testout/$(basename $file).out
		if [ -f ./refout/$(basename $file).ref ]
		then
			diff ./testout/$(basename $file).out ./refout/$(basename $file).ref | xxd > ./diff/$(basename $file).dif
			diff ./testout/$(basename $file).out ./refout/$(basename $file).ref
			cat ./diff/$(basename $file).dif | while read line
			do
				echo "a line: $line"
			done
		else
			echo "Reference output for $(basename $file) does not exist in testout directory."
		fi			
	done
fi