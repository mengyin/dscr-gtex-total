# Moderated t-test (Smyth, 2005)
# Using R package "limma"
# input: Y - data matrix such that samplemean=betahat, sd(samplemean)=sebetahat
library(limma)

limma.wrapper = function(input,args){

  if (args$transform=="voom" ){
    fit = lmFit(input$v)
    fit = eBayes(fit, robust=args$robust)
  }else if(args$transform=="RUVvoom"){
    fit = lmFit(input$RUVv)
    fit = eBayes(fit, robust=args$robust)
  }else if(args$transform=="SVAvoom"){
    fit = lmFit(input$SVAv)
    fit = eBayes(fit, robust=args$robust)
  }else{
    #fit = lmFit(input$Y, rep(1,dim(input$Y)[2]))
    stop("Cannot use limma to analyze the input.")
  }
  return(list(pvalue = fit$p.value[,2]))
}
