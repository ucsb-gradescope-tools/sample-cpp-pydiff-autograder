#!/usr/bin/env bash

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


/bin/rm -rf MAKE-REFERENCE-OUTPUT
mkdir -p MAKE-REFERENCE-OUTPUT

cd MAKE-REFERENCE-OUTPUT

copy_files_from_dir_if_it_exists ../EXECUTION-FILES
copy_files_from_dir_if_it_exists ../BUILD-FILES
copy_files_from_dir_if_it_exists ../REFERENCE-SOLUTION

chmod u+x ../build.sh
../build.sh

python3 ../make_reference.py