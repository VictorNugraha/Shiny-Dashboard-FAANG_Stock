# header -------------------------------------------------------------------

# header definition
header <- dashboardHeader(
    title = "FAANG Stock Growth 2018-2021"
)


# sidebar -----------------------------------------------------------------

# sidebar definition
sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            text = "About FAANG",
            tabName = "overall",
            icon = icon("book")
        ),
        
        menuItem(
            text = "FAANG Stock Chart",
            tabName = "stock",
            icon = icon("bar-chart-o")
        ),
        
        menuItem(
            text = "Data Source",
            tabName = "data",
            icon = icon("tasks")
        )
    )
)


# body -------------------------------------------------------------------------

body <- dashboardBody(
    tabItems(
        tabItem(
            #BODY TAB 1---------------------------------------------------------
            tabName = "overall",
            
            fluidRow(
                
                box(
                    title = strong("UNDERSTANDING FAANG STOCK"),
                    width = 12,
                    collapsible = TRUE,
                    
                    withSpinner(htmlOutput("text"), type = 8,size = 0.5),
                    htmlOutput("source1")
                ),
                
                box(
                    title = strong("ARE FAANG COMPANIES A GOOD INVESTMENT?"),
                    width = 12,
                    collapsible = TRUE,
                    
                    withSpinner(htmlOutput("text1"), type = 8,size = 0.5),
                    htmlOutput("source2")
                ),
                
            )
        ),
        
        #BODY TAB2--------------------------------------------------------------
        tabItem(
            tabName = "stock",
            
            fluidRow(
                
                box(
                    title = strong("FAANG STOCK PRICE COMPARISON 2018-2021"),
                    width = 12,
                    collapsible = TRUE,
                    
                    htmlOutput("text2"
                    ),
                    
                    checkboxGroupInput(
                        inputId = "stock",
                        label = "Please Choose Stocks To Be Compared:", 
                        choices = c("AAPL", "AMZN", "FB", "GOOGL", "NFLX"),
                        inline = TRUE,
                        selected = c("AAPL", "AMZN", "FB", "GOOGL", "NFLX")
                    ),
                    
                    dateRangeInput(
                        inputId = "date",
                        label = "Please Pick Range Of Date:",
                        start = "2018-01-02",
                        end = "2021-03-25",
                        min = "2018-01-01",
                        max = "2021-03-25"
                    ),
                    withSpinner(plotlyOutput("faangComp"), type = 8,size = 0.5),
                    htmlOutput("text3"),
                ),
                
                box(
                    
                    htmlOutput("text4"
                    ),
                    
                    title = strong("ADVANCE CHART"),
                    width = 12,
                    collapsible = TRUE,
                    
                    tabsetPanel(
                        type = "tabs",
                        tabPanel("AAPL (Apple Stock)", withSpinner(plotlyOutput("applePlot"), type = 8,size = 0.5)),
                        tabPanel("AMZN (Amazon Stock)", withSpinner(plotlyOutput("amazonPlot"), type = 8,size = 0.5)),
                        tabPanel("FB (Facebook Stock)", withSpinner(plotlyOutput("fbPlot"), type = 8,size = 0.5)),
                        tabPanel("GOOGL (Google Stock)", withSpinner(plotlyOutput("googlePlot"), type = 8,size = 0.5)),
                        tabPanel("NFLX (Netflix Stock)", withSpinner(plotlyOutput("netflixPlot"), type = 8,size = 0.5))
                    )
                )
            )
        ),
        
        #BODY TAB3--------------------------------------------------------------
        tabItem(
            tabName = "data",
            
            fluidRow(
                
                box(
                    width = 12,
                    
                    tabsetPanel(
                        type = "tabs",
                        tabPanel("FAANG Stock Data 2018-2021",
                                 fluidPage(withSpinner(dataTableOutput("rawData"), type = 8,size = 0.5))),
                        tabPanel(title = "Source Link",
                                 br(),
                                 strong("Kaggle:"),
                                 withSpinner(htmlOutput("link"), type = 8,size = 0.5))
                    )
                )
            )
        )
    )
)

# full page ---------------------------------------------------------------

# page definition
dashboardPage(
    header = header,
    body = body,
    sidebar = sidebar,
    skin = "black"
)