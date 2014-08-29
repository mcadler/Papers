#!/bin/bash
# bib cleaner
INFILE="$1"
NARGS="$#"

if [ ! $NARGS -eq 1 ]; then
        echo "Requires a single input argument..."
        echo "...exiting now!"
        exit 1  
fi

# Clean JabRef Lines
echo "Cleaning JabRef header in $INFILE"
sed -i.bak1 "/This\ file\ was\ created\ with JabRef\ /d" $INFILE

echo "Cleaning ownership lines in $INFILE"
sed -i.bak2 "/owner\ \=/d" $INFILE

echo "Cleaning date added lines in $INFILE"
sed -i.bak3 "/timestamp\ \=/d" $INFILE

echo "Cleaning file references in $INFILE"
sed -i.bak4 "/file\ \=\ /d" $INFILE

echo "Cleaning JabRef MetaData in $INFILE"
sed -i.bak5 "/@comment/d" $INFILE


echo "...DONE!"
