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

