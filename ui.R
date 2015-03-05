shinyUI(navbarPage("POC sécurité", id = "nav", theme = 'bootstrap.css',
  tabPanel("Modèle prédictif",
    fluidRow(
      column(12, 
             h5(textOutput('textdate')),
             selectInput(inputId = 'select1',choices = c('','06-02-2015','13-02-2015','20-02-2015','27-02-2015') , label = '')),
      hr(),
      column(5,
             h4(textOutput('textvars')),
             h5(textOutput('textparam')),
             htmlOutput(outputId = 'vars', inline = T)),
      column(7,
             h4(textOutput('textzoom')),
             h5(textOutput('textvariables')),
             htmlOutput(outputId = 'zoom', inline = T)),
      hr(),
      column(5,
             h4(textOutput('textroc')),
             h5(textOutput('textauc')),
             htmlOutput(outputId = 'roc', inline = T)),
      hr(),
      column(7,
             h4(textOutput('textmap')),
             h5(textOutput('textstates')),
             htmlOutput(outputId = 'map', inline = T))
            )
  ),
  tabPanel("Satistiques descriptives",
           fluidRow(
             column(12, selectInput(inputId = 'select2',choices = c('','02-02-2015','09-02-2015','16-02-2015','23-02-2015') , label = '')),
             hr()
           )
  ),
  tabPanel("Evolution des modèles",
           fluidRow(
           dataTableOutput("models")
           )
  ),
  tabPanel("Aperçu du dataset",
           fluidRow(
             dataTableOutput("data")
           )
  )
)
)