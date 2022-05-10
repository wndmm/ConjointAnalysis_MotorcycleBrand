
# Load Packages
library(conjoint)
library(tidyverse)
# library(fpc)
library(ggplot2)

# Import Data
XCA <-  read.csv(file.choose(), header = T) # upload x dari data y
YCA <-  read.csv(file.choose(), header = T) # upload y dari data x
ZCA <-  read.csv(file.choose(), header = T) # z as z 

ZCA <- as.factor(ZCA$levels) # set z as factor
ZCA <- data_frame(ZCA) # balikin z as data frame


# Lihat masing-masing data
XCA
YCA
ZCA

# Utilities
utilities <- caUtilities(x=XCA, y=YCA, z=ZCA)
print(utilities)

# Importance
YCA <- as.integer(YCA$Profile.1, YCA$Profile.2, YCA$Profile.3, YCA$Profile.4, YCA$Profile.5,
                  YCA$Profile.6, YCA$Profile.7, YCA$Profile.8, YCA$Profile.9) 
# setting y as integer 9 variable jadi integer 1;57

YCA <- data_frame(YCA)# setting y as data frame dari format integer 1;57

# COBA ANJIR BISA 
importance <- caImportance(y=YCA, x=XCA)
importance
print(importance)

# Visualize Importance
barplot(importance, 
        names.arg = c("Merk", "Harga", "Fitur", "Design"),
        ylab = "Average Importance", xlab = "Attributes")

# Complete Result
Conjoint(y=YCA, x=XCA, z=ZCA)

# Membuat Cluster
segments <- caSegmentation(y=YCA, x=XCA,c = 2)
segments
print(segments)

# Visualisasi Cluster
plotcluster(segments$util,segments$sclu)
print(segments$util)
print(segments$sclu)

############## SEBAGAI PERBANDINGAN ############

# Import Data
#data(ice)

# Utilities
#utilities <- caUtilities(x=iprof, y=ipref, z=ilevn)

# Importance
#importance <- caImportance(x=iprof, y=ipref)
#importance

# Visualize Importance
#barplot(importance, 
 #       names.arg = c("flavour", "price", "container", "topping"),
  #      ylab = "Average Importance", xlab = "Attributes")

# Complete Result
#Conjoint(y=ipref, x=iprof, z=ilevn)

# Membuat Cluster
#segments <- caSegmentation(y=ipref, x=iprof,c = 2)
#segments

# Visualisasi Cluster
#plotcluster(segments$util,segments$sclu)
