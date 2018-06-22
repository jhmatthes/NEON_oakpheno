library(shiny)
library(tidyverse)

shinyServer(
  function(input, output){
    
    output$myplot <- renderPlot({
      
      # Calculate total individuals in that phenophase (# of yes)
      # Total in status by day
      sampSize <- oak_phe %>% 
        filter(phenophaseName == input$phenphase) %>%
        count(date, siteID)
      
      inStat <- oak_phe %>% 
        filter(phenophaseName == input$phenphase) %>%
        group_by(date, siteID) %>%
        count(phenophaseStatus)
      
      inStat <- full_join(sampSize, inStat, by=c("date", "siteID"))
      
      # Retain only Yes
      inStat_T <- filter(inStat, phenophaseStatus %in% "yes")
      
      # Plot percent of leaves in phenophase ---------------------------------------
      # convert to percent
      inStat_T$percent<- ((inStat_T$n.y)/inStat_T$n.x)*100
      
      phenoPlot_P <- ggplot(filter(inStat_T, date > "2016-01-01")) +
        geom_point(aes(x = date, y = percent, color = siteID), position=position_jitter(height=1.0)) + 
        ggtitle(paste("Proportion with",input$phenphase)) +
        xlab("Date") + ylab("% of Individuals") +
        theme(plot.title = element_text(lineheight=.8, face="bold", size = 20)) +
        theme(text = element_text(size=14)) + 
        scale_color_manual(name = "Site",
                           values = c("forestgreen","darkorchid4","darkgoldenrod"),
                           labels = c("Harvard Forest, MA", 
                                      "Ordway-Swisher, FL",
                                      "San Joaquin, CA"))
      
      phenoPlot_P
      
    })
  }
)
