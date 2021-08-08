library(ggplot2) # 데이터 프레임화
df_mid <- data.frame(midwest)
head(df_mid, 20)

library(dplyr) # 변수명 변경
df_js <- df_mid
df_js <- rename(df_js, total = poptotal)
head(df_js, 10)
df_js <- rename(df_js, asian = popasian)
head(df_js, 10)

df_js$asian_percent <- df_js$asian/df_js$total*100 # 새 변수 만들기
head(df_js, 10)
help(midwest)
hist(df_js$asian_percent)
summary(df_js$asian_percent)
mean <- 0.004872
mean

df_js$size <- ifelse(df_js$asian_percent >= mean, "Large", "Small") # 파생변수
head(df_js, 10)

table(df_js$size) # 테이블 그려서 큐플롯 만들기
qplot(df_js$size)
