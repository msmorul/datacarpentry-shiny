
gapminder <- read.csv('../../Downloads/gapminder-FiveYearData.csv')

ggplot(data=gapminder, aes(x=year, y=lifeExp)) + geom_point() + geom_smooth(method="lm") +
  geom_line(data=gapminder, aes(x=year, y=gdpPercap, by=country, color="red")) + xlab("Year")

calcGDP <- function(data, year = NULL) {
  if (!is.null(year)) {
    data <- data[data$year == year,]
  }
  
  gdp <- data$pop * data$gdpPercap
  return(gdp)
}

#
life_exp <- ddply(.data=gapminder, .variables = c("continent","year"), .fun = function(x) mean(x$lifeExp))
ggplot(data=life_exp, aes(x=year,y=V1)) + geom_point()
ggplot(data=life_exp, aes(x=year,y=V1,by=continent,color=continent)) + geom_line()
