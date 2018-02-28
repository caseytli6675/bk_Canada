
library(timeDate)
# generate month end -1
myDate <- as.timeDate(seq(as.Date('2017-01-01'), Sys.Date(), by = "day"))
businessDay <- myDate[isBizday(myDate, holidays = holidayTSX())]
monthEnd_idx <- endpoints(businessDay)[-1]
monthEnd_1_idx <- monthEnd_idx - 1
monthEnd <- as.Date(businessDay[monthEnd_idx])
monthEnd_1 <- as.Date(businessDay[monthEnd_1_idx])

# port time attribute
ts_port_attri <- data.frame(date = as.Date(myDate), flag = 0)
colnames(ts_port_attri) <- c("date","flag")
ts_port_attri[ts_port_attri[,"date"] %in% monthEnd_1,"flag"] <- 1

