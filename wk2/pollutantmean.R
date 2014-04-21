readdata <- function(dir, id) {
    files <- sapply(id, function(i) { sprintf("%s/%03d.csv", dir, i) })
    lapply(files, read.csv)
}

pollutantmean <- function(dir, pollutant, id = 1:332) {
    data <- readdata(dir, id)
    sums <- sapply(data, function(d) {
      readings <- !is.na(d[,pollutant])
      c(sum(d[readings, pollutant]), sum(readings))
    })
    mean <- sum(sums[1,]) / sum(sums[2,])
    round(mean, 3)
}

complete <- function(dir, id = 1:332) {
    data <- readdata(dir, id)
    cases <- lapply(data, complete.cases)
    sums <- sapply(cases, sum)
    data.frame(id = id, nobjs = sums)
}
