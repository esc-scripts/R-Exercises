#1

Vec1 <- rnorm(600, 10, 3)
Vec2 <- rnorm(600, 15, 3)

#2
library(lattice) #Load lattice library
densityplot(Vec1, main = "Vec1 Density Plot")
densityplot(Vec2, main = "Vec2 Density Plot")
par(mfrow = c(1,2)) #Set up 1*2 plotting area
qqnorm(Vec1)
qqnorm(Vec2)
shapiro.test(Vec1)
shapiro.test(Vec2)
ks.test(Vec1, "pnorm",mean(Vec1),sd(Vec1))
ks.test(Vec2, "pnorm",mean(Vec2),sd(Vec2))
var.test(Vec1, Vec2)
dev.off()

#3
t.test(Vec1, Vec2, var = TRUE) #var = TRUE necessary if data is parametric

#4
library(languageR)
head(ver,25)
ver[500:530,]
str(ver)

#5
ver$LogFrequency = log(ver$Frequency)

#6
ver.aov <- aov(LogFrequency ~ SemanticClass, data = ver)
summary(ver.aov)
print(model.tables(ver.aov, "means"), digits = 3) #Report means and N
boxplot(LogFrequency ~ SemanticClass, data = ver) #GFX Output

#7
head(latinsquare,25)
str(latinsquare)

table(latinsquare$Subject, latinsquare$Group)
table(latinsquare$Subject, latinsquare$SOA)

#2x2 mixed ANOVA
#IV Between: Group
#IV Within: SOA
#DV: RT

aov7 <- aov(RT ~ Group*SOA + Error(Subject/SOA), data = latinsquare)
summary(aov7)
print(model.tables(aov7, "means"), digits = 3) #Report Mean and N
boxplot(RT ~ Group * SOA, data = latinsquare) #GFX Output


#8
rm(list = ls(all = TRUE))
