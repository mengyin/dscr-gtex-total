sourceDir("datamakers")
fileName = 'data_path.txt'
path = gsub("[[:space:]]", "", readChar(fileName, file.info(fileName)$size))

# dsc-gtex-top10000
# Separate one tissue's samples into 2 groups, so all genes are null
addScenario(dsc_gtex,name="null-top10000-2vs2", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", path=path,
                      Nsamp=2, Ngene=10000),
            seed=1:50)

addScenario(dsc_gtex,name="null-top10000-10vs10", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", path=path,
                      Nsamp=10, Ngene=10000),
            seed=1:50)

addScenario(dsc_gtex,name="null-top10000-50vs50", fn=datamaker,
           args=list(tissue="Adipose-Subcutaneous", path=path,
               Nsamp=50, Ngene=10000),
            seed=1:50)

# dsc-gtex-break-top10000
# Separate one tissue's samples into 2 groups, so all genes are null
# For each gene, select counts from different GTEx samples, so break the within sample correlation
addScenario(dsc_gtex,name="null-break-top10000-2vs2", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", 
                      Nsamp=2, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="null-break-top10000-10vs10", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", 
                      Nsamp=10, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="null-break-top10000-50vs50", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous",
                      Nsamp=50, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

# dscr-gtex-diff-top10000
# Compare 2 tissues (tissue1 as group A and tissue2 as group B)
addScenario(dsc_gtex,name="alt-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, breaksample=FALSE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="alt-top10000-10vs10", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=10, Ngene=10000, breaksample=FALSE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="alt-top10000-50vs50", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"),
                      Nsamp=50, Ngene=10000, breaksample=FALSE, path=path),
            seed=1:50)

# dscr-gtex-break-diff-top10000
# Compare 2 tissues (tissue1 as group A and tissue2 as group B)
# For each gene, select counts from different GTEx samples, so break the within sample correlation
addScenario(dsc_gtex,name="alt-break-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="alt-break-top10000-10vs10", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=10, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

addScenario(dsc_gtex,name="alt-break-top10000-50vs50", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"),
                      Nsamp=50, Ngene=10000, breaksample=TRUE, path=path),
            seed=1:50)

# dscr-gtex-break-mix-top10000
# For each gene, select counts from different GTEx samples, so break the within sample correlation.
# 90% genes are nulls (all counts come from tissue1), and 10% genes are alternatives 
# (tissue1's counts for group A and tissue2's counts for group B)
addScenario(dsc_gtex,name="mix-break-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, path=path,
                      breaksample=TRUE, nullpi=0.9),
            seed=1:15)

addScenario(dsc_gtex,name="mix-break-top10000-10vs10", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=10, Ngene=10000, path=path,
                      breaksample=TRUE, nullpi=0.9),
            seed=1:15)

addScenario(dsc_gtex,name="mix-break-top10000-50vs50", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"),
                      Nsamp=50, Ngene=10000, path=path,
                      breaksample=TRUE, nullpi=0.9),
            seed=1:15)

# dscr-gtex-poisthin-top10000
# Use Poisson thinning to thinn 10% genes and produce alternatives. The rest 90% genes are nulls.
addScenario(dsc_gtex,name="poisthin-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous"), 
                      Nsamp=2, Ngene=10000, path=path,
                      poisthin=TRUE, nullpi=0.9),
            seed=1:15)

addScenario(dsc_gtex,name="poisthin-top10000-10vs10", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous"), 
                      Nsamp=10, Ngene=10000, path=path,
                      poisthin=TRUE, nullpi=0.9),
            seed=1:15)

addScenario(dsc_gtex,name="poisthin-top10000-50vs50", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous"),
                      Nsamp=50, Ngene=10000, path=path,
                      poisthin=TRUE, nullpi=0.9),
            seed=1:15)
