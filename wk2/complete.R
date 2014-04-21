source('reader.R')

complete <- function(dir, id = 1:332) {
    data <- readdata(dir, id)
    cases <- lapply(data, complete.cases)
    sums <- sapply(cases, sum)
    data.frame(id = id, nobs = sums)
}
