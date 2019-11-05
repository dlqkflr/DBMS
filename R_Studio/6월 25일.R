y <-3

v <- c(3,1,TRUE)
t <- c(4,1,FALSE)
print(v&t)
print(v&&t)
print(v|t)
print(v||t)

a1 <- 1
a2 <- c(2)
a3 <- c(1,2,FALSE) # r은 벡터형식으로 데이터를 바꾼뒤 수식을 처리하기때문에 
                   # 수학적 공식에 최적합 되있다 그러기에 벡터형식이 기본


b1 <- TRUE
class(b1)
mode(b1)
b2 <- 24.5
class(b2)
mode(b2)
b3 <- 3L
class(b3)
mode(b3)


b4 <- "TRUE"
mode(b4)

b5 <- 3+4i
mode(b5)

apple <- c('red')
mode(apple)
apple2 <- c('red','yellow')
mode(apple2)

apple3 <- c('red','yellow', 20)
apple3
mode(apple3)

x1 = c(1,"Hello", TRUE, 2+3i)
mode(x1)
x1[1]


data <- 'test data'
data2 <- "test data"
ls()
rm(list= ls())

data3 <- "I am"
data4 <- "a Boy"
data5 <- paste(data3, data4)
data5
paste(data3,data4, sep = "")
paste(data3, data4, sep = "-")


# format
format(120.333333, digits = 4)
format(14.7, width = 10)
data6 <- "This is mine, Have good lunch"
substring(data6, 2, 4)


#seq
data7 <- seq(5, 9)
data7
data8 <- seq(5, 9, by = 0.5)
data8

#
data9 <- c('sun','mon','tue','web','thur','fri','sat')
length(data9)
data9[1]
data9[c(1)]
data9[c(1,2)]
data9[c(1,3)]
data9[c(1:3)]
data9[c(-1)]
data9[c(-1,-3)]
data9[c(TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE)]

data10 <- c(1,2)
data11 <- c(3,4)
data10 + data11
data12 <- c(1,2,1,2)
data12 + data11

# sort
data13 <- c(1,2,3,4,10,9,8,7,6,5)
sort(data13)
sort(data13, decreasing = TRUE)
data13.test <- c(1,3,4)
data13.test

ls()


# names
data14 <- c(1,2,3,4)
names(data14) <- c("one","Two","Three","Four")
print(data14)


data21 <- c("East","West","East","North","North","East")
data22 <- factor(data21, levels = c("East","West","North"))
data22
data23 <- factor(data21, levels = c("East","West","North","South"))
data23
data24 <- gl(3, 4, labels = c("East","West","South"))
data24

#Matrix
data25 <- matrix(c(1,2,3,4))
data25
data26 <- matrix(c(1,2,3,4),nrow = 2)
data26
data27 <- matrix(3:14, nrow = 4)
data27
data28 <- matrix(1:6, nrow = 2, ncol = 3)
data28

data29 <- matrix(3:14, nrow = 4, byrow = FALSE)
data29

data30 <- matrix(3:14, nrow = 4, byrow = TRUE,
                 dimnames = list(c('row1','row2','row3','row4'),
                                 c('col1','col2','col3')))
data30

data29[1,3]
data29[4,2]
data29[2,]
data29[,3]

data31 <- data29
data29
data31
data32 <- data29 + data31
data32

# array
data33 <- c(1,2,3)
data34 <- c(10,11,12,13,14,15)

data35 <- array(c(data33,data34),dim = c(3,3,2))
data35
data35[3,,]

sprintf("%.4f",1.2)

# List

data37 <- list("Apple","Green", 10.20, c(1,2,3,4),c('test1','test2',3))
data37

data38 <- list("Apple","Green", 10.20, c(1,2,3,4),c('test1','test2',3), 
               matrix(c(1,2,3,4)))
data38
data38[1]
data38[2]
mode(data38)
mode(data38[1])

data39 <- list("Apple","Green", 10.20, c(1,2,3,4),c('test1','test2',3), 
                matrix(c(1,2,3,4)),
               list(1,"2",TRUE))
data39
data39[7]

#names(data39) <- 1:7
#data39
        
names(data39) <- c('item1','item2','item3','item4',
                   'item5','item6','item7')
data39

data39$item3
data39$item7[[1]]

temp <- c(1,2,3,4)
df <- data.frame(temp)
df

mode(df)
class(df)

temp2 <- matrix(c(1,2,3,4))
df2 <- data.frame(temp2)
df2

mode(df2)
class(df)

emp <- data.frame(
  emp_id = c(1:3),
  emp_name = c('Tom','John','Amy'),
  salary = c(2000, 3000, 4000),
  start_date = c('2019-01-01','2019-02-01','2019-03-01'),
  stringsAsFactors = FALSE
)
emp
str(emp)
summary(emp)

emp$emp_id
emp$emp_name
emp$salary
emp$start_date

emp[1,]
emp[c(1,3),c(1,2)]

emp$dept <- c('IT','HR','Finance')
emp

new.data <- data.frame(
  emp_id = c(4,5),
  emp_name = c('Tom','Jerry'),
  salary = c(2000,3000),
  start_date = c('2019-10-11','2019-10-20'),
  dept = c('IT','Finance'),
  stringsAsFactors = FALSE
)

emp2 <- rbind(emp, new.data)
emp2

remoteLogin("http://bkparktestmlsvr.koreacentral.cloudapp.azure.com:12800",
            session =  TRUE, diff = TRUE,
            commandline =  TRUE,
            username = 'admin',
            password = 'Pa$$w0rd2019')

setwd("C:\\Users\\user\\Desktop\\R_Studio\\R\\Labfiles\\Lab01")
flightDataCsv <- "2000.csv"

flightDataSampleDF <- read.csv(flightDataCsv)
head(flightDataSampleDF,10)

mName <- function(mNum) { month.name[mNum]}
flightDataSampleDF$MonthName <- factor(lapply(flightDataSampleDF$Month, mName), levels = month.name)
system.time(delaySummary <- summary(flightDataSampleDF))
print(delaySummary)

print(names(flightDataSampleDF))
print(nrow(flightDataSampleDF))
print(min(flightDataSampleDF$ArrDelay, na.rm = TRUE))
print(max(flightDataSampleDF$ArrDelay, na.rm = TRUE))
print(xtabs(~MonthName + as.factor(Cancelled == 1), flightDataSampleDF))

system.time(rxDelaySummary <- rxSummary(~., flightDataSampleDF))
print(rxDelaySummary)

print(rxGetInfo(flightDataSampleDF))
print(rxGetVarInfo(flightDataSampleDF))
print(rxQuantile("ArrDelay", flightDataSampleDF))
print(rxCrossTabs(~MonthName:as.factor(Cancelled == 1), flightDataSampleDF))
print(rxCube(~MonthName:as.factor(Cancelled), flightDataSampleDF))

rm(flightDataSampleDF)
remoteLogin(deployr_endpoint = "http://bkparktestmlsvr.koreacentral.cloudapp.azure.com:12800", session = TRUE, diff = TRUE, commandline = TRUE, username = "admin", password = "Pa$$w0rd2019")
pause()
putLocalFile(c("2000.csv"))
resume()
flightDataCsv <- "2000.csv"
flightDataSampleDF <- read.csv(flightDataCsv)
mName <- function(mNum) {
  month.name[mNum]
}

flightDataSampleDF$MonthName <- factor(lapply(flightDataSampleDF$Month, mName), levels = month.name)

head(flightDataSampleDF, 10)
