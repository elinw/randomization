library(shiny)


shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("
      
      td, th {
          padding-left: 5px;
          padding-right: 5px;
      }
      h3 {
          font-size:20px;
      }

    "))
  ),
        # Application title
        titlePanel("What happens when you use random assignment?"),
        
        sidebarLayout(
                sidebarPanel(
                      helpText("Choose your study group's size."),
                      uiOutput("dataset"),
                      selectInput("dataset", 
                                  label = "Choose a study population",
                                  choices = list("2538", "250",
                                                 "100"),
                                  selected = "GSS") 
                        
               )
               ,
                mainPanel(
                  

                  tabsetPanel(     
                               
                    tabPanel("About",
                             includeMarkdown("./docs/about.Rmd")         
                    ),
                    tabPanel("Assignments",
                         h3("Assignment for the first 10 people"),
                         p("Look at the list of groups. Groups are randomly assigned. If you try this a few times you will see the list changes"),
                         br(),
                        htmlOutput("head"),
                        br(),
 h3("Comparisons of the Treatment and Control Groups"),
                        h3("Compare the mean years of age"),
                          htmlOutput("compage"),  
                         br(),
                         h3("Compare the mean years of education"),
                         htmlOutput("comparisons"),
                         br(),
                         h3("Compare the percent of each gender"),
                         htmlOutput("compsex"),
                         br(),
                         h3("Compare the percent of each race"),
                         htmlOutput("comprace"),
                         br(),
                         h3("Compare the percent of each zodiac sign"),
                         h4("Why not? After all, random assignment is supposed to work for any variable"),
                         htmlOutput("compzodiac")
                         
                         )

                  )
                
                 )
            )
    )     
)