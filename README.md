Spaghetti Kotlin example
========================

1. Download Kotlin compiler 0.9.66 and unzip it into the root folder (it will create a folder called `kotlinc`):

	https://github.com/JetBrains/kotlin/releases/download/build-0.9.66/kotlin-compiler-0.9.66.zip

2. Run `./build.sh`

You should see something like this:

```text
$ ./build.sh
./build.sh 
+ echo 'Cleaning up...'
Cleaning up...
+ rm -rf build
+ echo 'Building application...'
Building application...
+ spaghetti generate headers -m src/main/spaghetti/Lajos.module -o build/spaghetti/generated-headers -l kotlin
Loaded generators for [haxe, js, kotlin, typescript]
+ kotlinc/bin/kotlinc-js -library-files kotlinc/lib/kotlin-jslib.jar -output-prefix kotlinc/lib/kotlin.js -output build/compiled-kotlin/LajosModule.js src/main/kotlin build/spaghetti/generated-headers
WARNING: build/spaghetti/generated-headers/Spaghetti.kt: (20, 21) Parameter 'resource' is never used
# Lots of other warnings from Kotlin libraries
+ spaghetti bundle -m src/main/spaghetti/Lajos.module -o build/spaghetti/js/bundle -l kotlin -s build/compiled-kotlin/LajosModule.js
Loaded generators for [haxe, js, kotlin, typescript]
+ spaghetti package -d build/spaghetti/js/bundle -o build/spaghetti/application --wrapper node --execute --main prezi.lajos
+ echo 'Running application...'
Running application...
+ node build/spaghetti/application/application.js
Hello Kotlin!
```
