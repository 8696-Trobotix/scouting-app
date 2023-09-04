#!/bin/bash

echo 'export PATH="$PATH:/usr/local/flutter/flutter/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/usr/local/android/cmdline-tools/latest/bin"' >> ~/.bashrc

/usr/local/flutter/flutter/bin/flutter precache
yes | sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install "build-tools;30.0.3"
yes | sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install "platforms;android-33"
yes | sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install "platform-tools"
yes | sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --install "patcher;v4"
yes | sudo /usr/local/android/cmdline-tools/latest/bin/sdkmanager --licenses
