source('complete.R')

corr <- function(dir, threshold = 0) {
    completions <- complete(dir)
    legit <- completions[completions$nobs > threshold, 'id']
    data <- readdata(dir, legit)
    vapply(data, function(d) {
        filtered = d[complete.cases(d), ]
        cor(filtered$nitrate, filtered$sulfate)
    }, FUN.VALUE=0)
}
