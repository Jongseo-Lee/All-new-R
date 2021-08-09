install.packages("dplyr")
library(dplyr) # 데이터 분류
exam <- read.csv("csv_exam.csv")
exam
exam %>% filter(class == 1) # 구분하기
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(class == 1 & math >=50)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5)) # 간결하게 쓰기

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)
mean(class2$math)

exam %>% select(math)
exam %>% select(class, math, english)
exam %>% select(-math)

exam %>% 
  filter(class == 1) %>%
  select(english) # 섞어서 사용 가능

exam %>% 
  select(id, math) %>% 
  head


