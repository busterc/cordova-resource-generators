#!/bin/bash
# Generate Cordova splash screens
+# refer:https://msdn.microsoft.com/en-us/library/dn757053.aspx

function usage() {
	echo "usage: $0 <image-filename> <background-color> [output-directory]";
	exit 1;
}

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

image=$1
bgcolor=$2
output=$3/res/screens

devices=ios,android,windows,wp8 #,windows-phone,bada,bada-wac,blackberry,webos
eval mkdir -p "$output/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

convert="convert $1 -background $bgcolor -gravity center"

function androidConvertSplash() {
	drawables=drawable-land-ldpi,drawable-land-mdpi,drawable-land-hdpi,drawable-land-xhdpi,drawable-port-ldpi,drawable-port-mdpi,drawable-port-hdpi,drawable-port-xhdpi
	eval mkdir -p "$output/android"
res/screens/android/screen-xhdpi-landscape.png
 	$convert -resize 512x512 -extent 720x1280 "$output/android/screen-xhdpi-portrait.png"
 	$convert -resize 256x256 -extent 480x800 "$output/android/screen-hdpi-portrait.png"
 	$convert -resize 256x256 -extent 320x480 "$output/android/screen-mdpi-portrait.png"
 	$convert -resize 128x128 -extent 200x320 "$output/android/screen-ldpi-portrait.png"

 	$convert -resize 512x512 -extent 1280x720 "$output/android/screen-xhdpi-landscape.png"
 	$convert -resize 256x256 -extent 800x480 "$output/android/screen-hdpi-landscape.png"
 	$convert -resize 256x256 -extent 480x320 "$output/android/screen-mdpi-landscape.png"
 	$convert -resize 128x128 -extent 320x200 "$output/android/screen-ldpi-landscape.png"

	function androidCopySplash() {
		androidOutput=$(find . -type d | grep "platforms/android/res$")
		find . -type d | grep "res/screens/android" | xargs -I{} cp -R {} $androidOutput
	}
	#androidCopySplash
}
androidConvertSplash

function iosConvertSplash() {
	$convert -resize 512x512 -extent 640x1136 "$output/ios/screen-iphone-568h-2x.png"
	$convert -resize 1024x1024 -extent 2048x1496 "$output/ios/screen-ipad-landscape-2x.png"
	$convert -resize 512x512 -extent 1024x748 "$output/ios/screen-ipad-landscape.png"
	$convert -resize 1024x1024 -extent 1536x2008 "$output/ios/screen-ipad-portrait-2x.png"
	$convert -resize 512x512 -extent 768x1004 "$output/ios/screen-ipad-portrait.png"
	$convert -resize 256x256 -extent 320x480 "$output/ios/screen-iphone-portrait.png"
	$convert -resize 512x512 -extent 640x960 "$output/ios/screen-iphone-portrait-2x.png"

	function iosCopySplash() {
		cp $(find . | grep "res/screens/ios/.*\.png") "$(find . -type d | grep 'platforms/ios/.*/res/screens')"
	}
	#iosCopySplash
}
iosConvertSplash

function windowsConvertSplash() {
	$convert -resize 256x256 -extent 620x300 "$output/windows/splashscreen.png"
	$convert -resize 1024x1024 -extent 1152x1920 "$output/windows/SplashScreen.scale-240.png"

	function windowsCopySplash() {
		cp $(find . | grep "res/screens/windows/.*\.png") "$(find . -type d | grep 'platforms/windows/.*/res/screens')"
	}
	#windowsCopySplash
}
windowsConvertSplash

function wp8ConvertSplash() {
	$convert -resize 256x256 -extent 480x800 "$output/wp8/screen-portrait.jpg"

	function wp8CopySplash() {
		cp $(find . | grep "res/screens/wp8/.*\.jpg") "$(find . -type d | grep 'platforms/wp8/.*/res/screens')"
	}
	#wp8CopySplash
}
wp8ConvertSplash
