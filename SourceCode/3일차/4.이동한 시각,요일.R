#요일중 어느시각에 많이 움직였을지 그래프로
#install.packages('jsonlite') 
# 'plyr' 'ggplot2'도 설치

library(jsonlite)
library(plyr)
library(ggplot2)

jsonList = fromJSON('export.json')
df <- as.data.frame(jsonList$locations)

Sys.setlocale("LC_TIME", "C")
df$timekeeping <- as.POSIXct(as.numeric(df$timestampMs)/1000, origin="1970-01-01")
df$weekdays <- factor(format(df$timekeeping, "%a"), 
                                    levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
date.diff <- max(df$timekeeping) - min(df$timekeeping)
measurements.per.hour <- (nrow(df)/as.numeric(date.diff))/24  # number of measurements per hour
measurements.per.minute <- measurements.per.hour/60  # number of measurements per minute
measurement.interval <- 60/measurements.per.hour  # number of minutes per measurement


#그래프생성
ggplot(df) +
  geom_line(aes(x=format(timekeeping, "%H"), y = (..count..)/(as.numeric(date.diff)/7),
                group = weekdays,
                color = weekdays), 
            stat = "count",
            size = 1) +
  geom_line(aes(x=format(timekeeping, "%H"), y = (..count..)/(as.numeric(date.diff)), 
                group = 1),
            stat = "count",
            linetype = 2,
            size = 0.7) + 
  scale_color_manual("", values = c("#396AB1", "#DA7C30", "#3E9651", "#CC2529",
                                    "#6B4C28", "#f781bf", "#6B4C9A")) +
  labs(color = "Day of the Week",
       title = "Hourly Overview of Google Location Data") +
  ylab("Number of Measurements per Day (Average)") + 
  xlab("Hour of the Day")

