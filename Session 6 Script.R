#Preamble
rm(list = ls(all = TRUE))
dev.off()
setwd("C:/Users/Luke/Documents/R Files")
getwd()


#1

library(languageR)
head(etymology)
str(etymology)


#2
attach(etymology)


#3
qqnorm(WrittenFrequency)
qqnorm(FamilySize)


#4
cor(WrittenFrequency, FamilySize)
cor(WrittenFrequency, FamilySize)^2 #R-square tells us the variance explained by cor
cor.test(WrittenFrequency,FamilySize) 


#5
model1.lm <- lm(WrittenFrequency ~ LengthInLetters)
summary(model1.lm)

# IF IT SAYS EXAMINE THE RESULTS EXPLAIN THEM HERE IN A NOTE


#6
model2.lm <- lm(WrittenFrequency ~ FamilySize)
summary(model2.lm)


#7
x <- data.frame(obs = FamilySize,
                    exp = fitted(model2.lm), resid = resid(model2.lm))
par(mfrow = c(1, 2))
plot(density(x$resid), main = "")
qqnorm(x$resid, pch = ".", main = "")
qqline(x$resid)


#8
par(mfrow = c(1, 1))
plot(WrittenFrequency ~ FamilySize, xlab = "Family Size", ylab = "Written Frequency")
abline(model2.lm)


#9
model3.lm <- lm(WrittenFrequency ~ LengthInLetters + FamilySize)
summary(model3.lm)

# all main effects are significant: When x increases by 1,
# LengthInLetters decreases by -0.47, while FamilySize increases by 0.73.


#10
library(lattice)
cloud(WrittenFrequency ~ LengthInLetters + FamilySize)


#11
anova(model2.lm, model3.lm)

# COMMENT EXPLAINING WHY IT IS A BETTER FIT


#12
rm(list = ls(all = TRUE))
