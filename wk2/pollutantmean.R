source('reader.R')

pollutantmean <- function(dir, pollutant, id = 1:332) {
    data <- readdata(dir, id)
    sums <- sapply(data, function(d) {
      readings <- !is.na(d[,pollutant])
      c(sum(d[readings, pollutant]), sum(readings))
    })
    mean <- sum(sums[1,]) / sum(sums[2,])
    round(mean, 3)
}

