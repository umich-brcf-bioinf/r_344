FROM bioconductor/release_core2:R3.4.4_Bioc3.6

RUN apt-get update -qq && apt-get -y install libssl-dev libssh2-1-dev libcurl4-openssl-dev libxml2-dev texlive pandoc

RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/Archive/xfun/xfun_0.4.tar.gz'); install.packages('https://cran.r-project.org/src/contrib/Archive/mvtnorm/mvtnorm_1.0-8.tar.gz'); install.packages('https://cran.r-project.org/src/contrib/Archive/multcomp/multcomp_1.4-8.tar.gz'); install.packages('https://cran.r-project.org/src/contrib/Archive/rms/rms_5.1-2.tar.gz'); install.packages(c('devtools', 'optparse', 'rmarkdown', 'roxygen2', 'testthat', 'knitr', 'boot', 'gplots', 'pheatmap')); source('http://bioconductor.org/biocLite.R'); biocLite(c('BiocCheck', 'BiocStyle', 'annotatr', 'bsseq', 'chipenrich', 'DelayedArray', 'DSS', 'GO.db', 'org.Dm.eg.db', 'org.Dr.eg.db', 'org.Gg.eg.db', 'org.Hs.eg.db', 'org.Mm.eg.db', 'org.Rn.eg.db', 'TxDb.Dmelanogaster.UCSC.dm3.ensGene', 'TxDb.Dmelanogaster.UCSC.dm6.ensGene', 'TxDb.Drerio.UCSC.danRer10.refGene', 'TxDb.Ggallus.UCSC.galGal5.refGene', 'TxDb.Hsapiens.UCSC.hg19.knownGene', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 'TxDb.Mmusculus.UCSC.mm9.knownGene', 'TxDb.Mmusculus.UCSC.mm10.knownGene', 'TxDb.Rnorvegicus.UCSC.rn4.ensGene', 'TxDb.Rnorvegicus.UCSC.rn5.refGene', 'TxDb.Rnorvegicus.UCSC.rn6.refGene'), ask = TRUE);"
# Need to install some addition things
RUN Rscript -e "install.packages(c('kableExtra', 'openxlsx', 'tidyverse'), repos='https://cran.rstudio.com'); devtools::install_github('sartorlab/methylSig', dep = FALSE); devtools::install_github('rcavalcante/GenomeInfoDb@RELEASE_3_6', dep = FALSE); source('http://bioconductor.org/biocLite.R'); biocLite(c('BSgenome.Hsapiens.UCSC.hg19','BSgenome.Hsapiens.UCSC.hg38','BSgenome.Mmusculus.UCSC.mm10'));"

RUN mkdir -p /nfs/turbo/epicore-active/tmp
ENV TMPDIR /nfs/turbo/epicore-active/tmp
