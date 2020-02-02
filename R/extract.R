if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

if (!requireNamespace("dplyr", quietly = TRUE))
  install.packages("dplyr")

if (!requireNamespace("made4", quietly = TRUE))
  BiocManager::install("made4")

if (!requireNamespace("tidyr", quietly = TRUE))
  install.packages("tidyr")

library(made4)
library(dplyr)
library(tidyr)

data(khan)

khan_df <- khan$train

# gene annotation
gene_id <- row.names(khan_df)

gene_annot <- khan[["annotation"]]

# sample annotation
sample_name <- colnames(khan_df)

# sample_name <- strsplit(col_name,split="\\.")

sample_cell_type <-  khan[["cellType"]]
sample_tumor_type <- as.character(khan[["train.classes"]])
sample_annot <- cbind(sample_name,sample_cell_type, sample_tumor_type)

# part1 <- unlist(lapply(sample_name, tail, 1))

khan_df <- cbind(gene_id, khan_df)

khan_df_long <- gather(khan_df, sample_name, measurement, -gene_id)

write.csv(x = khan_df,      file = file.path("data", "khan_wide.csv"), row.names = FALSE)
write.csv(x = khan_df_long, file = file.path("data", "khan_long.csv"), row.names = FALSE)
write.csv(x = sample_annot, file = file.path("data", "khan_sample_annot.csv"), row.names = FALSE)
write.csv(x = gene_annot,   file = file.path("data", "khan_gene_annot.csv"), row.names = FALSE)
