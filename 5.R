df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new <- df_raw #변수명 변경 
df_new <- rename(df_new, v2= var2) 
df_new

df_new$var_sum <- df_new$var1 + df_new$v2 # 파생 변수 추가
df_new
mpg
head(mpg)
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

#조건문 활용 파생변수 만들기
summary(mpg$total)
hist(mpg$total)
ifelse(mpg$total >=20, "pass", "fail")
mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
head(mpg, 20)
table(mpg$test)
library(ggplot2)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)
qplot(mpg$grade)
