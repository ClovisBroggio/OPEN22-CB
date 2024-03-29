varc <- function(x) {       # ent�te de la fonction
  n <- length(x)            # l'effectif
  sce <- sum((x-mean(x))^2) # les SCE
  sce/n                     # la variance de l'echantillon
}

var2 <- function(x, type) { 
  if(type=="estim")       {return(var(x))}            # Variance estim�e
  if(type=="calc")        {return(varc(x))}           # Variance calcul�e
  else if (type=="both")  {return(cbind(var(x), varc(x)))} # les deux cote � cote
}

viewerpane<-function(file){
  tempDir <- tempfile() ;  dir.create(tempDir) 
  workDir <- getwd()
  htmlFileWD <- file.path(workDir, file)
  htmlFileTE <- file.path(tempDir, file)
  file.copy(htmlFileWD, tempDir, overwrite = TRUE)
  viewer(htmlFileTE)
}

plotME <- function(y, fac, col="black", cex=1, pch=16, lwd=1, lty=1, ylab="y") {
  meay<-tapply(y, fac, mean)          # la moyenne par groupe
  sdy<-tapply(y, fac, sd)             # l'�cart-type par groupe
  x<-1:nlevels(fac)                 # la position des moyenne sur x
  stripchart(y~fac, cex=0, vertical=T, las=2, ylab=ylab)    # un graphique vide
  points(x, meay, pch=pch, col=col, cex=cex)      # on place les points
  arrows(x, meay-sdy, x, meay+sdy, col=col, lwd=lwd, lty=lty, code=3, angle=90, le=0.05)
  # la derni�re ligne est un d�tournement de arrows() pour faire des barres d'erreur
}