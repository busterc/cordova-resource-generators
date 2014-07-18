# cordova-resource-generators
<!--Cordova generators for app icons and splash screens (can be used as hooks, or not)-->
Quickly generate mobile app icons and splash screens for Cordova builds and have them automatically copied to the appropriate `/platforms/*` directories.

* You must have [ImageMagick](http://www.imagemagick.org/) installed
* Doesn't use or provide hooks, because I personally don't need to generate on every build (make hooks if you need them)
* Creates a `/resources/` directory as a sibling to `/www/` rather than beneath it
* Also copies icons and splash screens from `/resources/` to the appropriate `/platforms/*` directories (or will create the directory, if the commands are not run from the root of your app)
* Currently only generates iOS and Android resources
* Currently only tested on OS X
* Made for Cordova 3.4 and newer
* Use aliases, if that's your thang

## Version
0.1.0

## Installation on OS X
```sh
$ curl https://raw.githubusercontent.com/busterc/cordova-resource-generators/master/install.sh | sh
```
_By all means, examine the [install.sh](install.sh) file before installing._

## Usage
### Generate Icons
```sh
$ cd path/to/your/app
$ cordova-generate-icons path/to/your/img.png
```

### Generate Splash Screens
```sh
$ cd path/to/your/app
$ cordova-generate-splash-screens path/to/your/img.png
```
<!--
## Easter Egg Aliases
_you know, for your .bash_profile or .bashrc or .profile_
```sh
alias cgicons="cordova-generate-icons"
alias cgscreens="cordova-generate-splash-screens"
```
-->

## Dependencies
* [ImageMagick](http://www.imagemagick.org/) - Convert, Edit, And Compose Images

## License
The MIT License (MIT)

Copyright (c) 2014 Buster Collings

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
