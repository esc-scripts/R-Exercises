# Using the c function, create a vector that contains the Electoral Votes of the seven states.

ElecVotes <- c(9, 3, 10, 5, 55, 9, 7)

# Do the same for the population, note that there is a missing value here.

StatePop <- c(4447100, 626932, 5130632, 2673400, 33871648, NA, 3405565)

# Mean of the two vectors.

mean(ElecVotes)
mean(StatePop, na.rm=TRUE)

# Minimun value of the two vectors.

min(ElecVotes)
min(StatePop, na.rm=TRUE)

# Create a vector that contains the names of the States. Note that this vector will contain strings of characters.

StateNames <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut")

# Use cbind to create a matrix containing the 2 vectors you have already created that contained numbers (i.e. votes and population)

VotePopMtrx <- cbind(ElecVotes, StateNames)

# Use data.frame to make a matrix of the 3 vectors (i.e. name of the State, votes and population). Call it Data.States

Data.States <- data.frame(StateNames, ElecVotes, StatePop)

# Ask what the column names are for Data.States

colnames(Data.States)

# Use nrow, and ncol on Data.States

nrow(Data.States)
ncol(Data.States)

# Ask which value the Data.States file contains on the 2nd row, 3rd column

Data.States[2,3]

# Asks R to put on the screen the first four elements of the Elec column of the Data.States datafile.

head(ElecVotes, 4)
Data.States[1:4, 2]
Data.States$ElecVotes[1:4]

# Denis used the last of the 3 above

# An exercise on creating a subset. Create a file called New_file that contains all the data from Data.States but with those rows removed when the Value in Elec is 20 or higher.

New_file = subset(Data.States, ElecVotes <= 20)

# Or you can do it like this which is better for complex problems

New_files = Data.States[Data.States$ElecVotes <= 20]

# Save your New_file onto your working directory. You can call it New_file.txt. Separate the columns with a semicolon (;). You can use the defaults for the other settings. 

write.table(New_file, file = "New_file.txt", sep=";", quote = FALSE, append = FALSE, na = "NA")

# Clean up your workspace after you have finished

rm(list = ls(all = TRUE))