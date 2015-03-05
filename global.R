require(shiny)
require(googleVis)
source('carousel.R')

set.seed(55)

models <- read.csv(file = 'data/models.csv', sep = ';')
data <- head(read.csv(file = 'data/dataset.csv', sep = ';'),15)
states <-  read.csv(file = 'data/States.csv', sep = ';')
var <-  read.csv(file = 'data/var.csv', sep = ';')
roc <-  read.csv(file = 'data/roc.csv', sep = ';')
bestparam <-  read.csv(file = 'data/bestparam.csv', sep = ';')
