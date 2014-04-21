readdata <- function(dir, id) {
    files <- sapply(id, function(i) { sprintf("%s/%03d.csv", dir, i) })
    lapply(files, read.csv)
}
