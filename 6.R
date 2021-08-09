install.packages("dplyr")
install.packages("ggplot2")
library(dplyr) # 데이터 분류
library(ggplot2)
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
exam %>%  
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

exam %>% # 기본 요약
  summarise(mean_math = mean(math))
exam %>% # 집단 한꺼번에 추출
  group_by(class) %>% 
  summarise(mean_math = mean(math))
exam %>%  # 여러 요약통계량 한번에
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n()) # 데이터가 몇행으로 이루어졌는지를 구함

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% #실습하기
  group_by(manufacturer) %>% # 회사별로
  filter(class == "suv") %>% # suv 자동차의
  mutate(total = (cty+hwy)/2) %>% # 통합연비를 구하여
  summarise(mean_total = mean(total)) %>% # 평균을 낸 다음
  arrange(desc(mean_total)) %>% # 내림차순으로로 정렬
  head(5)
  
mpg %>% # 실습하기 2
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>%
  head(3)
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))

test1 <- data.frame(id = c(1,2,3,4,5),  # 데이터 합치기
                    midterm = c(60,80,70,90,85))          
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2
total <- left_join(test1, test2, by="id")
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
exam_new <- exam
exam_new <- left_join(exam, name, by="class")
exam_new

group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_a
group_b
group_all <- bind_rows(group_a, group_b)
group_all

midwest <- data.frame(ggplot2::midwest) # 실습하기
midwest <- midwest %>% 
  mutate(ratio_child = (poptotal-popadults)/poptotal * 100)
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)

midwest <- midwest %>% 
  mutate(grade = ifelse(ratio_child >= 40, "Large",
                        ifelse(ratio_child >= 30, "Middle", "Small")))
table(midwest$grade)

midwest <- midwest %>% 
  mutate(ratio_asian = (popasian/poptotal) * 100) %>% 
  arrange(ratio_asian) %>%
  select(state, county, ratio_asian) %>% 
  head(10)

