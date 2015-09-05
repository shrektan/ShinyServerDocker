FROM rocker/shiny:latest

MAINTAINER Xianying Tan "shrektan@126.com"

RUN apt-get update && apt-get install -y \
    libssh2-1-dev \
    libv8-3.14-dev \
    libxml2-dev \
    libssl-dev

# CRAN version packages
# if you install it directly in China, maybe you can replace the repos with https://mirrors.tuna.tsinghua.edu.cn/CRAN/
RUN R -e "install.packages(c('xml2', 'rversions', 'devtools'), repos = 'https://cran.rstudio.com/')"
RUN R -e "install.packages(c('ggthemes', 'ggplot2', 'grid', 'gridExtra', 'RColorBrewer', 'scales', 'ggthemr'),repos='https://cran.rstudio.com/')"
RUN R -e "install.packages(c('knitr', 'xtable', 'rmarkdown'),repos='https://cran.rstudio.com/')"
RUN R -e "install.packages(c('lubridate', 'stringr', 'dplyr', 'tidyr', 'readr', 'openxlsx', 'readxl'),repos='https://cran.rstudio.com/')"
RUN R -e "install.packages(c('xts', 'PerformanceAnalytics'),repos='https://cran.rstudio.com/')"
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinydashboard', 'dygraphs', 'DiagrammeR'),repos='https://cran.rstudio.com/')"
RUN R -e "install.packages(c('R6', 'V8', 'testthat'), repos = 'https://cran.rstudio.com/')"

# Github version packages
RUN R -e "devtools::install_github('Rdatatable/data.table')"
RUN R -e "devtools::install_github('daattali/shinyjs')"
RUN R -e "devtools::install_github('rstudio/DT')"
RUN R -e "devtools::install_github('ebailey78/shinyBS', ref = 'shinyBS3')"
RUN R -e "install.packages(c('leaflet'), repos = 'https://cran.rstudio.com/')"

# After this you might want to change the default user of shiny-server from shiny to docker so that you can have the write access


