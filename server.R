function(input, output) {
    
#Tab 1--------------------------------------------------------------------------
    
    #BOX1-----------------------------------------------------------------------
    output$text <- renderUI({
        
        div(style = "text-align:justify",
        HTML(
            paste("FAANG is an acronym used to describe some of the most prominent 
                  companies in the tech sector. Originally the acronym was FANG, for 
                  Facebook, Amazon, Netflix, and Alphabet (formerly Google). In 2017, 
                  investors started including Apple in the group, turning the acronym 
                  into FAANG.
                   <br>
                   <br>
                   Over the past decade, the FAANG stocks have grown faster than the 
                   overall S&P 500 or the more technology-focused NASDAQ. The original 
                   four FANG stocks were all internet-based companies, but the later 
                   inclusion of Apple primarily a consumer hardware manufacturer made 
                   FAANG a broader group of technology stocks.
                   <br>
                   <br>
                   <b>- Facebook <i>(NASDAQ:FB)</i>:</b> 
                   <br>
                   Facebook owns two of the most engaging and largest social media apps 
                   in the world its namesake, Facebook, and Instagram as well as two of 
                   the biggest messaging apps, WhatsApp and Messenger. It makes money by 
                   displaying ads to users while they browse through feeds of photos and 
                   videos.
                   <br>
                   <b>- Amazon <i>(NASDAQ:AMZN)</i>:</b> 
                   <br>
                   Amazon is the largest business-to-consumer e-commerce company in the 
                   world. Its Prime membership program has over 150 million global 
                   subscribers who have proven extremely loyal to the company's online 
                   marketplace. While e-commerce accounts for the bulk of its revenue, 
                   Amazon has found profit engines in cloud computing services and 
                   advertising.
                   <br>
                   <b>- Apple <i>(NASDAQ:AAPL)</i>:</b>
                   <br>
                   Apple is one of the biggest smartphone manufacturers in the world. 
                   Device sales account for most of Apple's revenue, but in recent years 
                   the company has also focused on higher-margin subscription services, 
                   including streaming music and video, gaming, news, and cloud storage.
                   <br>
                   <b>- Netflix <i>(NASDAQ:NFLX)</i>:</b> 
                   <br>
                   Neflix is one of the first internet-born media companies. In 2007 it 
                   started to shift from a DVD-by-mail service to on-demand streaming, 
                   and in 2012 it started investing in its own original content for the 
                   streaming service. Today Netflix is one of the biggest buyers of film 
                   and television productions in the world, serving tens of millions of 
                   global subscribers.
                   <br>
                   <b>- Google <i>(NASDAQ:GOOGL)</i>:</b>
                   <br>
                   Goolge is a tech conglomerate, primarily split between Google and its 
                   segment. While Google started as an internet search company, it's 
                   continued to acquire and develop consumer-facing products, nine of 
                   which boast over 1 billion users each. Google also encompasses a 
                   growing cloud computing business and a relatively small hardware 
                   business. The other bets segment includes Alphabet's moonshots, such as
                   automated-vehicle business Waymo and health researcher Verily.
                  <br>
                  <br>
                   "
            )
        )
        )
        
    })
    
    output$source1 <- renderUI({a("Source", 
                                  href=paste("https://www.fool.com/investing/stock-market/market-sectors/information-technology/faang-stocks/", 
                                             sep =""), 
                                  target = "_blank")
    })
    
    #BOX2-----------------------------------------------------------------------
    output$text1 <- renderUI({
        
        div(
            style = "text-align:justify",
            HTML(
                paste(
                    "
                    FAANG stocks have historically outperformed the S&P 500 index. Since 
                    the market bottom in March of 2009, the worst-performing FAANG stock,
                    Alphabet, has returned more than double the index average.
                    As every investor should know, past results don't guarantee future 
                    success. That said, FAANG companies exhibit several competitive 
                    advantages that make them appealing long-term investments.
                    <br>
                    <br>
                    Most of the FAANG companies benefit from the network effect.
                    <br>
                    - Facebook's products are valuable to new users because of its 
                    billions of other active users.
                    <br>
                    - Amazon's Prime service brings tens of millions of shoppers to 
                    its marketplace every day, which makes its seller services more 
                    attractive to third-party merchants.
                    <br>
                    - The lock-in effect of the Apple ecosystem creates significant 
                    switching costs for iOS users. That advantage is getting stronger 
                    as Apple develops more services like Apple Music and Apple Arcade.
                    <br>
                    - Netflix's tens of millions of viewers provide feedback about what 
                    kind of content the company should invest in and provide the revenue 
                    to support its massive budget.
                    <br>
                    - Google products, including YouTube and Search, benefit from their 
                    billion-plus users.
                    <br>
                    <br>
                    All five FAANG companies have intangible assets that should make them 
                    more profitable than their rivals. Facebook, Amazon, and Google have 
                    troves of user data they can use to target advertisements. Netflix's 
                    move to original content and exclusive licenses makes its content 
                    library irreplicable. Apple is one of the few companies that makes
                    both the hardware and the software for its devices and is certainly 
                    the only one doing it at its scale.
                    <br>
                    <br>
                    These competitive advantages can make the FAANG stocks great potential
                    investments. Still, investors may want to examine each stock's
                    valuation relative to its own historical value and that of comparable 
                    competitors before buying.
                    <br>
                    <br>
                    "
                )
            )
        )
    })
    
    output$source2 <- renderUI({a("Source", 
                                  href=paste("https://www.fool.com/investing/stock-market/market-sectors/information-technology/faang-stocks/", 
                                             sep =""), 
                                  target = "_blank")
    })
    
    
    
    #Tab 2--------------------------------------------------------------------------
    
    #TEXT ABOVE PLOT1-----------------------------------------------------------
    output$text2 <- renderUI({
        
        div(
            style = "text-align:justify",
            HTML(
                paste(
                    "
                    In this section FAANG stock price from 2018 until 25 March 2021 will be compared. 
                    The stock price will be compared using line chart because line chart is the most basic type of chart used in finance and typically only depicts a security's closing prices over time. 
                    <br>
                    <br>
                    "
                )
            )
        )
    })
    
    #PLOT 1---------------------------------------------------------------------
    output$faangComp <- renderPlotly({
                     
        plot_faang_mutate <-  faang_start_2018 %>%
            req(input$stock) %>% 
            filter(Stock.Initial %in% input$stock) %>% 
            filter(Date >= input$date[1] & Date <= input$date[2]) %>% 
            mutate(text = glue(
                "Company: {Company}
                Date: {Date}
                 Price: {round(Close, 2)}")) %>% 
            ggplot(mapping = aes(
                x = Date,
                y = Adj.Close, 
                text = text,
                group = Stock.Initial,
                color = Stock.Initial
            )) +
            geom_line() +
            labs(title = "FAANG Stock Trend 2018-2021",
                 subtitle = "",
                 x = "Date",
                 y = "Closing Price ($)",
                 color = "") +
            theme_bw()
        
        
        ggplotly(plot_faang_mutate, tooltip = "text")
        
    })
    
    #TEXT BELOW PLOT1-----------------------------------------------------------
    
    output$text3 <- renderUI({
        div(
            style = "text-align:justify",
            HTML(
                paste(
                    "
                    <br>
                    From FAANG stock price comparison based on line plot above, the highest stock price was Amazon followed 
                    by Google, Netflix, Facebook and Apple respectively. The most significant price 
                    growh occured at Amazon and Google, for Amazon the price was growth from <i><b>$1,189.01 to 
                    $3,052.03 (256.68%)</b></i> and for Google the price was growth from <i><b>$1,065 to $2,035.55 (191.13%)</b></i>.
                    Although, Facebook and Netflix start at approximately same price around $180 but the stock
                    price growth for Netflix was much better compared to Facebook, with percetage of growth
                    <i><b>252.66%</b></i> for Netflix and <i><b>156%</b></i> for Facebook. Apple stock price growth was the slowest among the 
                    other four company with growth only <i><b>$77.53</b></i> from 2018 until 25 March 2021.
                    "
                )
            )
        )
        
    })
    
    #TEXT ABOVE PLOT2-----------------------------------------------------------
    
    output$text4 <- renderUI({
        
        div(
            style = "text-align:justify",
            HTML(
                paste(
                    "
                    In this section the FAANG stock will be divided into five different 
                    panel to be analysed with more advanced chart which is a combination  
                    chart between <i>Candlestick Chart</i> and <i>Bar Chart</i>.
                    <br>
                    <br>
                    <b>- Candlestick Chart:</b>
                    <br>
                    A candlestick is a type of price chart used in technical analysis that
                    displays the<i><b> high, low, open, and closing prices for a specific 
                    period</i></b>.
                    Usually inside a candlestick will be filled with color either green or
                    red, those two color conveys a different meaning.
                    <br>
                    <font color =\"green\"><i> *Green Filled Candlestick</i> occur when the close is greater than the prior close but lower than the open.</font color =\"green\">
                    <br>
                    <font color =\"red\"><i> *Red Filled Candlestick</i> occur when the close is below the open and prior close.</font color =\"red\">
                    <br>
                    <br>
                    <b>- Bar Chart:</b>
                    <br>
                    Bar chart will be used to provide information about stock volume. Volume in stock can be a barometer of future activity and direction. Volume measures the number of contracts that exchanged hands during the trading session. It measures market activity.
                    <br>
                    <br>
                    "
                )
            )
        )
    })
    
    #PLOT2----------------------------------------------------------------------
    output$applePlot <- renderPlotly({
        
        apple_p1 <- apple_18 %>%
            plot_ly(x = ~Date,
                    type = "candlestick", 
                    open = ~Open, 
                    close = ~Close, 
                    high = ~High,
                    low = ~Low,
                    name = "Price") %>%
            layout(
                xaxis = list(
                    rangeselector = list(
                        buttons = list(
                            list(
                                count = 5,
                                label = "5 Days",
                                step = "day",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Month",
                                step = "week",
                                stepmode = "backward"),
                            list(
                                count = 3,
                                label = "3 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 6,
                                label = "6 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Year",
                                step = "year",
                                stepmode = "backward"),
                            list(
                                count = 2,
                                label = "2 Years",
                                step = "year",
                                stepmode = "backward"),
                            list(label ="All",
                                step = "all"))),
                    rangeslider = list(visible = FALSE)),
                yaxis = list(title = "Price ($)",
                             showgrid = TRUE,
                             showticklabels = TRUE)) 
        
        apple_p2 <- apple_18 %>%
            plot_ly(x=~Date, y=~Volume, type='bar', name = "Volume") %>%
            layout(yaxis = list(title = "Volume"))
        
        apple_fig <- subplot(apple_p1, apple_p2, heights = c(0.7,0.2), nrows=2,
                             shareX = TRUE, titleY = TRUE)
        apple_fig
    })
    
    output$amazonPlot <- renderPlotly({
        
        amazon_p1 <- amazon_18 %>%
            plot_ly(x = ~Date,
                    type = "candlestick", 
                    open = ~Open, 
                    close = ~Close, 
                    high = ~High,
                    low = ~Low,
                    name = "Price") %>%
            layout(
                xaxis = list(
                    rangeselector = list(
                        buttons = list(
                            list(
                                count = 5,
                                label = "5 Days",
                                step = "day",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Month",
                                step = "week",
                                stepmode = "backward"),
                            list(
                                count = 3,
                                label = "3 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 6,
                                label = "6 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Year",
                                step = "year",
                                stepmode = "backward"),
                            list(
                                count = 2,
                                label = "2 Years",
                                step = "year",
                                stepmode = "backward"),
                            list(label = "All",
                                step = "all"))),
                    rangeslider = list(visible = FALSE)),
                yaxis = list(title = "Price ($)",
                             showgrid = TRUE,
                             showticklabels = TRUE))
        
        amazon_p2 <- amazon_18 %>%
            plot_ly(x=~Date, y=~Volume, type='bar', name = "Volume") %>%
            layout(yaxis = list(title = "Volume"))
        
        amazon_fig <- subplot(amazon_p1, amazon_p2, heights = c(0.7,0.2), nrows=2,
                              shareX = TRUE, titleY = TRUE)
        amazon_fig
    })
    
    output$fbPlot <- renderPlotly({
        
        fb_p1 <- fb_18 %>%
            plot_ly(x = ~Date,
                    type = "candlestick", 
                    open = ~Open, 
                    close = ~Close, 
                    high = ~High,
                    low = ~Low,
                    name = "Price") %>%
            layout(
                xaxis = list(
                    rangeselector = list(
                        buttons = list(
                            list(
                                count = 5,
                                label = "5 Days",
                                step = "day",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Month",
                                step = "week",
                                stepmode = "backward"),
                            list(
                                count = 3,
                                label = "3 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 6,
                                label = "6 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Year",
                                step = "year",
                                stepmode = "backward"),
                            list(
                                count = 2,
                                label = "2 Years",
                                step = "year",
                                stepmode = "backward"),
                            list(label = "All",
                                step = "all"))),
                    rangeslider = list(visible = FALSE)),
                yaxis = list(title = "Price ($)",
                             showgrid = TRUE,
                             showticklabels = TRUE))
        
        fb_p2 <- fb_18 %>%
            plot_ly(x=~Date, y=~Volume, type='bar', name = "Volume") %>%
            layout(yaxis = list(title = "Volume"))
        
        fb_fig <- subplot(fb_p1, fb_p2, heights = c(0.7,0.2), nrows=2,
                          shareX = TRUE, titleY = TRUE)
        fb_fig
    })
    
    output$googlePlot <- renderPlotly({
        
        google_p1 <- google_18 %>%
            plot_ly(x = ~Date,
                    type = "candlestick", 
                    open = ~Open, 
                    close = ~Close, 
                    high = ~High,
                    low = ~Low,
                    name = "Price") %>%
            layout(
                xaxis = list(
                    rangeselector = list(
                        buttons = list(
                            list(
                                count = 5,
                                label = "5 Days",
                                step = "day",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Month",
                                step = "week",
                                stepmode = "backward"),
                            list(
                                count = 3,
                                label = "3 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 6,
                                label = "6 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Year",
                                step = "year",
                                stepmode = "backward"),
                            list(
                                count = 2,
                                label = "2 Years",
                                step = "year",
                                stepmode = "backward"),
                            list(label = "All",
                                step = "all"))),
                    rangeslider = list(visible = FALSE)),
                yaxis = list(title = "Price ($)",
                             showgrid = TRUE,
                             showticklabels = TRUE))
        
        google_p2 <- google_18 %>%
            plot_ly(x=~Date, y=~Volume, type='bar', name = "Volume") %>%
            layout(yaxis = list(title = "Volume"))
        
        google_fig <- subplot(google_p1, google_p2, heights = c(0.7,0.2), nrows=2,
                              shareX = TRUE, titleY = TRUE)
        google_fig
    })
    
    output$netflixPlot <- renderPlotly({
        
        netflix_p1 <- netflix_18 %>%
            plot_ly(x = ~Date,
                    type = "candlestick", 
                    open = ~Open, 
                    close = ~Close, 
                    high = ~High,
                    low = ~Low,
                    name = "Price") %>%
            layout(
                xaxis = list(
                    rangeselector = list(
                        buttons = list(
                            list(
                                count = 5,
                                label = "5 Days",
                                step = "day",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Month",
                                step = "week",
                                stepmode = "backward"),
                            list(
                                count = 3,
                                label = "3 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 6,
                                label = "6 Months",
                                step = "month",
                                stepmode = "backward"),
                            list(
                                count = 1,
                                label = "1 Year",
                                step = "year",
                                stepmode = "backward"),
                            list(
                                count = 2,
                                label = "2 Years",
                                step = "year",
                                stepmode = "backward"),
                            list(label = "All",
                                step = "all"))),
                    rangeslider = list(visible = FALSE)),
                yaxis = list(title = "Price ($)",
                             showgrid = TRUE,
                             showticklabels = TRUE))
        
        netflix_p2 <- netflix_18 %>%
            plot_ly(x=~Date, y=~Volume, type='bar', name = "Volume") %>%
            layout(yaxis = list(title = "Volume"))
        
        netflix_fig <- subplot(netflix_p1, netflix_p2, heights = c(0.7,0.2), nrows=2,
                               shareX = TRUE, titleY = TRUE)
        netflix_fig
    })
    
    #Tab 3--------------------------------------------------------------------------
    
    #PANEL1---------------------------------------------------------------------
    output$rawData <- renderDataTable({faang_start_2018
    })
    
    #PANEL2---------------------------------------------------------------------
    output$link <- renderUI({a("Click this to download the dataset.", 
                               href=paste("https://www.kaggle.com/specter7/amazon-amzn-historical-stock-price-data", 
                                          sep =""), 
                               target = "_blank")
    })
    
}