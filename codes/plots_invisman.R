library(tidyverse)
library(wordcloud)

# Bar graph for most 10 frequent occuring words
frequency %>% top_n(10) %>% mutate(word=reorder(word,n))%>% ggplot(aes(word,n))+geom_col()+xlab("Words")+ylab("Frequency")+coord_flip()
ggsave("Top_10frequentword",)


# Word cloud
set.seed(30)
frequency %>% with(wordcloud(word,n,max.words = 50,scale=c(6,0.5)))