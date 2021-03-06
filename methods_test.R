# Methods: 
sourceDir("methods")

# addMethod(dsc_gtex,name="DESeq",fn=deseq.wrapper,outputtype="pval_output",args=list(exacttest=TRUE))
# addMethod(dsc_gtex,name="DESeq.glm",fn=deseq.wrapper,outputtype="pval_output",args=list(exacttest=FALSE))
addMethod(dsc_gtex,name="DESeq2",fn=deseq2.wrapper,outputtype="pval_output")

addMethod(dsc_gtex,name="edgeR",fn=edger.wrapper,outputtype="pval_output",args=list(exacttest=TRUE))
addMethod(dsc_gtex,name="edgeR.glm",fn=edger.wrapper,outputtype="pval_output",args=list(exacttest=FALSE))
addMethod(dsc_gtex,name="RUV+edgeR.glm",fn=edger.wrapper,outputtype="pval_output",
          args=list(exacttest=FALSE,RUV=TRUE))
addMethod(dsc_gtex,name="SVA+edgeR.glm",fn=edger.wrapper,outputtype="pval_output",
          args=list(exacttest=FALSE,SVA=TRUE))

addMethod(dsc_gtex,name="voom+limma",fn=limma.wrapper,outputtype="pval_output",
          args=list(transform="voom",robust=FALSE))
addMethod(dsc_gtex,name="voom+limmaR",fn=limma.wrapper,outputtype="pval_output",
          args=list(transform="voom",robust=TRUE))
addMethod(dsc_gtex,name="RUVvoom+limma",fn=limma.wrapper,outputtype="pval_output",
          args=list(transform="RUVvoom",robust=FALSE))
addMethod(dsc_gtex,name="SVAvoom+limma",fn=limma.wrapper,outputtype="pval_output",
          args=list(transform="SVAvoom",robust=FALSE))

addMethod(dsc_gtex,name="voom+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="voom"))
addMethod(dsc_gtex,name="RUVvoom+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="RUVvoom"))
addMethod(dsc_gtex,name="SVAvoom+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="SVAvoom"))
addMethod(dsc_gtex,name="cate+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="cate"))
addMethod(dsc_gtex,name="qb+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="quasibinom"))
addMethod(dsc_gtex,name="RUVqb+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="RUV+quasibinom"))
addMethod(dsc_gtex,name="SVAqb+ash",fn=ash.wrapper,outputtype="ash_output",
          args=list(transform="SVA+quasibinom"))
# addMethod(dsc_gtex,name="Myrnaqb+ash",fn=ash.wrapper,outputtype="ash_output",
#           args=list(transform="Myrna+quasibinom"))
# addMethod(dsc_gtex,name="Myrnaoffqb+ash",fn=ash.wrapper,outputtype="ash_output",
#           args=list(transform="Myrnaoff+quasibinom"))


addMethod(dsc_gtex,name="voom+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="voom",singlecomp=TRUE))

addMethod(dsc_gtex,name="RUVvoom+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="RUVvoom",singlecomp=TRUE))
addMethod(dsc_gtex,name="SVAvoom+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="SVAvoom",singlecomp=TRUE))

addMethod(dsc_gtex,name="qb+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="quasibinom",singlecomp=TRUE))

addMethod(dsc_gtex,name="RUVqb+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="RUV+quasibinom",singlecomp=TRUE))

addMethod(dsc_gtex,name="SVAqb+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="SVA+quasibinom",singlecomp=TRUE))

addMethod(dsc_gtex,name="Myrnaqb+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="Myrna+quasibinom",singlecomp=TRUE))

# addMethod(dsc_gtex,name="qb+jointash_disp.single.u",fn=jointash_disp.wrapper,outputtype="jointash_output",
#           args=list(transform="quasibinom",singlecomp=TRUE))

# addMethod(dsc_gtex,name="Myrnaoffqb+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
#           args=list(transform="Myrnaoff+quasibinom",singlecomp=TRUE))

addMethod(dsc_gtex,name="edgeRglm+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="edgeRglm",singlecomp=TRUE))

addMethod(dsc_gtex,name="DESeq2glm+jointash.single.u",fn=jointash.wrapper,outputtype="jointash_output",
          args=list(transform="DESeq2glm",singlecomp=TRUE))
