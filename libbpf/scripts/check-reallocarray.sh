#!/bin/sh

tfile=$(mktemp /home/test_reallocarray_XXXXXXXX)
cp $tfile $tfile.c
ofile=${tfile%.c}.o

cat > $tfile.c <<EOL
#define _GNU_SOURCE
#include <stdlib.h>

int main(void)
{
	return !!reallocarray(NULL, 1, 1);
}
EOL

gcc $tfile.c -o $ofile  2>&1
if [ $? -ne 0 ]; then echo "FAIL"; fi
 #/bin/rm -f $tfile $ofile
