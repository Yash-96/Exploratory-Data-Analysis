## install devtools package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
## install mapproj package if it's not already
if (!requireNamespace("mapproj", quietly = TRUE)) {
  install.packages('mapproj')
}

## install dev version of rtweet from github
devtools::install_github("mkearney/rtweet")

## Function to remove rows based on NA value in particular column
completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
## load rtweet package and other package
library(rtweet)
library(mapproj)

## twitter credentials
create_token(
  app = "my_twitter_research_app",
  access_token = '158904066-8UrgRY8p66DicZ5leg64B3cbNGhlopbSDnX8In3B',
  access_secret = 'SYNq5Ls98oD4VnGYZ39nqFm8YZjYvNrUptHNLVSM9PLqv',
  consumer_key = 'CS6hB0QXIphgzC55W86QqP4EO',
  consumer_secret = 'YkWolqp6TK8umMlkg980yVYXDePm8LTt8MYhmDaRexfmDJd9rB')

## twitter search
terms <- "basketball"
rt <- search_tweets(terms, geocode = lookup_coords("usa"), n = 30000)
rt <- data.frame(rt)
filter<-rt[!duplicated(rt$status_id), ]
filter<-filter[!filter$is_retweet,]
filter <- apply(filter,2,as.character)
write.csv(filter, file = "basketball.csv", append= T, row.names=FALSE, col.names = TRUE)

my_data=read.csv('basketball.csv')
my_data=data.frame(my_data)
write.table(str_replace_all(my_data$text, "[\r\n]"," "), file = "basketball.txt", sep = "\n", row.names=FALSE, col.names = FALSE, quote=FALSE)

