#!/bin/bash
# Generate Cordova splash screens
# refer to:http://cordova.apache.org/docs/en/4.0.0/config_ref_images.md.html
function usage() {
	echo "usage: $0 <image-filename> <background-color> [output-directory]";
	exit 1;
}

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

image=$1
bgcolor=$2
output=$3/res/screens
devices=ios,android,windows8,wp8 #,windows-phone,bada,bada-wac,blackberry,webos
eval mkdir -p "$output/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

convert="convert $1 -background $bgcolor -gravity center"
function cache()
{
	c128="$3/c128.png"
	c256="$3/c256.png"
	c512="$3/c512.png"
	c1024="$3/c1024.png"
	$convert -resize 128x128 "$c128"
	$convert -resize 256x256 "$c256"
	$convert -resize 512x512 "$c512"
	$convert -resize 1024x1024 "$c1024"
	convertfrom128="convert $c128 -background $bgcolor -gravity center"
	convertfrom256="convert $c256 -background $bgcolor -gravity center"
	convertfrom512="convert $c512 -background $bgcolor -gravity center"
	convertfrom1024="convert $c1024 -background $bgcolor -gravity center"
}
function clearcache()
{
	rm $3/cache128.png
	rm $3/cache256.png
	rm $3/cache512.png
	rm $3/cache1024.png
}
cache
function androidConvertSplash() {
 	$convertfrom512 -extent 720x1280 "$output/android/screen-xhdpi-portrait.png"
 	$convertfrom256 -extent 480x800 "$output/android/screen-hdpi-portrait.png"
 	$convertfrom256 -extent 320x480 "$output/android/screen-mdpi-portrait.png"
 	$convertfrom128 -extent 200x320 "$output/android/screen-ldpi-portrait.png"

 	$convertfrom512 -extent 1280x720 "$output/android/screen-xhdpi-landscape.png"
 	$convertfrom256 -extent 800x480 "$output/android/screen-hdpi-landscape.png"
 	$convertfrom256 -extent 480x320 "$output/android/screen-mdpi-landscape.png"
 	$convertfrom128 -extent 320x200 "$output/android/screen-ldpi-landscape.png"
}
androidConvertSplash

function iosConvertSplash() {
	#$convertfrom512 -extent 640x1136 "$output/ios/screen-iphone-568h-2x.png"
	#$convertfrom1024 -extent 2048x1496 "$output/ios/screen-ipad-landscape-2x.png"
	#$convertfrom512 -extent 1024x748 "$output/ios/screen-ipad-landscape.png"
	#$convertfrom1024 -extent 1536x2008 "$output/ios/screen-ipad-portrait-2x.png"
	#$convertfrom512 -extent 768x1004 "$output/ios/screen-ipad-portrait.png"
	#$convertfrom256 -extent 320x480 "$output/ios/screen-iphone-portrait.png"
	#$convertfrom512 -extent 640x960 "$output/ios/screen-iphone-portrait-2x.png"
	
	$convertfrom256 -extent 320x480 "$output/ios/Default~iphone.png"
	$convertfrom256 -extent 640x960 "$output/ios/Default@2x~iphone.png"
	$convertfrom512 -extent 768x1024 "$output/ios/Default-Portrait~ipad.png"
	$convertfrom1024 -extent 1536x2048 "$output/ios/Default-Portrait@2x~ipad.png"
	$convertfrom512 -extent 1024x768 "$output/ios/Default-Landscape~ipad.png"
	$convertfrom1024 -extent 2048x1536 "$output/ios/Default-Landscape@2x~ipad.png"
	$convertfrom512 -extent 640x1136 "$output/ios/Default-568h@2x~iphone.png"	
	$convertfrom512 -extent 750x1334 "$output/ios/Default-667h.png"
	$convertfrom1024 -extent 1242x2208 "$output/ios/Default-736h.png"
	$convertfrom1024 -extent 2208x1242 "$output/ios/Default-Landscape-736h.png"
}
iosConvertSplash

function windowsConvertSplash() {
	$convertfrom256 -extent 620x300 "$output/windows8/splashscreen.png"
	$convertfrom1024 -extent 1152x1920 "$output/windows8/SplashScreen.scale-240.png"
}
windowsConvertSplash

function wp8ConvertSplash() {
	$convertfrom512 -extent 768x1280 "$output/wp8/SplashScreenImage.png"
}
wp8ConvertSplash
clearcache
