FROM debian:stable

RUN apt-get update && \
    apt-get install -y git-core \
    build-essential \
    gnupg \
    flex bison \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z1-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    fontconfig \
    curl \
    gpg \
    python3 \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install repo:
RUN export REPO=$(mktemp /tmp/repo.XXXXXXXXX) && \
    curl -o ${REPO} https://storage.googleapis.com/git-repo-downloads/repo && \
    gpg --recv-keys 8BB9AD793E8E6153AF0F9A4416530D5E920F5C65 && \
    curl -s https://storage.googleapis.com/git-repo-downloads/repo.asc | gpg --verify - ${REPO} &&  \ 
    mkdir -p ~/bin/repo && \
    install -m 755 ${REPO} ~/bin/repo

# create symlinks for python and repo:
RUN ln -s /usr/bin/python3      /usr/bin/python
RUN ln -s /root/bin/repo/repo.* /usr/bin/repo

# git identity needed for repo sync
RUN git config --global user.name "aaos builder"
RUN git config --global user.email "aaos@builder.com"


# needed!
RUN printf "\nalias ls='ls --color=auto'\n" >> ~/.bashrc
RUN printf "\nalias ll='ls -alF'\n" >> ~/.bashrc