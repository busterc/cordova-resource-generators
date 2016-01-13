#!/bin/bash
# Generate Cordova splash screens
# refer to: https://msdn.microsoft.com/en-us/library/dn757053.aspx
function usage() {
	echo "usage: $0 <image-filename> <background-color> [output-directory]";
	exit 1;
}

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

image=$1
bgcolor=$2
output=$3/res/screens
temp=$3
devices=ios,android,windows,wp8 #,windows-phone,bada,bada-wac,blackberry,webos
rm -rf $output
eval mkdir -p "$output/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

convert="convert $1 -background $bgcolor -gravity center"
function cache()
{
	c128="$temp/c128.png"
	c256="$temp/c256.png"
	c512="$temp/c512.png"
	c1024="$temp/c1024.png"
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
	rm $temp/c128.png
	rm $temp/c256.png
	rm $temp/c512.png
	rm $temp/c1024.png
}
cache
function androidConvertSplash() {
	#$convertfrom512 -extent 720x1280 "$output/android/screen-port-xhdpi.png"
 	#$convertfrom256 -extent 480x800 "$output/android/screen-port-hdpi.png"
 	#$convertfrom256 -extent 320x480 "$output/android/screen-port-mdpi.png"
 	#$convertfrom128 -extent 200x320 "$output/android/screen-port-ldpi.png"

 	#$convertfrom512 -extent 1280x720 "$output/android/screen-land-xhdpi.png"
 	#$convertfrom256 -extent 800x480 "$output/android/screen-land-hdpi.png"
 	#$convertfrom256 -extent 480x320 "$output/android/screen-land-mdpi.png"
 	#$convertfrom128 -extent 320x200 "$output/android/screen-land-ldpi.png"
	
	$convertfrom512 -extent 720x960 "$output/android/screen-xhdpi-landscape.png"
 	$convertfrom256 -extent 480x640 "$output/android/screen-hdpi-landscape.png"
 	$convertfrom256 -extent 320x470 "$output/android/screen-mdpi-landscape.png"
 	$convertfrom256 -extent 320x426 "$output/android/screen-ldpi-landscape.png"

 	$convertfrom512 -extent 960x720 "$output/android/screen-xhdpi-portrait.png"
 	$convertfrom256 -extent 640x480 "$output/android/screen-hdpi-portrait.png"
 	$convertfrom256 -extent 470x320 "$output/android/screen-mdpi-portrait.png"
 	$convertfrom256 -extent 426x320 "$output/android/screen-ldpi-portrait.png"
}
androidConvertSplash

function iosConvertSplash() {
	$convertfrom512 -extent 1024x768 "$output/ios/screen-ipad-landscape.png"
	$convertfrom1024 -extent 2048x1536 "$output/ios/screen-ipad-landscape-2x.png"
	$convertfrom512 -extent 768x1024 "$output/ios/screen-ipad-portrait.png"	
	$convertfrom1024 -extent 1536x2048 "$output/ios/screen-ipad-portrait-2x.png"
	$convertfrom512 -extent 640x960 "$output/ios/screen-iphone-portrait-2x.png"
	$convertfrom256 -extent 320x480 "$output/ios/screen-iphone-portrait.png"	
	$convertfrom512 -extent 640x1136 "$output/ios/screen-iphone-568h-2x.png"
	
	#$convertfrom256 -extent 320x480 "$output/ios/Default~iphone.png"
	#$convertfrom256 -extent 640x960 "$output/ios/Default@2x~iphone.png"
	#$convertfrom512 -extent 768x1024 "$output/ios/Default-Portrait~ipad.png"
	#$convertfrom1024 -extent 1536x2048 "$output/ios/Default-Portrait@2x~ipad.png"
	#$convertfrom512 -extent 1024x768 "$output/ios/Default-Landscape~ipad.png"
	#$convertfrom1024 -extent 2048x1536 "$output/ios/Default-Landscape@2x~ipad.png"
	#$convertfrom512 -extent 640x1136 "$output/ios/Default-568h@2x~iphone.png"	
	#$convertfrom512 -extent 750x1334 "$output/ios/Default-667h.png"
	#$convertfrom1024 -extent 1242x2208 "$output/ios/Default-736h.png"
	#$convertfrom1024 -extent 2208x1242 "$output/ios/Default-Landscape-736h.png"
}
iosConvertSplash

function windowsConvertSplash() {
	$convertfrom256 -extent 620x300 "$output/windows/splashscreen.png"
	$convertfrom1024 -extent 1152x1920 "$output/windows/SplashScreen.scale-240.png"
	
	#$convertfrom256 -extent 620x300 "$output/windows/splashscreen.png"
	#$convertfrom1024 -extent 1152x1920 "$output/windows/SplashScreen.scale-240.png"
}
windowsConvertSplash

function wp8ConvertSplash() {
	$convertfrom512 -extent 480x800 "$output/wp8/screen-portrait.jpg"
	#$convertfrom512 -extent 480x800 "$output/wp8/SplashScreenImage.png"
	#$convertfrom512 -extent 768x1280 "$output/wp8/SplashScreenImage.png"
}
wp8ConvertSplash
clearcache

