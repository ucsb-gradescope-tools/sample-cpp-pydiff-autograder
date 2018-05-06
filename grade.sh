copy_files_from_dir_if_it_exists () {
    if [ -d $1 ]; then
        cp -v $1/* .
    fi
}


if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

if [ -f requirements3.txt ]; then
    pip3 install -r requirements3.txt
fi


if [ "$#" -eq 1 ]; then
    SUBMISSION_SOURCE=`pwd`/$1
else
    SUBMISSION_SOURCE=/autograder/submission
fi


rm -f results.json

/bin/rm -rf MAKE-STUDENT-OUTPUT
mkdir -p MAKE-STUDENT-OUTPUT

cd MAKE-STUDENT-OUTPUT

copy_files_from_dir_if_it_exists ../EXECUTION-FILES
copy_files_from_dir_if_it_exists ../BUILD-FILES
copy_files_from_dir_if_it_exists $SUBMISSION_SOURCE

../build.sh

python3 ../grade.py > ../results.json

if [ -d /autograder/results ]; then
    cp -v ../results.json /autograder/results
fi