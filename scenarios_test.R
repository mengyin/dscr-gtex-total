sourceDir("datamakers")
fileName = 'data_path.txt'
path = gsub("[[:space:]]", "", readChar(fileName, file.info(fileName)$size))

# dsc-gtex-top10000
addScenario(dsc_gtex,name="null-top10000-2vs2", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", path=path,
                      Nsamp=2, Ngene=10000,
                      voom.normalize=TRUE),
            seed=1:1)

# addScenario(dsc_gtex,name="null-top10000-10vs10", fn=datamaker,
#             args=list(tissue="Adipose-Subcutaneous", path=path,
#                       Nsamp=10, Ngene=10000,
#                       voom.normalize=TRUE),
#             seed=1:50)
# 
# addScenario(dsc_gtex,name="null-top10000-50vs50", fn=datamaker,
#             args=list(tissue="Adipose-Subcutaneous", path=path,
#                       Nsamp=50, Ngene=10000,
#                       voom.normalize=TRUE),
#             seed=1:50)

# dsc-gtex-break-top10000
addScenario(dsc_gtex,name="null-break-top10000-2vs2", fn=datamaker,
            args=list(tissue="Adipose-Subcutaneous", 
                      Nsamp=2, Ngene=10000, breaksample=TRUE, path=path,
                      voom.normalize=TRUE),
            seed=1:1)

# addScenario(dsc_gtex,name="null-break-top10000-10vs10", fn=datamaker,
#             args=list(tissue="Adipose-Subcutaneous", 
#                       Nsamp=10, Ngene=10000, breaksample=TRUE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)
# 
# addScenario(dsc_gtex,name="null-break-top10000-50vs50", fn=datamaker,
#             args=list(tissue="Adipose-Subcutaneous",
#                       Nsamp=50, Ngene=10000, breaksample=TRUE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)

# dscr-gtex-diff-top10000
addScenario(dsc_gtex,name="alt-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, breaksample=FALSE, path=path,
                      voom.normalize=TRUE),
            seed=1:1)

# addScenario(dsc_gtex,name="alt-top10000-10vs10", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
#                       Nsamp=10, Ngene=10000, breaksample=FALSE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)
# 
# addScenario(dsc_gtex,name="alt-top10000-50vs50", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"),
#                       Nsamp=50, Ngene=10000, breaksample=FALSE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)

# dscr-gtex-break-diff-top10000
addScenario(dsc_gtex,name="alt-break-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, breaksample=TRUE, path=path,
                      voom.normalize=TRUE),
            seed=1:1)

# addScenario(dsc_gtex,name="alt-break-top10000-10vs10", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
#                       Nsamp=10, Ngene=10000, breaksample=TRUE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)
# 
# addScenario(dsc_gtex,name="alt-break-top10000-50vs50", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"),
#                       Nsamp=50, Ngene=10000, breaksample=TRUE, path=path,
#                       voom.normalize=TRUE),
#             seed=1:50)

# dscr-gtex-break-mix-top10000
addScenario(dsc_gtex,name="mix-break-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
                      Nsamp=2, Ngene=10000, path=path,
                      voom.normalize=TRUE,
                      breaksample=TRUE, nullpi=0.9),
            seed=1:1)

# addScenario(dsc_gtex,name="mix-break-top10000-10vs10", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"), 
#                       Nsamp=10, Ngene=10000, path=path,
#                       voom.normalize=TRUE, 
#                       breaksample=TRUE, nullpi=0.9),
#             seed=1:5)
# 
# addScenario(dsc_gtex,name="mix-break-top10000-50vs50", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous","Lung"),
#                       Nsamp=50, Ngene=10000, path=path,
#                       voom.normalize=TRUE,
#                       breaksample=TRUE, nullpi=0.9),
#             seed=1:5)

# dscr-gtex-poisthin-top10000
addScenario(dsc_gtex,name="poisthin-top10000-2vs2", fn=datamaker,
            args=list(tissue=c("Adipose-Subcutaneous"), 
                      Nsamp=2, Ngene=10000, path=path,
                      voom.normalize=TRUE,
                      poisthin=TRUE),
            seed=1:1)

# addScenario(dsc_gtex,name="poisthin-top10000-10vs10", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous"), 
#                       Nsamp=10, Ngene=10000, path=path,
#                       voom.normalize=TRUE, 
#                       poisthin=TRUE),
#             seed=1:5)
# 
# addScenario(dsc_gtex,name="poisthin-top10000-50vs50", fn=datamaker,
#             args=list(tissue=c("Adipose-Subcutaneous"),
#                       Nsamp=50, Ngene=10000, path=path,
#                       voom.normalize=TRUE,
#                       poisthin=TRUE),
#             seed=1:5)
