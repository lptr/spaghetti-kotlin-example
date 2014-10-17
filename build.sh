#!/bin/bash -ex
echo "Cleaning up..."
rm -rf build bela/build lajos/build

echo "Building the lajos module..."
spaghetti generate headers -m bela/src/main/spaghetti/Bela.module -o bela/build/spaghetti/generated-headers -l kotlin
kotlinc/bin/kotlinc-js -library-files kotlinc/lib/kotlin-jslib.jar -output-prefix kotlinc/lib/kotlin.js -output bela/build/compiled-kotlin/LajosModule.js bela/src/main/kotlin bela/build/spaghetti/generated-headers
spaghetti bundle -m bela/src/main/spaghetti/Bela.module -o bela/build/spaghetti/js/bundle -l kotlin -s bela/build/compiled-kotlin/LajosModule.js

echo "Building the lajos module..."
spaghetti generate headers -d bela/build/spaghetti/js/bundle -m lajos/src/main/spaghetti/Lajos.module -o lajos/build/spaghetti/generated-headers -l kotlin
kotlinc/bin/kotlinc-js -library-files kotlinc/lib/kotlin-jslib.jar -output-prefix kotlinc/lib/kotlin.js -output lajos/build/compiled-kotlin/LajosModule.js lajos/src/main/kotlin lajos/build/spaghetti/generated-headers
spaghetti bundle -d bela/build/spaghetti/js/bundle -m lajos/src/main/spaghetti/Lajos.module -o lajos/build/spaghetti/js/bundle -l kotlin -s lajos/build/compiled-kotlin/LajosModule.js

echo "Building the application from bela and lajos..."
spaghetti package -d bela/build/spaghetti/js/bundle:lajos/build/spaghetti/js/bundle -o build/spaghetti/application --wrapper node --execute --main prezi.lajos

echo "Running lajos the application..."
node build/spaghetti/application/application.js
