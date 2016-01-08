#This file should define your score function

score = function(data, output){
  if (class(output)=="list"){
    if (is.null(output$qvalue.lfsr)){
      qvalue = output$qvalue
    }else{
      qvalue = output$qvalue.lfsr
    }
    
    FDR_005 = mean(output$qvalue<=0.05,na.rm=TRUE)
    FDP_005 = mean(data$meta$null==1 & output$qvalue<=0.05)
    FDR.fsr_005 = mean(qvalue<=0.05,na.rm=TRUE)
    FDP.fsr_005 = mean(data$meta$null==1 & qvalue<=0.05)
    
    o = order(qvalue)
    TPR = cumsum((1-data$meta$null)[o])/sum(!data$meta$null)
    FPR = cumsum(data$meta$null[o])/sum(data$meta$null)
    
    res = c(FDR_005, FDR.fsr_005, FDP_005, FDP.fsr_005, TPR,FPR)
    names(res) = c("FDR_005","FDR.fsr_005","FDP_005","FDP.fsr_005",paste0("TPR",1:length(o)), paste0("FPR",1:length(o))) 
    return(res)
  }else{
    res = rep(NA, 2*length(data$meta$null)+4)
    names(res) = c("FDR_005","FDR.fsr_005","FDP_005","FDP.fsr_005",paste0("TPR",1:length(data$meta$null)), paste0("FPR",1:length(data$meta$null))) 
    return(res)
  } 
}
