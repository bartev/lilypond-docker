# v1.0
# install Lilypond v2.20.0 (stable image) in a docker image for
# use from the mac CLI or Frescobaldi

# also install the jazz fonts and scripts in the appropriate places

# https://towardsdatascience.com/learn-enough-docker-to-be-useful-b0b44222eef5
# https://github.com/asbjoree/docker-lilypond/blob/master/Dockerfile

# When running this, mount the desired volume too and run in interactive mode
# docker run -it -v ~/path-to-files-dir/:/home lilydock

FROM ubuntu:latest
LABEL maintainer="bartev@gmail.com"
ENV ADMIN="bartev"
ENV TERM linux

RUN apt-get update
RUN apt-get -y install tree

COPY ./plugins /root/plugins

# Install Lilypond. 
COPY ./lilypond-2.20.0-1.linux-64.sh /root/
RUN chmod +x /root/lilypond-2.20.0-1.linux-64.sh
RUN /root/lilypond-2.20.0-1.linux-64.sh --batch

# COPY . ./app
# Tell the installer that we are working in a noninteractive ENV 
ENV DEBIAN_FRONTEND noninteractive

# Add common library files

# http://lilypond.org/doc/v2.18/Documentation/notation/including-lilypond-files
# Files which are to be included in many scores may be placed in the 
# LilyPond directory ‘../ly’. (The location of this directory is 
# installation-dependent - see Other sources of information). 
# These files can then be included simply by naming them on an 
# \include statement. This is how the language-dependent files 
# like ‘english.ly’ are included.

# /usr/local/lilypond/usr/share/lilypond/current/fonts

# note my location is /usr/share vs asbjoree's /usr/local/share -- maybe because I'm not building from source code?
# the /*/ takes the place of the version number?

# # # Roman numerals
# RUN cp /root/plugins/lilypond-roman-numeral-tool/roman_numeral_analysis_tool.ily /usr/share/lilypond/*/ly/
RUN cp /root/plugins/lilypond-roman-numeral-tool/roman_numeral_analysis_tool.ily /usr/local/lilypond/usr/share/lilypond/current/ly/

# # # Lilyjazz

# # RUN cp /root/plugins/lilyjazz/stylesheet/*.ily /usr/share/lilypond/*/ly/
# RUN cp /root/plugins/bv-lilyjazz/stylesheets/*.ily /usr/share/lilypond/*/ly/
RUN cp /root/plugins/bv-lilyjazz/stylesheets/*.ily /usr/local/lilypond/usr/share/lilypond/current/ly/

RUN cp /root/plugins/lilyjazz/otf/* /usr/local/lilypond/usr/share/lilypond/current/fonts/otf/
RUN cp /root/plugins/lilyjazz/svg/* /usr/local/lilypond/usr/share/lilypond/current/fonts/svg/
RUN cp /root/plugins/lilyjazz/supplementary-files/*/*.otf /usr/local/lilypond/usr/share/lilypond/current/fonts/otf/
