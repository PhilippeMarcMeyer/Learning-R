# ------------------------+
# Listes de fréquences
# Aurélien Berra
# Version 1.2 – 2018-10-29
# ------------------------+

text <-
    scan("data/cicero/cicero_works/cicero_01.txt",
         what = "character",
         sep = "\n")
text_v <- tolower(text)

text_v <- gsub("<", "", text_v)
text_v <- gsub(">", "", text_v)
text_v <- paste(text_v, sep = " ", collapse = "")

text_l <- strsplit(text_v, "\\W")
# text_l <- strsplit(text_v, "\\s")
text_words_v <- unlist(text_l)
text_words_v <- text_words_v[text_words_v != ""]

length(text_words_v)
length(unique(text_words_v))

# Tester la présence d'occurrences de la chaîne de caractères
"pro" %in% text_words_v
# Sélectionner les positions de la chaîne de caractères dans le vecteur
text_words_v[which(text_words_v == "pro")]
# Sélectionner les occurrences de la chaîne de caractères
text_words_v[text_words_v == "pro"]


text_freq_t <- table(text_words_v)
text_freq_sorted_t <- sort(text_freq_t, decreasing = TRUE)
text_freq_sorted_t[1:10]
plot(text_freq_sorted_t[1:10], type = "l")
plot(text_freq_sorted_t[1:20], type = "l")
plot(text_freq_sorted_t[1:50], type = "l")
plot(text_freq_sorted_t[1:100], type = "l")

text_freq_rel_t <- (text_freq_t / length(text_freq_t)) * 100
text_freq_rel_sorted_t <- sort(text_freq_rel_t, decreasing = TRUE)
text_freq_rel_sorted_t[1:10]
text_freq_rel_sorted_t["est"]
# View(text_freq_rel_sorted_t)

plot(text_freq_rel_sorted_t[1:10])

plot(text_freq_rel_sorted_t[1:10], type = "l")

plot(
    text_freq_rel_sorted_t[1:10],
    type = "b",
    xlab = "Dix mots les plus fréquents",
    ylab = "Pourcentages du texte complet"
)

plot(
    text_freq_rel_sorted_t[1:10],
    type = "b",
    xlab = "Dix mots les plus fréquents",
    ylab = "Pourcentages du texte complet",
    xaxt = "n",
    main = "Mots les plus fréquents \n version 2"
)
# Valeurs de l'axe des x nommées explicitement
axis(1, 1:10, labels = names(text_freq_rel_sorted_t[1:10]))

text_freq_all_sorted_t <-
    cbind(text_freq_sorted_t, text_freq_rel_sorted_t)
# View(text_freq_all_sorted_t)

# Utiliser des listes de *stopwords*
# Voir l'exemple de `dem_corona_exercice_solution.R`

library(dplyr)
library(purrr)# contient l'opérateur %>%
`%not_in%` <- negate(`%in%`)

stopwords_latin <-
    scan("data/stopwords/stopwords_latin_v1_0.txt",
         what = 'character',
         sep = "\n")
# stopwords_greek <-
#     scan("data/stopwords/stopwords_greek_v1_0.txt",
#          what = 'character',
#          sep = "\n")

text_stop_v <-
    text_v[which(text_v %not_in% stopwords_latin)]

text_stop_t <- table(text_stop_v)
text_stop_sorted_t <- sort(text_stop_t, decreasing = TRUE)
text_stop_sorted_t[1:10]

text_stop_v <-
    text_words_v[which(text_words_v %not_in% stopwords_latin)] %>%
    table() %>%
    sort(decreasing = TRUE) %>%
    head()



# etc. : recommencer les mêmes opérations sur le vecteur `text_stop_v`
