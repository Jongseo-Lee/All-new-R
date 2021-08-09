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

exam %>%  # 정렬하기
  select(id, math) %>% 
  head(10)
exam %>% 
  arrange(math)
exam %>% 
  arrange(desc(math))
exam %>% 
  arrange(class, math)

exam %>% # 파생변수 추가하기 2(이게 더 편함) 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>%
  head
exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head
