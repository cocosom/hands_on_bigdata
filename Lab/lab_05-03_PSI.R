##
## PSI
## 
##

# Sys.setlocale("LC_ALL", "korean")
# install.packages("readxl")
# install.packages("ggplot2")
# install.packages("dplyr")

library(readxl)
library(ggplot2)

getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

## Step 1: 원본 데이터 가져오기
psi_data <- read_excel("data/PSI_data.xlsx")
View(psi_data)

## If 데이터에 NA 값을 0 로 수정
# psi_data[is.na(psi_data)] <- 0

## 데이터 그룹화 검색
library(dplyr)
tmp <- group_by(psi_data, psi_data$일자) %>% summarise(n()) 
# arrange(tmp$`n()`, tmp$`psi_data$일자`)
View(tmp)

## 2012-01-10, 2012-01-11
tmp <- filter(psi_data, psi_data$품목코드=="Item_011" , psi_data$생산량 > 0)

## 생산량(P) 데이터 시각화 
plot(tmp$생산량)
plot(tmp$생산량, type = "l")
plot(tmp$생산량, type = "l", main="생산량 분포")
lines(lowess(tmp$생산량))

## 판매량(S) 데이터 시각화 
plot(tmp$판매량)
plot(tmp$판매량, type = "l")
plot(tmp$판매량, type = "l", main="판매량 분포")
plot(tmp$판매량, type = "l", col='red', main="판매량 분포")
lines(lowess(tmp$판매량))

## 재고량(I) 데이터 시각화 
hist(tmp$재고량)
hist(tmp$재고량, main="재고량 분포")
lines(lowess(tmp$재고량))

## 여러 개의 그래프를 하나에 그리기(Combining Graphs)
# par(mfrow = c(1, 1))
# par(mfrow = c(1, 3))
par(mfrow = c(2, 2))
plot(tmp$판매량, type = "l", col='red', main="판매량 분포")
plot(tmp$생산량, type = "l", main="생산량 분포")
hist(tmp$재고량, main="재고량 분포")


#plot(tmp$일자, tmp$판매량, col="red", type = "l", xlim=range(tmp$일자), ylim=range(tmp$판매량,tmp$생산량))
#points(tmp$일자, tmp$생산량, type = "l", xlim=range(tmp$일자), ylim=range(tmp$판매량,tmp$생산량))

## ggplot()
## 산점도 / 산포도  geom_point( )
## 선 그래프        geom_line( )
## 박스플롯         geom_boxplot( )
## 히스토그램       geom_histogram( )
## 막대 그래프      geom_bar( )

## P: 생산량
ggplot(psi_data, aes(x=일자, y=생산량 )) + geom_line()
ggplot(tmp, aes(x=일자, y=생산량 )) + geom_line()

ggplot(psi_data, aes(x=일자, y=생산량 )) + geom_bar()


tmp <- filter(psi_data, psi_data$품목코드=="Item_032" )

## S: 판매량
ggplot(psi_data, aes(x=일자, y=판매량 )) + geom_line()
ggplot(tmp, aes(x=일자, y=판매량 ), fill='#CC3399') + geom_line()


## I
#ggplot(psi_data, aes(재고량)) + geom_histogram()
ggplot(psi_data, aes(x = 일자, y = 재고량)) + geom_bar(stat = "재고량")


ggplot(psi_data, aes(재고량), fill='red') + geom_area(stat='count')
ggplot(psi_data, aes(x=일자, y = 재고량, fill = 'red')) + geom_area()
#table(psi_data$재고량)

ggplot(tmp, aes(x=일자, y = 재고량)) + geom_area()


