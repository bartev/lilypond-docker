# https://towardsdatascience.com/learn-enough-docker-to-be-useful-b0b44222eef5
# https://github.com/asbjoree/docker-lilypond/blob/master/Dockerfile

FROM ubuntu:latest
LABEL maintainer="bartev@gmail.com"
ENV ADMIN="bartev"
ENV TERM linux
RUN apt-get update
RUN apt-get install -y

# https://www.gnu.org/software/guile/download/
RUN apt-get install guile-2.2

COPY plugins /root/plugins

# COPY . ./app
# Set tell the installer that we are working in a noninteractive ENV 
# ENV DEBIAN_FRONTEND noninteractive

# Install Lilypond. 
RUN apt-get -y install lilypond
# or
# RUN apt-get build-dep -y lilypond

# Roman numerals
RUN cp /root/plugins/lilypond-roman-numeral-tool/roman_numeral_analysis_tool.ily /usr/local/share/lilypond/*/ly/

# Lilyjazz
RUN cp /root/plugins/lilyjazz/stylesheet/*.ily /usr/local/share/lilypond/*/ly/
RUN cp /root/plugins/lilyjazz/otf/* /usr/local/share/lilypond/*/fonts/otf/
RUN cp /root/plugins/lilyjazz/svg/* /usr/local/share/lilypond/*/fonts/svg/
RUN cp /root/plugins/lilyjazz/supplementary-files/*/*.otf /usr/local/share/lilypond/*/fonts/otf/









CMD ["/bin/bash"]


# COPY . ./app
# ADD https://raw.githubusercontent.com/discdiver/pachy-vid/master/sample_vids/vid1.mp4 \
# /my_app_directory
# RUN ["mkdir", "/a_directory"]
# CMD ["python", "./my_script.py"]