FROM rcavalcante/r3.4.4_bioc3.6:latest

# Need to install some addition things
RUN Rscript -e "install.packages(c('kableExtra', 'openxlsx', 'tidyverse', 'pheatmap'), repos='https://cran.rstudio.com'); devtools::install_github('sartorlab/methylSig', dep = FALSE); devtools::install_github('rcavalcante/GenomeInfoDb@RELEASE_3_6', dep = FALSE); source('http://bioconductor.org/biocLite.R'); biocLite(c('BSgenome.Hsapiens.UCSC.hg19','BSgenome.Hsapiens.UCSC.hg38','BSgenome.Mmusculus.UCSC.mm10'));"

RUN mkdir -p /nfs/med-bfx-activeprojects/rcavalca/tmp
ENV TMPDIR /nfs/med-bfx-activeprojects/rcavalca/tmp
