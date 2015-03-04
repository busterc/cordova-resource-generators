#!/bin/bash
# Generate Cordova splash screens
# refer to: http://cordova.apache.org/docs/en/4.0.0/config_ref_images.md.html
function usage() {
	echo "usage: $0 <image-filename> <background-color> [output-directory]";
	exit 1;
}

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

./gensplash.sh $1 $2 $3
./genicon.sh $1 $3
