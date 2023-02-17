#!/bin/bash

set -eo pipefail

derived_data=SQLCipherBuild
archives_dir=archives
xcframework=../SQLCipher.xcframework

rm -rf "${derived_data}" "${archives_dir}" "${xcframework}"

xcodebuild archive \
    -project SQLCipher.xcodeproj \
    -scheme SQLCipher \
    -destination "generic/platform=iOS" \
    -archivePath "archives/SQLCipher-iOS" \
    -derivedDataPath "${derived_data}" \
    BUILD_BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SKIP_INSTALL=NO \
    ONLY_ACTIVE_ARCH=NO | xcbeautify

xcodebuild archive \
    -project SQLCipher.xcodeproj \
    -scheme SQLCipher \
    -destination "generic/platform=macOS" \
    -archivePath "archives/SQLCipher-macOS" \
    -derivedDataPath "${derived_data}" \
    BUILD_BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SKIP_INSTALL=NO \
    ONLY_ACTIVE_ARCH=NO | xcbeautify

xcodebuild archive \
    -project SQLCipher.xcodeproj \
    -scheme SQLCipher \
    -destination "generic/platform=macOS,variant=Mac Catalyst" \
    -archivePath "archives/SQLCipher-Mac_Catalyst" \
    -derivedDataPath "${derived_data}" \
    BUILD_BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SKIP_INSTALL=NO \
    ONLY_ACTIVE_ARCH=NO | xcbeautify

xcodebuild archive \
    -project SQLCipher.xcodeproj \
    -scheme SQLCipher \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "archives/SQLCipher-iOS_Simulator" \
    -derivedDataPath "${derived_data}" \
    BUILD_BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SKIP_INSTALL=NO \
    ONLY_ACTIVE_ARCH=NO | xcbeautify

xcodebuild -create-xcframework \
    -archive archives/SQLCipher-iOS.xcarchive -framework SQLCipher.framework \
    -archive archives/SQLCipher-iOS_Simulator.xcarchive -framework SQLCipher.framework \
    -archive archives/SQLCipher-macOS.xcarchive -framework SQLCipher.framework \
    -archive archives/SQLCipher-Mac_Catalyst.xcarchive -framework SQLCipher.framework \
    -output "${xcframework}"
