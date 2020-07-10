FROM ubuntu:18.04
MAINTAINER Chaitanya P <c.purandare@outlook.com>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y gnupg2 apt-utils
RUN apt-get install software-properties-common -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
RUN apt-get update
RUN apt-get install -y \
r-base \
wget \
gdebi-core
RUN wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb
RUN gdebi -n shiny-server-1.5.5.872-amd64.deb
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
ENTRYPOINT shiny-server
EXPOSE 3838
