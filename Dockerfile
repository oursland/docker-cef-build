FROM ubuntu:latest
LABEL maintainer "Jacob Oursland <jacob.oursland@gmail.com>"

RUN apt update && apt install -y curl locales lsb-release sudo wget

# accept MS license for TTF fonts
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

RUN curl 'https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps.sh?format=TEXT' | base64 -d > install-build-deps.sh
RUN bash install-build-deps.sh --no-prompt --no-chromeos-fonts
RUN apt install -y libgtkglext1-dev

RUN mkdir -p /code/automate
RUN wget https://bitbucket.org/chromiumembedded/cef/raw/master/tools/automate/automate-git.py -O /code/automate/automate-git.py

ENV CEF_USE_GN=1
RUN python /code/automate/automate-git.py --download-dir=/code --no-distrib --no-build --branch=3071 --force-update

ENV PATH=$PATH:/code/depot_tools
WORKDIR /code/chromium/src/cef
RUN bash cef_create_projects.sh

WORKDIR /code/chromium/src
RUN ninja -C out/Debug_GN_x64 cef chrome_sandbox
