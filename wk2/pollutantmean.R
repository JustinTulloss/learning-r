pollutantmean <- function(dir, pollutant, id = 1:332) {
    files <- sapply(id, function(i) { sprintf("%s/%03d.csv", dir, i) })
    data <- lapply(files, read.csv)
    sums <- sapply(data, function(d) {
      readings <- !is.na(d[,pollutant])
      c(sum(d[readings, pollutant]), sum(readings))
    })
    sum(sums[1,]) / sum(sums[2,])
}
