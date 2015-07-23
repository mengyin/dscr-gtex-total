sourceDir("datamakers")
fileName = 'data_path.txt'
path = gsub("[[:space:]]", "", readChar(fileName, file.info(fileName)$size))

n.sample <- data.frame(num = c(2, 10, 50),
                       name = c('2vs2', '10vs10', '50vs50'))

for (i in 1:3) {
    # dsc-gtex-top10000
    addScenario(dsc_gtex,name=paste0("null-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue="Adipose-Subcutaneous", path=path,
                    Nsamp=x$num[i], Ngene=10000,
                    voom.normalize=TRUE),
                seed=1:50)
    
    # dsc-gtex-break-top10000
    addScenario(dsc_gtex,name=paste0("null-break-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue="Adipose-Subcutaneous", 
                    Nsamp=x$num[i], Ngene=10000, breaksample=TRUE, path=path,
                    voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-diff-top10000
    addScenario(dsc_gtex,name=paste0("alt-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                          Nsamp=x$num[i], Ngene=10000, breaksample=FALSE, path=path,
                          voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-break-diff-top10000
    addScenario(dsc_gtex,name=paste0("alt-break-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                          Nsamp=x$num[i], Ngene=10000, breaksample=TRUE, path=path,
                          voom.normalize=TRUE),
                seed=1:50)

    # dscr-gtex-break-mix-top10000
    addScenario(dsc_gtex,name=paste0("mix-break-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                          Nsamp=x$num[i], Ngene=10000, path=path,
                          voom.normalize=TRUE,
                          breaksample=TRUE, nullpi=0.9),
                seed=1:5)

    # dscr-gtex-poisthin-top10000
    addScenario(dsc_gtex,name=paste0("poisthin-top10000-", x$name[i]), fn=datamaker,
                args=list(tissue=c("Adipose-Subcutaneous"), 
                          Nsamp=x$num[i], Ngene=10000, path=path,
                          voom.normalize=TRUE,
                          poisthin=TRUE),
                seed=1:5)
}
