install.packages("tidyverse")
library(tidyverse)
mtcars
ggplot(mtcars) + geom_point(mapping =  aes(x= mpg, y= disp))
ggplot(mtcars) + geom_bar(mapping =  aes(x= gear))
ggplot(mtcars) + geom_histogram(mapping =  aes(x= qsec), binwidth = 2)
ggplot(mtcars) + geom_smooth(mapping =  aes(y= mpg, x= disp))

p <- ggplot(mtcars, mapping =  aes(x= mpg, y= disp))
p + geom_point() + geom_line() + geom_smooth(method = "lm",
                    formula = y ~ poly(x,2))

ggplot(mtcars, mapping =  aes(x= disp, y= mpg,
                              color = factor(am, levels =  c(0,1),
                                             labels =  c("Automatic", "Manual")))) +
  scale_color_manual(values = c("blue", "yellow")) +
  geom_point()+
  labs(color = "Transmission")


ggplot(mtcars) +
  geom_point(mapping =  aes(x = disp , y = mpg)) +
  facet_grid(. ~ am)

ggplot(mtcars) +
  geom_point(mapping =  aes(x = disp , y = mpg)) +
  facet_grid(gear ~ am)

setwd("C:\\Users\\user\\Desktop\\R_Studio\\R\\Demofiles\\Mod03")
airlineDataFile <- "FlightDelayReasonData.xdf"
airlineData <- rxImport(airlineDataFile,
                        rowSelection = (Delay > 0) & as.logical(rbinom(n = .rxNumRows, size = 1, prob = 0.05)))
rxGetInfo(airlineData, getVarInfo = TRUE)

View(airlineData)

rxHistogram(~OriginState, airlineData,
            xTitle = "Arrival Delay (minutes",
            yTitle = "Departure Delay (minutes)",
            scales = (list(
              x = list(rot = 90, cex = 0.5)
            )))


ggplot(data = airlineData) +
  geom_point(mapping = aes(x = ArrDelay, y = DepDelay), alpha = 1/50) +
  xlab("Arrival Delay (minutes") +
  ylab("Departure Delay (minutes)")

ggplot(data = airlineData, mapping = aes(x = ArrDelay, y = DepDelay)) +
  geom_point(alpha = 1/50) +
  geom_smooth(color = "red") + 
  xlab("Arrival Delay (minutes") +
  ylab("Departure Delay (minutes)")


ggplot(data = airlineData, mapping = aes(x = ArrDelay, y = DepDelay)) +
  geom_point(alpha = 1/50) +
  geom_smooth(color = "red") + 
  facet_wrap( ~ MonthName, nrow = 3) +
  xlab("Arrival Delay (minutes") +
  ylab("Departure Delay (minutes)")

setwd("C:\Users\user\Desktop\R_Studio\R\Demofiles\Mod03")
airlineDataFile <- "FlightDelayData.xdf"
airlineData <- RxXdfData(airlineDataFile)
rxGetInfo(airlineData, getVarInfo = TRUE)

rxHistogram(~OriginState, airlineData,
            xTitle = "Departure State",
            yTitle = "Number of Flights",
            scales = (list(
              x = list(rot = 90, cex = 0.5)
            )))


rxHistogram(~OriginState, airlineData, rowSelection = ArrDelay > 0,
            xTitle = "Departure State",
            yTitle = "Number of Late Flights",
            scales = (list(
              x = list(rot = 90, cex = 0.5)
            )))


flightsByCarrier <- rxHistogram(~UniqueCarrier, airlineData,
                                xTitle = "Carrier",
                                yTitle = "Number of Flights",
                                yAxisMinMax = c(0, 2E6),
                                scales = (list(
                                  x = list(rot = 90, cex = 0.6)
                                )))

lateFlightsByCarrier <- rxHistogram(~UniqueCarrier, airlineData, rowSelection = ArrDelay > 0,
                                    xTitle = "Carrier",
                                    yTitle = "Number of Late Flights",
                                    yAxisMinMax = c(0, 2E6),
                                    plotAreaColor = "transparent",
                                    fillColor = "magenta",
                                    scales = (list(
                                      x = list(rot = 90, cex = 0.6)
                                    )))

install.packages("latticeExtra")
library(latticeExtra)

print(c(flightsByCarrier, lateFlightsByCarrier))


print(flightsByCarrier + lateFlightsByCarrier)
