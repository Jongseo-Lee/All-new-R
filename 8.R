library(ggplot2)

# ggplot은 세가지로 구분, 데이터 + 그래프 종류 +  세부설정
ggplot(data = mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  xlim(3, 6) +
  ylim(1, 30)

library(dplyr)
df_mpg <- mpg %>% 
  group_by(drv) %>%
  filter(!is.na(drv)) %>% # NA값 제외
  summarise(mean_hwy = mean(hwy))
df_mpg

# 내림차순은 정렬 기준 변수 앞에 -
ggplot(data = df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()
# 빈도 막대 그래프
ggplot(data = mpg %>% filter(!is.na(drv)), aes(x = drv)) + geom_bar()
# 변수 분포 그래프
ggplot(data = mpg %>% filter(!is.na(drv)), aes(x = hwy)) + geom_bar()
# 시계열 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
# box plot
ggplot(data = mpg %>% filter(!is.na(drv)), aes(x = drv, y = hwy)) + geom_boxplot()
