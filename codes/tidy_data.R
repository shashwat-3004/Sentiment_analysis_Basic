library(tidyverse)
library(tidytext)
head(raw_book)

# Upto row number 43, there is Chapter name only,so it is removed
raw_book<-raw_book[44:nrow(raw_book),]
rownames(raw_book)<-1:nrow(raw_book)


# Adding line numbers and chapter number in the data
tidy_book<-raw_book %>% mutate(line_number=row_number(),Chapter=cumsum(str_detect(text,pattern=regex("chapter [\\dixlvc]+",ignore_case = TRUE))))

#Tokenization
tidy_book<-tidy_book %>% unnest_tokens(word,text)
tidy_book<-tidy_book[,-1]
#####
data("stop_words") #dataset of random word like "the" which are used everytime
## Frequency of words
frequency <-tidy_book %>% count(word,sort=TRUE) %>%anti_join(stop_words)
####

write.csv(tidy_book,"tidy_invisible_man.csv")
write.csv(frequency,"word_frequency_invisibleman.csv")