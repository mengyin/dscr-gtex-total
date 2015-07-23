#This file should define your score function
score = function(data, output){
  if (mean(data$meta$null)==0 | mean(data$meta$null)==1){
    return(shortscore(data, output))
  }else{
    return(longscore(data, output))
  }
}



# If all genes are null or alternatives,
# just record the proportion of genes whose qvalue<=0.05
shortscore = function(data, output){
  if (class(output)=="list"){
    qvalue = output$qvalue
    FDR = mean(qvalue<=0.05,na.rm=TRUE)
    if (is.null(output$qvalue.lfsr)){
      FDR.lfsr = FDR
    }else{
      FDR.lfsr = mean(output$qvalue.lfsr<=0.05,na.rm=TRUE)
    }
    res = c(FDR, FDR.lfsr)
    names(res) = c("FDR_005","FDR.fsr_005")
  }else{
    res = c(NA, NA)
    names(res) = c("FDR_005","FDR.fsr_005")
  }
  return(res)
}

# If some genes are null, and some are alternatives,
# also record the ROC curves
longscore = function(data, output){
  if (class(output)=="list"){
    
    qvalue = output$qvalue
    FDR = mean(qvalue<=0.05,na.rm=TRUE)
    if (is.null(output$qvalue.lfsr)){
      FDR.lfsr = FDR
    }else{
      FDR.lfsr = mean(output$qvalue.lfsr<=0.05,na.rm=TRUE)
    }
    
    o = order(output$qvalue)
    TPR = cumsum((1-data$meta$null)[o])/sum(!data$meta$null)
    FPR = cumsum(data$meta$null[o])/sum(data$meta$null)
    #FDR = cumsum(data$meta$null[o])/(1:length(output$qvalue))
    
    if (!is.null(output$qvalue.fsr)){
      o = order(output$qvalue.fsr)
      TPR = cumsum((1-data$meta$null)[o])/sum(!data$meta$null)
      FPR = cumsum(data$meta$null[o])/sum(data$meta$null)
    }
    res = c(FDR, FDR.lfsr, TPR,FPR)
    names(res) = c("FDR_005","FDR.fsr_005",paste0("TPR",1:length(o)), paste0("FPR",1:length(o))) 
    return(res)
  }else{
    res = rep(NA, 2*length(data$meta$null)+2)
    names(res) = c("FDR_005","FDR.fsr_005",paste0("TPR",1:length(data$meta$null)), paste0("FPR",1:length(data$meta$null))) 
    return(res)
  }
}