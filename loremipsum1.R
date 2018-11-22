#my_data <- read.csv("myText.csv")
#my_data <- read.delim(file.choose())

my_data <- read.delim('C:\Webs\Learning-R\files\loremipsum.txt')


# We have a dataframe
# class(my_data) gives me : [1] "data.frame"

# my_data[1,1]  gives me the first ROW (there is only ) corresponding to the first paragraph (or line)

# my_data[1:4,1] or my_data[,1] shows the 4 paragraphs as rows

# naming my chapters
x <- 0:length(my_data[,1] )
names <- sprintf("chapter %d",x)
rownames(my_data) <- c(names)

