#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(shinydashboard)
#install.packages("shinythemes")
library(shinythemes)

match<-read.csv("C:/Users/leona/Documents/Bedu/Postworks/Postworks/Postwork8/match.data.csv")

# Define UI for application that draws a histogram
ui <- 
    
    fluidPage(
        
        dashboardPage(
            
            dashboardHeader(title = "Basic dashboard"),
            
            dashboardSidebar(
                
                sidebarMenu(
                    menuItem("Barras", tabName = "Dashboard", icon = icon("dashboard")),
                    menuItem("Probabilidad", tabName = "Probabilidad", icon = icon("file-picture-o")),
                    menuItem("Data Table", tabName = "data_table", icon = icon("table")),
                    menuItem("Imágen", tabName = "img", icon = icon("file-picture-o"))
                )
                
            ),
            
            dashboardBody(
                
                tabItems(
                    
                    # Histograma
                    tabItem(tabName = "Dashboard",
                            fluidRow(
                                titlePanel("Gráfica de Barras"), 
                                selectInput("x", "Seleccione el valor de X",
                                            choices = names(match)),
                                box(plotOutput("plot1", height = 500, width = 500)),
                                
                               
                            )
                    ),
                    
                    # Dispersión
                    tabItem(tabName = "Probabilidad",
                            fluidRow(
                                titlePanel(h3("Probabilidad")),
                                img( src = "P3FTAG.png", 
                                     height = 350, width = 500),
                                img( src = "P3FTHG.png", 
                                     height = 350, width = 500)
                            )
                    ),
                    
                    
                    
                    tabItem(tabName = "data_table",
                            fluidRow(        
                                titlePanel(h3("Data Table")),
                                dataTableOutput ("data_table")
                            )
                    ), 
                    
                    tabItem(tabName = "img",
                            fluidRow(
                                titlePanel(h3("Momios")),
                                img( src = "momiosmax.png", 
                                     height = 350, width = 500),
                                img( src = "momiosprom.png", 
                                     height = 350, width = 500)
                            )
                    )
                    
                )
            )
        )
    )

#De aquí en adelante es la parte que corresponde al server

server <- function(input, output) {
    library(ggplot2)
    
    #Gráfico de Histograma
    output$plot1 <- renderPlot({
        x <- match[,input$x]
        z <- match[,input$zz]
        ggplot(match, aes(x=x)) + 
            geom_bar() +facet_wrap(vars(away.team))
        
        
    })
    
  
    
    #Data Table
    output$data_table <- renderDataTable( {match}, 
                                          options = list(aLengthMenu = c(5,25,50),
                                                         iDisplayLength = 5)
    )
    
}


# Run the application 
shinyApp(ui = ui, server = server)
