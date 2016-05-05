tarea2 <- function()
{
  library(foreign)
  library(caret)
  library(PerformanceAnalytics)
  library(dplyr)
  
  seismic <- read.arff(file = "seismic-bumps.arff")
  
  numerics <- select(seismic, -seismic, -seismoacoustic, -ghazard, -class, -shift)
  namesHelper <- names(numerics)
  numerics <- normalize(numerics)
  numerics <- as.data.frame(numerics)
  names(numerics) <- namesHelper
  
  seismic2 <- seismic
#   seismic2$genergy = numerics$genergy
#   seismic2$gpuls = numerics$gpuls
#   seismic2$gdenergy  = numerics$gdenergy
#   seismic2$gdpuls  = numerics$gdpuls
#   seismic2$nbumps  = numerics$nbumps
#   seismic2$nbumps2  = numerics$nbumps2
#   seismic2$nbumps3  = numerics$nbumps3
#   seismic2$nbumps4  = numerics$nbumps4
#   seismic2$nbumps5  = numerics$nbumps5
#   seismic2$nbumps6  = numerics$nbumps6
#   seismic2$nbumps7  = numerics$nbumps7
#   seismic2$nbumps89  = numerics$nbumps89
#   seismic2$energy  = numerics$energy
#   seismic2$maxenergy = numerics$maxenergy

  seismic2$seismic <- as.integer(seismic$seismic)
  seismic2$seismoacoustic <- as.integer(seismic$seismoacoustic)
  seismic2$shift <- as.integer(seismic$shift)
  seismic2$ghazard <- as.integer(seismic$ghazard)
  seismic2$class<- as.integer(seismic$class)
  
  smp_size <- floor(0.75 * nrow(seismic))
  set.seed(42)
  train_ind <- sample(seq_len(nrow(seismic)), size = smp_size)
  seismicTrain <- seismic2[train_ind, ]
  seismicTest <- seismic2[-train_ind, ]
  
  models <- c()
  geoMeans <- c()
  errors <- c()
  
  for(i in 2:10)
  {
    m <- knn(train = seismicTrain, test = seismicTest, cl = seismicTrain$class, k = i)
    models <- cbind(models, m)
    cm <- confusionMatrix(m, seismicTest$class)
    geoMeans <- c(geoMeans, mean.geometric(cm$byClass))
    errors <- c(errors, ((cm$table[2]+cm$table[3])/sum(cm$table)) )
  }

  plot(2:10, geoMeans)
  plot(2:10, errors)
  
  salesCostumers <- read.csv("Wholesale customers data.csv")
  
  idx.to.remove <-integer(0) #Initialize a vector to hold customers being removed
  for (c in 3:8){ # For every column in the data we passed to this function
    col.order <-order(salesCostumers[,c],decreasing=T) #Sort column "c" in descending order (bigger on top)
    #Order returns the sorted index (e.g. row 15, 3, 7, 1, ...) rather than the actual values sorted.
    idx <-head(col.order, 5) #Take the first n of the sorted column C to
    idx.to.remove <-union(idx.to.remove,idx) #Combine and de-duplicate the row ids that need to be removed
  }
  
  
  top.custs <-top.n.custs(salesCostumers,cols=3:8,n=5)
  length(idx.to.remove) #How Many Customers to be Removed?
  salesCostumers[idx.to.remove,] #Examine the customers
  data.rm.top<-salesCostumers[-c(idx.to.remove),] #Remove the Customers
  
}

top.n.custs <- function (data,cols,n=5) { #Requires some data frame and the top N to remove
  idx.to.remove <-integer(0) #Initialize a vector to hold customers being removed
  for (c in cols){ # For every column in the data we passed to this function
    col.order <-order(data[,c],decreasing=T) #Sort column "c" in descending order (bigger on top)
    #Order returns the sorted index (e.g. row 15, 3, 7, 1, ...) rather than the actual values sorted.
    idx <-head(col.order, n) #Take the first n of the sorted column C to
    idx.to.remove <-union(idx.to.remove,idx) #Combine and de-duplicate the row ids that need to be removed
  }
  return(idx.to.remove) #Return the indexes of customers to be removed
}



duration
campaign
pdays
previous
emp.var.rate
cons.price.idx
cons.conf.idx
euribor3m
nr.employed


bankDiscrete$age <- discretize(bank$age, method = "cluster", categories = 10)
bankDiscrete$duration <- discretize(bank$duration, method = "cluster", categories = 10)
bankDiscrete$campaign <- discretize(bank$campaign, method = "cluster", categories = 10)
bankDiscrete$pdays <- discretize(bank$pdays, method = "cluster", categories = 10)
bankDiscrete$previous <- discretize(bank$previous, method = "cluster", categories = 5)
bankDiscrete$emp.var.rate <- discretize(bank$emp.var.rate, method = "cluster", categories = 10)
bankDiscrete$cons.price.idx <- discretize(bank$cons.price.idx, method = "cluster", categories = 10)
bankDiscrete$cons.conf.idx <- discretize(bank$cons.conf.idx, method = "cluster", categories = 10)
bankDiscrete$euribor3m <- discretize(bank$euribor3m, method = "cluster", categories = 10)
bankDiscrete$nr.employed <- discretize(bank$nr.employed, method = "cluster", categories = 10)
model1 <- apriori(data = bankDiscrete, parameter = list(supp = 0.7, conf = 0.8))
model2 <- apriori(data = bankDiscrete, parameter = list(supp = 0.7, conf = 0.8), appearance = list(rhs=c("y=No", "y=Yes")))

rules.sorted <- sort(model3, by="lift")
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)
# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)






