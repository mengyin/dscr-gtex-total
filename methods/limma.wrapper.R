# Moderated t-test (Smyth, 2005)
# Using R package "limma"
# input: Y - data matrix such that samplemean=betahat, sd(samplemean)=sebetahat
limma.wrapper = function(input,args){
  library(limma)
  library(qvalue)
  if (args$transform=="voom" | args$transform=="RUVvoom" | args$transform=="SVAvoom"){
    fit = lmFit(input$v)
    fit = eBayes(fit, robust=args$robust)
  }else if (args$transform=="quasibinom"){
    #fit = lmFit(input$Y, rep(1,dim(input$Y)[2]))
    stop("Cannot use limma to analyze the input.")
  }
  return(list(pvalue = fit$p.value[,2]))
}
