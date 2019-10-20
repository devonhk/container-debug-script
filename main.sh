#!/bin/sh

#COMMON_PACKAGES=(man awk)

install_debian()
{
  apt update
  apt install -y nmap \
    net-tools \
    iputils-ping \
    iputils-arping \
    iputils-tracepath \
    iputils-clockdiff \
    netcat \
    man \
    dnsutils \
    mtr \
    iproute2 \
    inotify-tools \
    tcpdump
}

install_amazon_linux2()
{
  yum update -y
  yum install -y \
    nmap-ncat \
    bind-utils \
    man \
    mtr \
    iputils \
    net-tools \
    tcpdump
}

install_alpine()
{
  apk add --update \
    nmap \
    net-tools \
    iproute2 \
    man \
    inotify-tools \
    nmap-ncat \
    iputils \
    mtr \
    bind-tools \
    tcpdump
}


if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
  VERSION=$VERSION_ID
else
  echo "/etc/os-release unavaiable; Cannot reliably determine linux distribution"
fi

install_distro_specific_pkgs()
{
  if [ "$OS" = "Debian GNU/Linux" ] || [ "$OS" = "Ubuntu" ]; then
    install_debian
  elif [ "$OS" = "Amazon Linux" ]; then
    if [ "$VERSION" = "2" ]; then
      install_amazon_linux2
    fi
  elif [ "$OS" = "Alpine Linux" ]; then
    install_alpine
  fi
}

raise_exception()
{
  echo -e "\e[31mFailed to install packages for distro: $OS version:$VERSION\e[0m"
  exit 1
}
install_distro_specific_pkgs || raise_exception


