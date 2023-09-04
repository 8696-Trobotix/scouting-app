#!/bin/bash

# This correctly installs the emulator, but currently it seems that we're unable to get the APK installed on the AVD.

sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install emulator
echo 'export PATH="$PATH:/usr/local/android/emulator"' >> ~/.bashrc

sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install "system-images;android-33;google_apis;x86_64"
avdmanager create avd -n test -k "system-images;android-33;google_apis;x86_64"

sudo apt update && sudo apt install libpulse0

# To start the emulator:
# emulator -avd test -wipe-data -no-accel -no-snapshot-load
# -wipe-data and -no-snapshot-load are optional, but it doesn't matter.
# To supposedly install the APK:
# flutter run -d emulator-5554 --enable-software-rendering
# --enable-software-rendering is optional too.
# When attempting to install the APK to AVD, an error is given about the "activity" and "package" services being missing.
