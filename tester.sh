# run from root of project 

EXE="./a.out "

if [ $1 == "init" ]
then
	mkdir -p $2/tests
else
	# $2 contains name of executable, presumably ./a.out
	EXE
fi

