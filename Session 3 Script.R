# 1 
OWLS <- read.table(file = "Owls.txt", header = TRUE, sep="\t")


# 2
head(OWLS)
str(OWLS)
summary(OWLS)


# 3
mean(OWLS$ArrivalTime)
attach(OWLS)
mean(ArrivalTime)
detach(OWLS)


# 4
MArrivalxBrSize <- tapply(OWLS$ArrivalTime, list(OWLS$BroodSize), mean)


# 5
New = subset(OWLS, BroodSize < 6)
mean(New$ArrivalTime)


# 6
table(OWLS$SexParent)
pie(table(OWLS$SexParent), main = "Owl Parent Sex")


#7 
greenyellow = c("green", "yellow")
pie(table(OWLS$SexParent), col = greenyellow, main = "Owl Parent Sex")


#8 
plot(OWLS$NegPerChick, main = "Negotiation per chick")


#9
sxnumber <- ifelse(OWLS$SexParent == "Male", 1, ifelse(OWLS$SexParent == "Female", 2, 3))
plot(OWLS$NegPerChick, pch = sxnumber, xlab = "Owl Number",
     ylab = "NegPerChick", main = "Negotiations per chick")
legend("topright",c("Male","Female"), pch = c(1,2), bg = "white")


#10
MaleOwls = OWLS[OWLS$SexParent == "Male",]
boxplot(MaleOwls$NegPerChick ~ MaleOwls$BroodSize, data = OWLS, xlab = "Brood Size", ylab = "NegPerChick", main = "Male Owls NegPerChick x Brood Size")

       
#11
bmp("Male_Owls_NegPerChick_x Brood_Size.bmp", width = 480, height = 480)
boxplot(OWLS[MaleOwls,]$NegPerChick ~ OWLS[MaleOwls,]$BroodSize, data = OWLS, xlab = "Brood Size", ylab = "NegPerChick", main = "Male Owls NegPerChick x Brood Size")


#12
MaleOwls[MaleOwls$BroodSize==1,]


#13
OWLS$BroodFilter <- ifelse(OWLS$BroodSize <= 4, 1, ifelse(OWLS$BroodSize > 4, 2, 3))
BroodSize.f <- factor(OWLS$BroodFilter, levels = c(1, 2), labels = c ("Small Broodsize", "Large Broodsize"))
library(lattice)
bwplot(OWLS$NegPerChick ~ OWLS$SexParent | BroodSize.f, ylab = "Negotiations Per Chick", xlab = "Brood Size", data = OWLS)

#14
dev.off()
rm(list = ls(all = TRUE))
