sourceDir("datamakers")
fileName = 'data_path.txt'
path = gsub("[[:space:]]", "", readChar(fileName, file.info(fileName)$size))

n.sample <- data.frame(num = c(2, 10, 50),
                       name = c('2vs2', '10vs10', '50vs50'))

for (i in 1:3) {
    # dsc-gtex-top10000
    # Separate one tissue's samples into 2 groups, so all genes are null
    addScenario(dsc_gtex,name=paste0("null-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue="Adipose-Subcutaneous", path=path,
                    Nsamp=n.sample$num[i], Ngene=10000,
                    voom.normalize=TRUE),
                seed=1:50)
    
    # dsc-gtex-break-top10000
    # Separate one tissue's samples into 2 groups, so all genes are null
    # For each gene, select counts from different GTEx samples, so break the within sample correlation
    addScenario(dsc_gtex,name=paste0("null-break-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue="Adipose-Subcutaneous", 
                    Nsamp=n.sample$num[i], Ngene=10000, breaksample=TRUE, path=path,
                    voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-diff-top10000
    # Compare 2 tissues (tissue1 as group A and tissue2 as group B)
    addScenario(dsc_gtex,name=paste0("alt-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                    Nsamp=n.sample$num[i], Ngene=10000, breaksample=FALSE,
                    path=path, voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-break-diff-top10000
    # Compare 2 tissues (tissue1 as group A and tissue2 as group B)
    # For each gene, select counts from different GTEx samples, so break the within sample correlation
    addScenario(dsc_gtex,name=paste0("alt-break-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                    Nsamp=n.sample$num[i], Ngene=10000, breaksample=TRUE,
                    path=path, voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-break-mix-top10000
    # For each gene, select counts from different GTEx samples, so break the within sample correlation.
    # 90% genes are nulls (all counts come from tissue1), and 10% genes are alternatives 
    # (tissue1's counts for group A and tissue2's counts for group B)
    addScenario(dsc_gtex,name=paste0("mix-break-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                          Nsamp=n.sample$num[i], Ngene=10000, path=path,
                          voom.normalize=TRUE,
                          breaksample=TRUE, nullpi=0.9),
                seed=1:5)

    # dscr-gtex-poisthin-top10000
    # Use Poisson thinning to thinn 10% genes and produce alternatives. The rest 90% genes are nulls.
    addScenario(dsc_gtex,name=paste0("poisthin-top10000-", n.sample$name[i]),
                fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous"), 
                          Nsamp=n.sample$num[i], Ngene=10000, path=path,
                          voom.normalize=TRUE,
                          poisthin=TRUE),
                seed=1:5)
}

