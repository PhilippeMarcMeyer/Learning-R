text<-scan("files/loremipsum.txt", 
           what="character", 
           sep="\n")

text_v <- tolower(text) # length 5

# useful to keep
#text_v <- gsub("<", "", text_v)
#text_v <- gsub(">", "", text_v)

#Concatenate vectors after converting to character.
text_v <- paste(text_v, sep = " ", collapse = "")  # length 1

text_words_l <- strsplit(text_v, "\\W") # use a list
text_words_v <- unlist(text_words_l) # go back to vector  # length 602
text_words_v <- text_words_v[text_words_v != ""]# keep only the non empty words length 491

text_freq_t <- table(text_words_v) #go to a kind of groupby : unique words with frequencies
text_freq_sorted_t <- sort(text_freq_t, decreasing = TRUE)  # length 143

# total différent words
nrWords <- length(text_freq_sorted_t)

# make a percentage column
text_freq_rel_t <- (text_freq_sorted_t / nrWords) * 100

# add precents to matrix
text_freq_all_sorted_t <-
  cbind(nr=text_freq_sorted_t, pc=text_freq_rel_t)

# convert to df
text_freq_all_sorted_df <- as.data.frame(text_freq_all_sorted_t)

# Make a selection vector to get extract the top part of the df >= 5 %
select_v <- text_freq_all_sorted_df$pc >= 5 
# apply the selection vector
text_freq_all_min5pc_df <- text_freq_all_sorted_df[select_v,]




