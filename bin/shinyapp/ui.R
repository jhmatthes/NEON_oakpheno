library(shiny)

shinyUI(fluidPage(
  
  titlePanel(div(HTML("Outstanding Oaks: <em>Quercus</em> phenology at NEON sites"))),
  
  sidebarLayout(
    
    sidebarPanel(    
      selectInput("phenphase",label="Phenophase of interest",
                  choices= phenophases),
      width = 4),
    
    #Output functions
    mainPanel(
      p("This is a visualization of oak phenology from three sites in the ", 
        a("National Ecological Observatory Network.", href="https://www.neonscience.org/", target="_blank")),
      p(),
      p("The data include phenological observations on 30 individuals each of red oak",
        tags$em("(Quercus rubra)"),
        "at the ",
        a("Harvard Forest", href="https://www.neonscience.org/field-sites/field-sites-map/HARV", target="_blank"),
        "in Massachusetts, turkey oak", 
        tags$em("(Quercus laevis)"),
        "at the ",
        a("Ordway-Swisher Biological Station", href="https://www.neonscience.org/field-sites/field-sites-map/OSBS", target="_blank"),
        "in Florida, and blue oak",
        tags$em("(Quercus douglasii)"),
        "at the ",
        a("San Joaquin Experimental Range", href="https://www.neonscience.org/field-sites/field-sites-map/SJER", target="_blank"),
        "in California."),
      plotOutput("myplot"),
      
      tags$hr(),
      tags$footer("Shiny app developed by: "),
      tags$footer(p(a("Jackie Hatala Matthes", href="http://matthesecolab.com", target="_blank"),
                    ", Assistant Professor of Biological Sciences, Wellesley College (2018) "),
                  p("App source code available on ",a("GitHub",href = "https://github.com/jhmatthes/oak-phenology-app")),
                  p(" "),
                  tags$img(alt="Creative Commons License", style="border-width:0", src="https://i.creativecommons.org/l/by/4.0/88x31.png"),
                  tags$body("This work is licensed under a", a("Creative Commons Attribution 4.0 International License", href="http://creativecommons.org/licenses/by/4.0/"),".")))
  )
  
  
  
)
)
