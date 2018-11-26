text<-scan("files/loremipsum.txt", what="character", sep="\n")
#text<-scan(choose.files(), what="character", sep="\n")

words_list <- strsplit(text, "\\W+", perl=TRUE)
tolower(words_list[])

words_vector <- unlist(words_list)
nrWords <- length(words_vector)
df <- data.frame(words = words_vector)
freq <- table(df$words)
freq_sorted <-sort(freq,decreasing=TRUE)
df <-  as.data.frame(freq_sorted)
df$pc  <- nrWords
df$pc <- df$Freq / df$pc
