library(shiny)

library(Hmisc)
library(xtable)
library(randomizr)
library(descr)

load('./data/GSS.Rdata')
load('./data/GSS250.Rdata')
load('./data/GSS100.Rdata')

assignToGroups<-function(dataset, groupnames) {
  
  group<-complete_ra(nrow(dataset), condition_names = groupnames)
}

#We're going to assume a name of group since that is what we created.
compareGroups<-function(dataset)
{

  compmeans(dataset$EDUC, dataset$group)
}

groupnames<-c("Treatment", "Control")



shinyServer(function(input, output) {


         output$title<-renderText({
                title<-""
                if (!is.null(input$dataset) )
                {
                        title<-"<h4>Comparison of Treatment and Control Groups</h4>"
                        
                }
 
        })

        output$head<-renderText({ 

                if (!is.null(input$dataset) )             
                { 
                  if (input$dataset == "2538")
                  {
                    allocated<-GSS
                  }
                  else if (input$dataset == "250") {
                  
                    allocated<-GSS250
                  }
                  else if (input$dataset == "100") {
                  
                    allocated<-GSS100
                  }
                      allocated$group<-as.factor(assignToGroups(allocated, groupnames)) 
                      dataset<<-NULL
                      dataset<<-allocated
                      head<-head(allocated,10)
                      head<-print(xtable(head), type="html")

                }
                      

        })

        output$comparisons<-renderText({ 
          if (!is.null(input$dataset) )             
          {         
              comparisons<-compareGroups(dataset) 
              comparisons<-print(xtable(comparisons), type="html")
          }
    })
    output$compage<-renderText({ 
      if (!is.null(input$dataset) )             
      {      
        compage<-compmeans(dataset$AGE, dataset$group)
        compage<-print(xtable(compage), type="html")
      }
    })
    output$compsex<-renderText({ 
      if (!is.null(input$dataset) )             
      { 
        
        compsex<-CrossTable(dataset$group, dataset$SEX, prop.c=FALSE, prop.t=FALSE, 
                          prop.chisq=FALSE, percent=TRUE, format="SPSS", dnn = c("Group", "Gender"))
        compsex<-print(xtable(compsex), type="html")
      }
    })
    output$comprace<-renderText({ 
      if (!is.null(input$dataset) )             
      { 
        
        comprace<-CrossTable(dataset$group, dataset$RACE, prop.c=FALSE, prop.t=FALSE, 
                            prop.chisq=FALSE, percent=TRUE, format="SPSS", dnn = c("Group", "Race"))
        comprace<-print(xtable(comprace), type="html")
      }
    })
    output$compzodiac<-renderText({ 
      if (!is.null(input$dataset) )             
      { 
        compzodiac<-CrossTable(dataset$group, dataset$ZODIAC, prop.c=FALSE, prop.t=FALSE, 
                            prop.chisq=FALSE, percent=TRUE, format="SPSS", dnn = c("Group", "Zodiac"))
        compzodiac<-print(xtable(compzodiac), type="html")
      }
    })
}
)
