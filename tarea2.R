tarea2 <- function()
{
  library(foreign)
  library(caret)
  library(PerformanceAnalytics)
  library(dplyr)
  
#   seismic <- read.arff(file = "seismic-bumps.arff")
#   
#   numerics <- select(seismic, -seismic, -seismoacoustic, -ghazard, -class, -shift)
#   namesHelper <- names(numerics)
#   numerics <- normalize(numerics)
#   numerics <- as.data.frame(numerics)
#   names(numerics) <- namesHelper
#   
#   seismic2 <- seismic
# #   seismic2$genergy = numerics$genergy
# #   seismic2$gpuls = numerics$gpuls
# #   seismic2$gdenergy  = numerics$gdenergy
# #   seismic2$gdpuls  = numerics$gdpuls
# #   seismic2$nbumps  = numerics$nbumps
# #   seismic2$nbumps2  = numerics$nbumps2
# #   seismic2$nbumps3  = numerics$nbumps3
# #   seismic2$nbumps4  = numerics$nbumps4
# #   seismic2$nbumps5  = numerics$nbumps5
# #   seismic2$nbumps6  = numerics$nbumps6
# #   seismic2$nbumps7  = numerics$nbumps7
# #   seismic2$nbumps89  = numerics$nbumps89
# #   seismic2$energy  = numerics$energy
# #   seismic2$maxenergy = numerics$maxenergy
# 
#   seismic2$seismic <- as.integer(seismic$seismic)
#   seismic2$seismoacoustic <- as.integer(seismic$seismoacoustic)
#   seismic2$shift <- as.integer(seismic$shift)
#   seismic2$ghazard <- as.integer(seismic$ghazard)
#   seismic2$class<- as.integer(seismic$class)
#   
#   smp_size <- floor(0.75 * nrow(seismic))
#   set.seed(42)
#   train_ind <- sample(seq_len(nrow(seismic)), size = smp_size)
#   seismicTrain <- seismic2[train_ind, ]
#   seismicTest <- seismic2[-train_ind, ]
#   
#   models <- c()
#   geoMeans <- c()
#   errors <- c()
#   
#   for(i in 2:10)
#   {
#     m <- knn(train = seismicTrain, test = seismicTest, cl = seismicTrain$class, k = i)
#     models <- cbind(models, m)
#     cm <- confusionMatrix(m, seismicTest$class)
#     geoMeans <- c(geoMeans, mean.geometric(cm$byClass))
#     errors <- c(errors, ((cm$table[2]+cm$table[3])/sum(cm$table)) )
#   }
# 
#   plot(2:10, geoMeans)
#   plot(2:10, errors)
  
  salesCostumers <- read.csv("Wholesale customers data.csv")
  
  
}

