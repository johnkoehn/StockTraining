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

test = c(0)
for (i in loansPerState)
{
    test <- test + loansPerState[i]
}
print(test)