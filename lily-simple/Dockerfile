# Dockerfile
# Select the base system 
# FROM ubuntu:bionic
FROM ubuntu:latest
ENV ADMIN="bartev"
ENV TERM linux

# Setup the locales for the Ubuntu system.  Because the base image is a bare bones 
# setup, this is needed to get things in the correct language. 
# https://hub.docker.com/_/ubuntu/ 
# Always use update with the install subcommand
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apt-get update 

# RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#     && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

COPY plugins /root/plugins

# Install Lilypond. 
RUN apt-get -y install lilypond

# Set LANG to us.utf8
ENV LANG en_US.utf8

# Set tell the installer that we are working in a noninteractive ENV 
ENV DEBIAN_FRONTEND noninteractive


# Add common library files

# http://lilypond.org/doc/v2.18/Documentation/notation/including-lilypond-files
# Files which are to be included in many scores may be placed in the 
# LilyPond directory ‘../ly’. (The location of this directory is 
# installation-dependent - see Other sources of information). 
# These files can then be included simply by naming them on an 
# \include statement. This is how the language-dependent files 
# like ‘english.ly’ are included.

# note my location is /usr/share vs asbjoree's /usr/local/share -- maybe because I'm not building from source code?
# the /*/ takes the place of the version number?

# # Roman numerals
# RUN ls /usr/share/lilypond
RUN cp /root/plugins/lilypond-roman-numeral-tool/roman_numeral_analysis_tool.ily /usr/share/lilypond/*/ly/

# # Lilyjazz

## RUN cp /root/plugins/lilyjazz/stylesheet/*.ily /usr/share/lilypond/*/ly/
RUN cp /root/plugins/bv-lilyjazz/stylesheets/*.ily /usr/share/lilypond/*/ly/

RUN cp /root/plugins/lilyjazz/otf/* /usr/share/lilypond/*/fonts/otf/
RUN cp /root/plugins/lilyjazz/svg/* /usr/share/lilypond/*/fonts/svg/
RUN cp /root/plugins/lilyjazz/supplementary-files/*/*.otf /usr/share/lilypond/*/fonts/otf/

