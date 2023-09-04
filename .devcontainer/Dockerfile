# Using universal container for Java and other tools.
FROM mcr.microsoft.com/devcontainers/universal:2-linux

# Flutter SDK installation.
RUN cd /usr/local && mkdir flutter && cd flutter \
    && wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.2-stable.tar.xz \
    && tar xf flutter_linux_3.13.2-stable.tar.xz \
    && rm flutter_linux_3.13.2-stable.tar.xz

# Android SDK installation.
RUN cd /usr/local && mkdir android && cd android \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip \
    && unzip commandlinetools-linux-10406996_latest.zip \
    && rm commandlinetools-linux-10406996_latest.zip \
    && cd cmdline-tools && mkdir latest \
    && mv NOTICE.txt bin lib source.properties latest

COPY finish.sh /usr/local/finish.sh

ENV ANDROID_HOME="/usr/local/android"
