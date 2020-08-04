plot1 <- function() {
    library("data.table")
    setwd(
        "E:\\Coursera\\Exploratory Data Analysis\\exdata_data_household_power_consumption"
    )
    #Read the file into Data Table
    powerDT <-
        data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
    # Change Date Column to Date Type
    powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
    
    # Filter Dates for 2007-02-01 and 2007-02-02
    powerDT <-
        powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
    
    globalActivePower <- as.numeric(powerDT$Global_active_power)
    
    png("plot1.png", width = 480, height = 480)
    
    
    hist(globalActivePower,
         col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
    dev.off()
}
