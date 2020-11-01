# Session 4 Question Answers

# 1
x <- seq(10, 40, 0.1)
x

y = dnorm(x , 25, 5)
y

plot(x, y, main = 'Q1 Densityplot', xlab ="x", ylab = "density", ylim = c(0, 0.10),
     type = 'l')

#2
pnorm(0.5, mean = 3, sd = 4)

#3
setwd("C:/Users/Luke/Documents/R Files")
getwd()
unlock <- read.table(file = 'unlockable.csv', header = TRUE, sep=";")

#4
head(unlock)
str(unlock)
summary(unlock)

#5
first3xcondition <- tapply(unlock$first3, unlock$condition, mean)
first3xcondition
barplot(first3xcondition, main = "Mean for First3 as a Function of Condition",
        ylim = c(0, 300), xlab = "Condition", ylab = "First3")
box()

#6
which(colnames(unlock)=="first3")
which(colnames(unlock)=="gaze3")

par(mfrow = c(2,2)) #Create 2x2 Plot Space
loop.vector <- 5:8 #Create Loop Vector for Relevant Columns
for(i in loop.vector){
  x <- tapply(unlock[,i], unlock$condition, mean)
  barplot(x, main = "Mean for First3 as a Function of Condition",
          ylim = c(0, 600), xlab = "Condition", ylab = "First3")
}
  
#7
vecx <- c(4, 5, 6, 7, 8, 9)
sum(vecx[1:3], na.rm = FALSE)
sqrt(sum(vecx[1:3], na.rm = FALSE))
sum(vecx[4:6], na.rm = FALSE)
sqrt(sum(vecx[4:6], na.rm = FALSE))
sum(sqrt(sum(vecx[1:3], na.rm = FALSE))+sqrt(sum(vecx[4:6], na.rm = FALSE)))

#8
magic.function = function(vecx)
{
  sum(sqrt(sum(head(vecx, n = length(vecx)/2), na.rm = FALSE))+sqrt(sum(tail(vecx, n = length(vecx)/2), na.rm = FALSE)))
}

# To test the function has been correctly created
FUNCtest <- c(4,6,7,8,6,4,2,8,6,7)
magic.function(FUNCtest)

#9
rm(list = ls(all = TRUE))
