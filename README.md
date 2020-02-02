This is the repository for the `khan dataset` from the `made4` r package.


Here is a brief description:

* published by Khan et al. (2001).
* four types of small round blue cell tumours of childhood (SRBCT)
* multivariate
* gene expression
* microarray measurements
* 306 genes
* 64 patient samples

It is split into three parts, see the `data` folder

* measurements (`khan_long.csv` or `khan_wide.csv`)
* genes (`khan_gene_annot.csv`)
* samples (`khan_sample_annot.csv`)

There are both `wide` and `long` formats versions of the measurements.
The R code used to extract the information is in the `R` folder.
