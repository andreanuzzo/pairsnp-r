# pairsnp-r

[![Travis-CI Build Status](https://travis-ci.org/gtonkinhill/pairsnp-r.svg?branch=master)](https://travis-ci.org/gtonkinhill/pairsnp-r)

## Installation

The R version can be installed using devtools

```
#install.packages("devtools")
devtools::install_github("gtonkinhill/pairsnp-r")
```

## Quick Start

```
library(pairsnp)
fasta.file.name <- system.file("extdata", "seqs.fa", package = "pairsnp")
sparse.data <- import_fasta_sparse(fasta.file.name)
d <- snp_dist(sparse.data)
```
