if [ $1 ] # where $1 is the test directory, usually like a#/test
then
	scp ./tests/* student.cs:~/cs241/$1
	if [ $2 ] # where $2 is the reference tool
	then
		ssh student.cs && cd cs241/$1
		source /u/cs241/setup
		for file in *
		do
			$2 < $file > $(basename $file).ref
		done
		exit
	fi
	scp student.cs:~/cs241/$1 ./refout
fi
