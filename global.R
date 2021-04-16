# prepare environment -----------------------------------------------------

#install.packages('rsconnect')
#install.packages("quantmod")
#install.packages("shinycssloaders")
#install.packages("shinythemes")

# import libs
# data wrangling (data pre-processing + eda)
library(shinydashboard)
library(shinycssloaders)
library(tidyverse)
library(lubridate)
library(dplyr)
library(shinythemes)

# visualisasi
library(ggplot2)
library(plotly)
library(ggthemes)
library(quantmod)

# beautify/tidying annotation graph
library(glue)
library(scales)


# WRANGLE--------------------------------------------------------------------------------

## amazon data
amazon <- read.csv("data_input/Stock/amazon.csv")

name1 <- "Amazon.com, Inc."
name1_initial <- "AMZN"

amazon$Company <- name1
amazon$Stock.Initial <- name1_initial

amazon$Date <- as.Date(amazon$Date)

amazon_18 <- amazon %>% 
  filter(Date > "2018-01-01")

## apple data
apple <- read.csv("data_input/Stock/apple.csv")

name2 <- "Apple, Inc."
name2_initial <- "AAPL"

apple$Company <- name2
apple$Stock.Initial <- name2_initial

apple$Date <- as.Date(apple$Date)

apple_18 <- apple %>% 
  filter(Date > "2018-01-01")

## fb data
fb <- read.csv("data_input/Stock/facebook.csv")

name3 <- "Facebook, Inc."
name3_initial <- "FB"

fb$Company <- name3
fb$Stock.Initial <- name3_initial

fb$Date <- as.Date(fb$Date)

fb_18 <- fb %>% 
  filter(Date > "2018-01-01")

## google stock
google <- read.csv("data_input/Stock/google.csv")

name4 <- "Alphabet, Inc. Class A"
name4_initial <- "GOOGL"

google$Company <- name4
google$Stock.Initial <- name4_initial

google$Date <- as.Date(google$Date)

google_18 <- google %>% 
  filter(Date > "2018-01-01")

## netflix stock
netflix <- read.csv("data_input/Stock/netflix.csv")

name5 <- "Netflix, Inc."
name5_initial <- "NFLX"

netflix$Company <- name5
netflix$Stock.Initial <- name5_initial

netflix$Date <- as.Date(netflix$Date)

netflix_18 <- netflix %>% 
  filter(Date > "2018-01-01")

## combine 5 stock data
faang <- bind_rows(amazon, apple, fb, google, netflix)

# filter date combine data
faang_start_2018 <- faang %>% 
  filter(Date >= "2018-01-01")
