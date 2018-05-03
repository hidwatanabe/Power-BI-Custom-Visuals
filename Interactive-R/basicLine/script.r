source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################
idOrder = sort.int(ID[,1],index.return = TRUE)
xaxis = X[idOrder$ix,1]
yaxis = Y[idOrder$ix,1]
data <- data.frame(xaxis, yaxis)

################### Actual code ####################
p <- plot_ly(data, x = ~xaxis, y = ~yaxis, type = 'scatter', mode = 'lines')

####################################################
disablebottomnlist<-list("toImage","Collaborate")
p$x$config$modeBarButtonsToRemove=disablebottomnlist

############# Create and save widget ###############
internalSaveWidget(p, 'out.html');
ReadFullFileReplaceString('out.html', 'out.html', ',"padding":40,', ',"padding":0,')
####################################################
