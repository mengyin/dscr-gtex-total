# Dynamic statistical comparison of different methods to detect differential gene expression

input: 
1. Generate a GTEx expression count matrix (scenario parameters: sample size, tissue, number of genes, null proportion, etc).
2. Estimate effect sizes and standard errors from the current count matrix by several approaches (voom, glm, etc).
3. Save the count matrix and effect sizes (betahat), standard errors (sebetahat).

meta: 
Save the true null information of the count matrix.

output:
Existing methods (limma, edgeR, DESeq, etc): apply methods on the count matrix, save the q-values. 
ASH-related methods: apply ash-related methods on the betahats and sebetahats, save the whole ASH output objects (lists).

output parser:
Use an output parser to extract q-values from ASH ouputs.

scores:
Use the true null information (meta) and q-values (output) to compute scores: discovery proportion at 0.05, false discovery proportion, estimated null proportion, etc. 





