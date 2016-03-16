#This file should define your score function
library(AUC)

score = function(data, output){
  if (class(output)=="list"){
    if (is.null(output$qvalue.lfsr)){
      qvalue = output$qvalue
    }else{
      qvalue = output$qvalue.lfsr
    }
    
    pi0 = output$pi0
    
    DP_005 = mean(output$qvalue<=0.05,na.rm=TRUE)
    FDP_005 = sum(data$meta$null==1 & output$qvalue<=0.05,na.rm=TRUE)/max(sum(output$qvalue<=0.05,na.rm=TRUE),0.1)
    DP.fsr_005 = mean(qvalue<=0.05,na.rm=TRUE)
    FDP.fsr_005 = sum(data$meta$null==1 & qvalue<=0.05,na.rm=TRUE)/max(sum(qvalue<=0.05,na.rm=TRUE),0.1)
    
    AUC = auc(roc(output$qvalue,factor(data$meta$null)))
    AUC.fsr = auc(roc(qvalue,factor(data$meta$null)))
    
    res = c(pi0, DP_005, DP.fsr_005, FDP_005, FDP.fsr_005, AUC, AUC.fsr)
    names(res) = c("pi0","DP_005","DP.fsr_005","FDP_005","FDP.fsr_005","AUC","AUC.fsr") 
    return(res)
  }else{
    res = rep(NA, 5)
    names(res) = c("pi0","DP_005","DP.fsr_005","FDP_005","FDP.fsr_005","AUC","AUC.fsr") 
    return(res)
  } 
}
