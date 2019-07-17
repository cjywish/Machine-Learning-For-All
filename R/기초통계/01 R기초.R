rm(list = ls())

##################################################################################
# 1. 개요 ----------------------------------------------------------------
##################################################################################

#(1)라이브러리 -------------------------------------------------------------
.libPaths()

# 관리자 권한으로 실행해야 함.
install.packages("ggplot2")

library(ggplot2)

detach("package:ggplot2", unload = T)


#(2)도움말 -------------------------------------------------------------

?seq

??se

example(seq)

install.packages("sos")
library(sos)

findFn("Logistic Regression", maxPages = 2)

# 주석입니다1 ----

example(seq)

# 주석2


##################################################################################
# 2.3 데이터형식 ----------------------------------------------------------------
##################################################################################

#(1)변수 -------------------------------------------------------------
 
a <- 3
b = 4.5
c <- a + b
c

#(2)스칼라 -------------------------------------------------------------
d <- "Hello"
e <- 'R World!'
f <- d + e

#Error in d + e : non-numeric argument to binary operator
f <- paste(d, e, sep = ' ')
f


# true & false
T & F
TRUE | FALSE

c(TRUE, T) & c(FALSE, F)
c(TRUE, T) && c(FALSE, F)


# factor
gender <- factor('male', c('male', 'female'))

# (3) vector -----
x <- c(1,2,3,4,5)
x

y <- c('a','b','c','d',2)
y

# 표현식 : ':'
1:10
x1 <- 1:10
x1

x[2]
y[2:4]
y[c(2,3,4)]
x1 <- 1:20
seq(1,20,1)
seq(1,10,.2)
rep(x1,2)
rep(5:10,2)
length(x1)
x ; x1
x + x1
x - x1
x * x1
x / x1


# (4) data frame ----
df <- data.frame(x=1:5, y = seq(2,10,2))
df$x[2]  # = df[2,1] $은 데이터 프레임의 변수(칼럼) 접근 가능

# [ , ]은 index 이며, 숫자 or 변수명 or 조건식 or function 을 사용할 수 있다.

df$x ; df[2:3,1]
df$y ; df[,2]
df

# adding column
df$z <- c("kim","lee","park","han","kang")
df
df[,"y"]
df$z
df[,3]
df[1,3]
df[2:3,c("x","z")]
df[2:3,c(1,3)]
class(cars)
?cars
str(cars)
nrow(cars)
head(cars)
tail(cars)

head(cars, 20)
tail(cars, 2)

df
names(df)
#changing column name
names(df) <- c("CustomerID","Age", "LastName")
df
df[4:5,]

data(package = 'ggplot2')
data(package = "datasets")
airquality[, "Month"] = 8
rm(airquality)
data("airquality")
head(airquality)

# (5) list -------------------------------------------------------------

x <- list(name="hanky"
          , sight = c(0.8, 0.5))
class(x)
x
x[2]
x2 <- x[[2]]
x[[2]][1:2]
x$sight[1:2] # $은 list의 key 접근 가능

x$sight
x$sight[1]

cars
a<- lapply(cars, sum)
class(a)
a
a$speed


# (6) matrix -------------------------------------------------------------
matrix(1:9, nrow = 3)
matrix(1:9, nrow = 3, byrow = T)
matrix(1:9, nrow = 3
       , dimnames = list(c("r1","r2","r3")
                         ,c("c1","c2","c3")))

m <- matrix(1:9, nrow = 3)
m[2,3]
m[2,]

# []에서의 표현 : [행,열]
m
m[1,]
m[,1]
m[1,1:3]
m[1,1:2]
m[1,c(1,3)]

m1 <- matrix(1:9, nrow = 3
       , dimnames = list(c("r1","r2","r3")
                         ,c("c1","c2","c3")))

m1["r1",]

m2 <- matrix(1:9, nrow = 3)
m3 <- matrix(1:9, nrow = 3, byrow = T)

m2 * 2
m2[,3] <- c(10,11,12)
m2 + m3
m2 * m3
m2;m3
m2 %*% m3
solve(m2)
det(m2)

m4 <- matrix(1:4, nrow = 2)
m4
solve(m4)
m5 <- solve(m4)

# 행렬과 역행렬의 곱은 단위행렬
m4 %*% m5

t(m4)


# (7) 데이터 형식 다루기 -------------------------------------------------------------
class(m1)
class(df)

df2m <- as.matrix(df)
m12df <- as.data.frame(m2)

class(df2m)
class(m12df)
m12df

# (8) NA, NULL -------------------------------------------------------------
df$City <- c("Seoul","Busan",NA,NA,"Incheon")
df
is.na(df)
colSums(is.na(df))

is.na(df$City)
# df$columns[index or index:index or function() or c( ) ]
df$City[is.na(df$City)]
df$City[is.na(df$City)] <- "Daejeon"
df$City
df

df2 <- df

df2$City <- NULL # 열 삭제 효과
df2
i <- NULL

is.null(i)


##################################################################################
# 연습문제 ----------------------------------------------------------------
##################################################################################

#1. 1부터 10까지, 0.5씩 증가시킨 값들로 구성된 벡터를 변수 v 에 저장하시오.
v <- seq(1, 10, .5)

#2. 벡터의 평균(mean), 표준편차(sd)를 구하시오
mean(v) ; sd(v)

#3. 벡터형 변수 v에서 세번째에서 여섯번째까지의 값을 조회하시오.
v[3:6]

#4. 벡터형 변수 v의 값을 두배로 만들어 변수 v2에 담으시오.
v2 <- rep(v, 2)

#5. 변수 v와 변수 v2를 더하시오.
v + v2
