FROM ubuntu:latest

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=ja_JP.UTF-8 \
    LC_ALL=${LANG} \
    LANGUAGE=${LANG} \
    TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install packages
RUN apt-get update

# Install the required packages for desktop    
RUN apt-get install -y \
      supervisor \
      xvfb \
      xfce4 \
      x11vnc

# Install utilities(optional).
RUN apt-get install -y \
      wget \
      curl \
      net-tools \
      vim-tiny \
      vim \
      git \
      xfce4-terminal

# Install japanese language packs(optional)
RUN apt-get install -y \
      language-pack-ja-base language-pack-ja \
      ibus-anthy \
      fonts-takao

# Install Visual Studio Code
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get update && apt-get install -y code

# Install Browser
RUN apt-get install -y firefox

# Clean up
RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Rename user directories Japanese to English.
RUN LANG=C xdg-user-dirs-update --force

COPY supervisord/* /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]