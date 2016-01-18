FROM rocker/shiny:latest

MAINTAINER Xianying Tan "shrektan@126.com"

## Below is the code by modifying the rocker/hadleyverse without the latex part

## Install some external dependencies. 
RUN apt-get update \
  && apt-get install -y --no-install-recommends -t unstable \
    default-jdk \
    default-jre \
    gdal-bin \
    icedtea-netx \
    libatlas-base-dev \
    libcairo2-dev \
    libgsl0-dev \
    libgdal1-dev \
    libgeos-dev \
    libgeos-c1v5 \
    librdf0-dev \
    libssl-dev \
    libmysqlclient-dev \
    libpq-dev \
    libsqlite3-dev \
    libv8-dev \
    libxcb1-dev \
    libxdmcp-dev \
    libxml2-dev \
    libxslt1-dev \
    libxt-dev \
    netcdf-bin \
    qpdf \
    r-cran-rgl \
    ssh \
    vim \
  && R CMD javareconf \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## Install the Hadleyverse packages (and some close friends). 
RUN install2.r --error \
    broom \
    DiagrammeR \
    devtools \
    dplyr \
    ggplot2 \
    ggthemes \
    haven \
    httr \
    knitr \
    lubridate \
    packrat \
    pryr \
    purrr \
    reshape2 \
    rmarkdown \
    rvest \
    readr \
    readxl \
    testthat \
    tidyr \
    shiny \
    stringr \
    xml2 

## Manually install (useful packages from) the SUGGESTS list of the above packages.
## (because --deps TRUE can fail when packages are added/removed from CRAN)
RUN install2.r --error \
    -r "https://cran.rstudio.com" \
    -r "http://www.bioconductor.org/packages/release/bioc" \
    base64enc \
    BiocInstaller \
    codetools \
    covr \
    data.table \
    downloader \
    gridExtra \
    gtable \
    hexbin \
    Hmisc \
    htmlwidgets \
    jpeg \
    Lahman \
    lattice \
    lintr \
    MASS \
    PKI \
    png \
    microbenchmark \
    mgcv \
    mapproj \
    maps \
    maptools \
    mgcv \
    multcomp \
    nlme \
    nycflights13 \
    quantreg \
    Rcpp \
    rJava \
    roxygen2 \
    RMySQL \
    RPostgreSQL \
    RSQLite \
    testit \
    V8 \
    XML \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## httr authentication uses this port
EXPOSE 1410
ENV HTTR_LOCALHOST 0.0.0.0

# Shrek's own working environment

# Install Database related apt
RUN apt-get update && apt-get install -y \
    libaio1

# CRAN version packages

# install2.r is an cmd of linux by import litter. If the package is not available in CRAN, it will stop.

RUN install2.r --error \
    assertthat \
    dendextend \
    dygraphs \
    DiagrammeR \
    ggthemes \
    jsonlite \
    knitr \
    leaflet \
    lubridate \
    mailR \
    openxlsx \
    PerformanceAnalytics \
    PKI \
    R6 \
    RColorBrewer \
    RJDBC \
    RJSONIO \
    rmarkdown \
    shinythemes \
    shinydashboard \
    showtext \
    stringr \
    V8 \
    xtable \
    xts \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Github version packages
RUN R -e "devtools::install_github('rstudio/d3heatmap')"
RUN R -e "devtools::install_github('Rdatatable/data.table')"
RUN R -e "devtools::install_github('rstudio/DT')"
RUN R -e "devtools::install_github('renkun-ken/formattable')"
RUN R -e "devtools::install_github('hadley/ggplot2')"
RUN R -e "devtools::install_github('slowkow/ggrepel')"
RUN R -e "devtools::install_github('jrnold/ggthemes')"
RUN R -e "devtools::install_github('cttobin/ggthemr')"
RUN R -e "devtools::install_github('hadley/httr')"
RUN R -e "devtools::install_github('hadley/purrr')"
RUN R -e "devtools::install_github('hadley/readr')"
RUN R -e "devtools::install_github('imanuelcostigan/RSQLServer')"
RUN R -e "devtools::install_github('rstudio/shiny')"
RUN R -e "devtools::install_github('ebailey78/shinyBS', ref = 'shinyBS3')"
RUN R -e "devtools::install_github('daattali/shinyjs')"
RUN R -e "devtools::install_github('trestletech/shinyStore')"
