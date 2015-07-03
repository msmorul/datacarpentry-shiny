library(shiny)

gapminder <- read.csv('../data/gapminder-FiveYearData.csv')


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gapminder Demo"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      # 
      # Create a two-position slider to select a date range from all possible years.
      #
      sliderInput("year",
                  "Date",
                  #
                  # By default, sliderInput will format numbers like 1,957. Since we want to see 
                  # 1957 we have to set the seperator to be blank "". Comment out this line and restart
                  # your application to see how it changes
                  # 
                  sep="",
                  #
                  # Set the beginning and end values for the slider.
                  #
                  min = min(gapminder$year),
                  max = max(gapminder$year),
                  #
                  # Set the starting position for the draggable part of the slider. By passing a vector
                  # we can have multiple handles on a single slider
                  #
                  value=c(min(gapminder$year),max(gapminder$year))
      
                  ),
      #
      # Create a checkbox list from our contents which will be available at input$continents
      #
      checkboxGroupInput(
                "continents",
                "Continents",
                levels(gapminder$continent),
                ) 
    
    ), # end sidebarpanel
    
    # Show a plot of the generated distribution
    # We can write a plot to this at output$distPlot
    
    mainPanel(
      plotOutput("distPlot")
    )
    
  ) #End sidebarlayout
))
