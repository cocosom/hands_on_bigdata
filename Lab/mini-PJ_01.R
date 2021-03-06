##
## mini Project 01 : 환율 계산기
##
## update: 19.12.11

## =====================================================
## 01. 환경정보 초기화
## =====================================================

  ## enviroment clean: 환경데이터 제거하기
  rm(list=ls())
  ## Plots clean: Plot  제거하기
  #dev.off()
  if(!is.null(dev.list())) dev.off()

  ## Check 한글 모드 
  Sys.getlocale()
  ## [1] "LC_COLLATE=English_United States.1252;LC_CTYPE=English_United States.1252;LC_MONETARY=English_United States.1252;LC_NUMERIC=C;LC_TIME=English_United States.1252"
  Sys.setlocale("LC_ALL", "korean")
  ## [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"

## =====================================================
## 02. Main
## =====================================================
print("** 환율 계산기 ")

# 환율계산식:  달러화 = 원화/환율 

print("1) 원화 입력:")
won <- scan(n=1)

print("2) 환율 입력:")
rate <- scan(n=1)

## 환율 계산식
dollar <- won/rate
#print(dollar)

## 달러 출력
cat("대한민국 KRW[", won, "원] = 미국 USD[$", dollar, "]\n")
cat("환율: $1=", rate, "원\n")

## END
# ====<< 함수 정리 >>============
#
# R 입력 함수: scan()
# R 출력 함수: print(), cat()
#
# ===============================

