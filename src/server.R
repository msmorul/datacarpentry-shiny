library(shiny)
library(ggplot2)
library(plyr)
#
# Before the server starts, we will load the gapminder dataset.
#
gapminder <- read.csv('../data/gapminder-FiveYearData.csv')
#
# As an example, you can use plyr to quickly generate derivitive data. For an exercise, try
# replacing the references to gapminder below with the life_exp defined in the next line. You
# will need to uncomment the following before using it:
#
# life_exp <- ddply(.data=gapminder, .variables = c("continent","year"), .fun = function(x) mean(x$lifeExp))
#
# (hint: also, remember that ddply will create a V1 column with the aggregate life expectency)
#
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #
  # there are multiple plot examples below, remove the comment '#' from before the one you 
  # wish to test out.
  #
  
  output$distPlot <- renderPlot({
    
    #
    # This first example will generate an unchanging graph showing the life expectency for all
    # countries. Lines will be colored based on which continent the country is part of.
    #
    # plot <- ggplot(data=gapminder, aes(x=year,y=lifeExp,by=country,color=continent)) + geom_line()
    #
    # Create a plot which will use the second slider selector to set a maximum date.
    #
    #plot <- ggplot(data=gapminder[gapminder$year < input$year[2],], aes(x=year,y=lifeExp,by=country,color=continent)) + geom_line()
    #
    # Now, add the second slider as a condition for fildering the data
    #
    #plot <- ggplot(data=gapminder[gapminder$year > input$year[1] & gapminder$year < input$year[2],], aes(x=year,y=lifeExp,by=country,color=continent)) + geom_line()
    #
    # This last example will filter your plot by BOTH
    #
    plot <- ggplot(data=gapminder[gapminder$year > input$year[1] & gapminder$year < input$year[2] & gapminder$continent %in% input$continents,], aes(x=year,y=lifeExp,by=country,color=continent)) + geom_line()
    
    #
    # We have to call print in order to transform our ggplot output into something which renderPlot expects
    #
    print(plot)
  })
})
