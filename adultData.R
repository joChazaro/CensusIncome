#Downloading train and test data
trainFile = "adult.data";
testFile = "adult.test"

if (!file.exists (trainFile))
  download.file (url = "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", destfile = trainFile)

if (!file.exists (testFile))
  download.file (url = "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test", destfile = testFile)

#Assigning column names
colNames = c ("Age", "Workclass", "FinalWeight", "Education",
              "EducationNum", "MaritalStatus", "Occupation",
              "Relationship", "Race", "Sex", "CapitalGain",
              "CapitalLoss", "HoursPerWeek", "NativeCountry",
              "IncomeLevel")

#Reading training data
training = read.table (trainFile, header = FALSE, sep = ",",
                       strip.white = TRUE, col.names = colNames,
                       na.strings = "?", stringsAsFactors = TRUE)

#Display structure of data
str (training)

#Data Cleaning
#Observing data for missing values
table (complete.cases(training))

#observe which variable carries the greatest number of null values
summary (training [!complete.cases(training),])

#removing null values
TrainSet = training [!is.na (training$workclass) & !is.na (training$occupation), ]
TrainSet = TrainSet [!is.na (TrainSet$nativecountry), ]

#removing unnecessary variables
TrainSet$FinalWeight = NULL

#Data Exploration
#Age variable exploration
summary (TrainSet$Age)

#make a boxplot for age variable data
boxplot(Age ~ incomelevel, data = TrainSet, main = "Income Levels Based on the Age of an Individual", 
        xlab = "Income Level", ylab = "Age", col = "blue")
