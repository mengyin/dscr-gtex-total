library(dscr)

dsc_gtex = new.dsc("gtex","dsc-gtex-files")
source("scenarios.R")
source("methods.R")
#source("score.R")
source("score_short.R")
source("choose_ash_parameters.R")

jointash2qval_est =function(output){
  library(ashr)
  if (class(output)=="list"){
    qvalue = output$fit$qvalue
    qvalue.fsr = qval.from.lfdr(output$fit$lfsr)
    pi0 = output$fit$fitted.g$pi[1]
    #qvalue.fsra = qval.from.lfdr(output$fit$lfsra)
    return(list(qvalue=qvalue, qvalue.fsr=qvalue.fsr, pi0=pi0))
  }else{
    return(list(qvalue=NA, qvalue.fsr=NA, pi0=NA))
  }
} 
pval2qval_est =function(output){
  if (class(output)=="list"){
    qq = qvalue(output$pvalue[!is.na(output$pvalue)])
    qvalue = rep(NA,length(output$pvalue))
    qvalue[!is.na(output$pvalue)] = qq$qval
    return(list(qvalue=qvalue, pi0=qq$pi0))
  }else{
    return(list(qvalue=NA, pi0=NA))
  }
}
addOutputParser(dsc_gtex,"pval2qval",pval2qval_est,"pval_output","qval_output")
addOutputParser(dsc_gtex,"jointash2qval",jointash2qval_est,"jointash_output","qval_output")
addOutputParser(dsc_gtex,"ash2qval",jointash2qval_est,"ash_output","qval_output")

addScore(dsc_gtex,score,name="score",outputtype="qval_output")

res=run_dsc(dsc_gtex)

#save(res,file="res.Rdata")

# reg = dsc2BE(dsc_gtex, "BE_gtex", 5)

