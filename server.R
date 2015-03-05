shinyServer(function(input, output){
  reactive({print(input$select1)})
  output$vars  <- renderGvis({if(input$select1 != '')
    gvisBarChart(var[var$V2 > 0,],
                 yvar = "V2",
                 xvar = "V1",
                 options = list(width = 400, height = 220))})
  
  output$roc  <- renderGvis({if(input$select1 != '')
    gvisAreaChart(roc, xvar = "V1", yvar = c("V1","V2"),
                  options = list(width=300, height=300,legend="none",
                                 hAxis='{minValue:0, maxValue:1.01}',
                                 vAxis='{minValue:0, maxValue:1}'))})
  
  output$textdate  <-  renderText('Sélectionner le modèle à afficher :')
  output$textvars  <-  renderText({if(input$select1 != '') 'Importance relative des variables' })
  output$textzoom  <-  renderText({if(input$select1 != '') 'Zoom par variable'  })
  output$textroc  <-  renderText({if(input$select1 != '') 'Courbe de ROC' })
  output$textmap  <-  renderText({if(input$select1 != '') 'Etats les plus touchées' })
  output$textstates  <-  renderText({if(input$select1 != '') 'Part des accidents graves sur la totalité des accidents par état' })
  
  output$textauc  <-  renderText({if(input$select1 != '')
    paste0('Aire sous la courbe de ROC : ',as.character(round(roc[1,3],3)))
  })
  output$textparam  <-  renderText({if(input$select1 != '')
    paste0('GBM (Trees = ', as.character(bestparam[1,1]),', Depth = ', as.character(bestparam[1,2]),', MinObs = ', as.character(bestparam[1,3]),', Distribution = ', as.character(bestparam[1,4]),', Shrinkage = ', as.character(bestparam[1,5]),')')
  })
  output$textvariables  <-  renderText({if(input$select1 != '')
    paste0('Détails des variables au plus fort pouvoir prédictif')
  })
  
  source('carousel.R')
  output$zoom  <- renderUI({
    if(input$select1 != '')
      carouselPanel(
        img(src="plot_1.png", height = 400, width = 500),
        img(src="plot_2.png", height = 400, width = 500),
        img(src="plot_3.png", height = 400, width = 500),
        img(src="plot_4.png", height = 400, width = 500),
        img(src="plot_5.png", height = 400, width = 500),
        img(src="plot_6.png", height = 400, width = 500),
        img(src="plot_7.png", height = 400, width = 500),
        img(src="plot_8.png", height = 400, width = 500),
        img(src="plot_9.png", height = 400, width = 500),
        img(src="plot_10.png", height = 400, width = 500),
        img(src="plot_11.png", height = 400, width = 500),
        img(src="plot_12.png", height = 400, width = 500),
        img(src="plot_13.png", height = 400, width = 500)
      )})
  
  output$map <- renderGvis({if(input$select1 != '')
    gvisGeoChart(states, "Origin.State", "Ratio",
                 options=list(region="US", 
                              displayMode="regions", 
                              resolution="provinces",
                              width=400, height=300))})
  
  output$models <- renderDataTable(
    models, options = list(paging = FALSE, searching = FALSE))
  
  output$data <- renderDataTable(
    data, options = list(paging = FALSE, searching = FALSE))
})