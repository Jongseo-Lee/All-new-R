library(dplyr)
library(ggplot2)

# 결측치 찾기
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df) # 데이터에 결측치가 있으면 NA 반환

df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df_n <- df %>% filter(!is.na(score))
mean(df_n$score)
sum(df_n$score)

df_n <- df %>% filter(!is.na(score) & !is.na(sex)) # 동시에 결측치 없는 데이터 추출
df_n2 <- na.omit(df) # 결측치 하나라도 있으면 싹 제거, filter 사용 권장
df_n2

mean(df$score, na.rm = T) # 함수사용 결측치 제거, 함수마다 사용가능 여부가 다름
sum(df$score, na.rm = T)
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam

# 실습하기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

# 이상치 제거
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

boxplot(mpg$hwy)$stats
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)      
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))

# 실습하기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("r", "f", "4"), mpg$drv, NA)
table(mpg$drv)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
