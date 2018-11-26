text<-scan("files/loremipsum.txt", 
           what="character", 
           sep="\n")

text_v <- tolower(text)

text_v <- gsub("<", "", text_v)
text_v <- gsub(">", "", text_v)
text_v <- gsub("  ", " ", text_v)

text_v <- paste(text_v, sep = " ", collapse = "")

text_words_l <- strsplit(text_v, "\\W")
text_words_v <- unlist(text_words_l)
text_words_v <- text_words_v[text_words_v != ""]

text_freq_t <- table(text_words_v)
text_freq_sorted_t <- sort(words=text_freq_t, decreasing = TRUE)

nrWords <- length(text_freq_sorted_t)
text_freq_rel_t <- (text_freq_sorted_t / nrWords) * 100

text_freq_all_sorted_t <-
  cbind(nr=text_freq_sorted_t, pc=text_freq_rel_t)

#percentage_v <- text_freq_all_sorted_t[,1]
#select_vector <- percentage_v >= 5
#text_freq_all_top5pc_t <- text_freq_all_sorted_t[select_vector,]







