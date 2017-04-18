#==============================================================================
#       This is a quick introduction to package plotly including some demos
#==============================================================================      

# In case you haven't installed this package
install.packages("plotly")

# A hello world figure
library(plotly)
plot_ly(x = rnorm(1000), y = rnorm(1000), type = "scatter", mode = "markers")


# Basic charts ------------------------------------------------------------
# Line Plots
plot_ly(x = c(1,2,3), y = c(5,6,7), type = "scatter", mode = "lines")

# Scatter Plots
plot_ly(x = c(1,2,3), y = c(5,6,7), type = "scatter", mode = "markers")

# Bar Charts
plot_ly(x = c(1,2,3), y = c(5,6,7), type = "bar", mode = "markers")

# Bubble Charts
plot_ly(x = c(1,2,3), y = c(5,6,7), type = "scatter", mode = "markers",
        size = c(1,5,10), marker = list(color = c('red','blue','green')))

# Heatmaps
plot_ly(z = volcano, type = "heatmap")

# Area Plots
plot_ly(x = c(1,2,3), y = c(5,6,7), type = "scatter", mode = "lines", fill = 'tozeroy')


# Layout ------------------------------------------------------------------
# Legends
set.seed(123)
x = 1:100
y1 = 2*x + rnorm(100)
y2 = -2*x + rnorm(100)

plot_ly(x = x, y = y1, type = "scatter") %>% 
  add_trace(x = x, y = y2) %>% 
  layout(legend = list(x = 1, y =1, bgcolor = '#F3F3F3'))

# Axes
set.seed(123)
x = 1:100
y1 = 2*x + rnorm(100)
y2 = -2*x + rnorm(100)

axis_template <- list(
  showgrid = F,
  zeroline = F,
  nticks = 20,
  showline = T,
  title = "AXIS",
  mirror = 'all'
)

plot_ly(x = x, y = y1, type = 'scatter') %>% 
  layout(
    xaxis = axis_template,
    yaxis = axis_template
  )


# Statistical charts ------------------------------------------------------
# Histograms
x <- rchisq(n = 100, df = 5, ncp = 0)
plot_ly(x = x, type = "histogram")

# Box Plots
plot_ly(y = rnorm(50), type = 'box') %>% 
  add_trace(y = rnorm(50,1)) %>% 
  add_trace(y = rnorm(50,2))

# 2D Histogram
plot_ly(x = rnorm(1000, sd = 10),
        y = rnorm(1000, sd = 5),
        type = 'histogram2d')


# MAPS --------------------------------------------------------------------
# Bubble Map
# Please show in new window to see the whole map
plot_ly(type = 'scattergeo',
        lon = c(-73.5, 151.2),
        lat = c(45.5, -33.8),
        marker = list(
          color = c('red','blue'),
          size = c(30,50)
          ), mode = 'markers')

# Choropleth Map
# Similarly, please show in new window to see the whole map
plot_ly(type = 'choropleth',
        locations = c('AZ','CA','VT'),
        locationmode = 'USA-states',
        colorscale = 'Viridis',
        z = c(10,20,40)) %>% 
        layout(geo = list(scope = 'usa'))

# Scatter Map
# Please show in new window to see the whole map
plot_ly(type = 'scattergeo',
        lon = c(42,39),
        lat = c(12,22),
        text = c('Rome','Greece'),
        mode = 'markers')


# 3D Charts ---------------------------------------------------------------
# 3D Surface Plots
# Using a dataframe:
plot_ly(type = 'surface',
        z = ~volcano)

# 3D Line Plots
plot_ly(type = 'scatter3d',
        x = c(9,8,5,1),
        y = c(1,2,4,8),
        z = c(11,8,15,3),
        mode = 'lines')

# 3D scatter plots
plot_ly(type = 'scatter3d',
        x = c(9,8,5,1),
        y = c(1,2,4,8),
        z = c(11,8,15,3),
        mode = 'markers')

