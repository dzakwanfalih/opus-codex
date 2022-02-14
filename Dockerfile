#
# Comments start with an octothorpe, as you might expect
#
# Specify the 'base image'
FROM ubuntu:latest

#
# Naming the maintainer is good practice
LABEL Author="M Dzakwan Falih" Email="dzakwanfalih@hotmail.com"

#
# The 'LABEL' directive takes arbitrary key=value pairs
LABEL Description="This is my personal flavor of Ubuntu" Vendor="Dzakwan" Version="1.0"

#
# Now tell ubuntu to update itself and install some packet for develop software
RUN apt-get update  -y && apt install -y \
    git \
    autoconf \
    automake \
    libtool \
    gcc \
    make 

# Now tell ubuntu clone gitlone repostiory octopus 
RUN git clone https://gitlab.xiph.org/xiph/opus.git


# Note tell ubuntu change directory opus and install c program 
RUN cd opus && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install




