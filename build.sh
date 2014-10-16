#!/bin/bash -ex
echo "Cleaning up..."
rm -rf build

echo "Building application..."
spaghetti generate headers -m src/main/spaghetti/Lajos.module -o build/spaghetti/generated-headers -l kotlin
kotlinc/bin/kotlinc-js -library-files kotlinc/lib/kotlin-jslib.jar -output-prefix kotlinc/lib/kotlin.js -output build/compiled-kotlin/LajosModule.js src/main/kotlin build/spaghetti/generated-headers
spaghetti bundle -m src/main/spaghetti/Lajos.module -o build/spaghetti/js/bundle -l kotlin -s build/compiled-kotlin/LajosModule.js 
spaghetti package -d build/spaghetti/js/bundle -o build/spaghetti/application --wrapper node --execute --main prezi.lajos

echo "Running application..."
node build/spaghetti/application/application.js
