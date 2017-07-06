#Read in the loan data form lending club and get useful data from it
data <- read.csv(file = "LoanStats3a_securev1.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE)

maxInt <- max(data$int_rate)
#print(maxInt)

aLoans <- subset(data, grade == "A")
bLoans <- subset(data, grade == "B")
#print(NROW(aLoans))

#get the state addresses
states <- unique(data[["addr_state"]])
states <- states[order(states)]
states <- states[states != ""]
#print(states)

#display the number of A loans for each state
if (FALSE)
{
    gradeALoansPerState = c()
    chargedOffALoansPerState = c()
    for (i in states)
    {
        cat(sprintf("%s: %d\n", i, NROW(subset(data, grade == "A" & addr_state == i))))
        gradeALoansPerState[i] <- NROW(subset(data, grade == "A" & addr_state == i))
        chargedOffALoansPerState[i] <- NROW(subset(data, grade == "A" & addr_state == i & loan_status == "Charged Off"))
    }

    print(chargedOffALoansPerState / gradeALoansPerState * 100)
    print(max(chargedOffALoansPerState / gradeALoansPerState * 100, na.rm = T))
    rm(chargedOffALoansPerState)
}

####PRATICE DONE#####
#Get the percentage of defaults for each state
loansPerState = c()
chargedOffLoansPerState = c()
for (i in states)
{
    loansPerState[i] <- NROW(subset(data, addr_state == i))
    chargedOffLoansPerState[i] <- NROW(subset(data, addr_state == i & loan_status == "Charged Off"))
}

percentChargedOffPerState <- chargedOffLoansPerState / loansPerState * 100
print(percentChargedOffPerState)
rm(loansPerState)
rm(chargedOffLoansPerState)
rm(percentChargedOffPerState)

#Examine default rates for A, B, C, D, E and F loans
defaults <- c()
defaults[1] <- NROW(subset(data, grade == "A" & loan_status == "Charged Off")) / NROW(subset(data, grade == "A")) * 100
defaults[2] <- NROW(subset(data, grade == "B" & loan_status == "Charged Off")) / NROW(subset(data, grade == "B")) * 100
defaults[3] <- NROW(subset(data, grade == "C" & loan_status == "Charged Off")) / NROW(subset(data, grade == "C")) * 100
defaults[4] <- NROW(subset(data, grade == "D" & loan_status == "Charged Off")) / NROW(subset(data, grade == "D")) * 100
defaults[5] <- NROW(subset(data, (grade == "E" | grade == "F") & loan_status == "Charged Off")) / NROW(subset(data, grade == "E" | grade == "F")) * 100
print(defaults)
test <- data.frame(grade = c("A", "B", "C", "D", "EF"), perDefault = defaults)

barplot(test[["perDefault"]], names.arg = test[["grade"]])

## look at 2008 - 2011
loans <- c()
loans[1] <- NROW(with(data, grep("8", issue_d)))
loans[2] <- NROW(with(data, grep("9", issue_d)))
loans[3] <- NROW(with(data, grep("10", issue_d)))
loans[4] <- NROW(with(data, grep("11", issue_d)))

#look at 2008
defaults <- c()
data2008 <- data.frame(data[grep("8", issue_d, perl = TRUE),])
defaults[1] <- NROW(subset(data2008, grade == "A" & loan_status == "Charged Off")) / NROW(subset(data2008, grade == "A")) * 100
defaults[2] <- NROW(subset(data2008, grade == "B" & loan_status == "Charged Off")) / NROW(subset(data2008, grade == "B")) * 100
defaults[3] <- NROW(subset(data2008, grade == "C" & loan_status == "Charged Off")) / NROW(subset(data2008, grade == "C")) * 100
defaults[4] <- NROW(subset(data2008, grade == "D" & loan_status == "Charged Off")) / NROW(subset(data2008, grade == "D")) * 100