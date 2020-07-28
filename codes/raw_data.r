# Taking text data of the book Invisible man by H.G. Wells

library(gutenbergr)
raw_book<-gutenberg_download(5230) #The gutenberg id for the book
write.csv(raw_book,"invisible_man.csv") 