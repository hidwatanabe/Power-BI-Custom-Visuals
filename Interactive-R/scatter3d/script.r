source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################
idOrder = sort.int(ID[,1],index.return = TRUE)
xaxis = X[idOrder$ix,1]
yaxis = Y[idOrder$ix,1]
zaxis = Z[idOrder$ix,1]
color = COLOR[idOrder$ix,1]
color <- as.factor(color)
data <- data.frame(xaxis, yaxis, zaxis, color)
#data$COLOR <- as.factor(data$COLOR)

################### Actual code ####################
#p <- plot_ly(data, x = ~xaxis, y = ~yaxis, z = ~zaxis, color = ~color, colors = c('#BF382A', '#0C4B8E')) %>% add_markers()
p <- plot_ly(data, x = ~xaxis, y = ~yaxis, z = ~zaxis, color = ~color) %>% add_markers()
#  add_markers() %>%
#  layout(scene = list(xaxis = list(title = 'Weight'),
#                     yaxis = list(title = 'Gross horsepower'),
#                     zaxis = list(title = '1/4 mile time')))

####################################################
disablebottomnlist<-list("toImage","Collaborate")
p$x$config$modeBarButtonsToRemove=disablebottomnlist

############# Create and save widget ###############
internalSaveWidget(p, 'out.html');
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":40,', ',"padding":0,')
####################################################
