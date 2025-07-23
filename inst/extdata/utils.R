library(tibble)
library(rvg)
library(stringr)
library(gganimate)
library(magrittr)
library(glue)
library(ggwordcloud)
library(tidyverse)
library(readxl)
library(ggforce)
library(grid)
library(purrr)
library(ggsci)
library(gridExtra)
library(eurostat)
library(sf)
library(ggtext)
library(png)
library(gifski)


data_convert <- function(data, convert_type,
                         kerdes_szam = 0, honap = TRUE,
                         regio = T) {
  
