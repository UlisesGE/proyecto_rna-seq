#Se formatean los datos para facilitar su uso
rse_gene_SRP068801 <- expand_sra_attributes(rse_gene_SRP068801)
colData(rse_gene_SRP068801)[
  ,
  grepl("^sra_attribute", colnames(colData(rse_gene_SRP068801)))
]

rse_gene_SRP068801$`sra_attribute.genotype/variation` <- as.numeric(rse_gene_SRP068801$'sra_attribute.genotype/variation')
rse_gene_SRP068801$sra_attribute.source_name <- factor(tolower(rse_gene_SRP068801$sra_attribute.source_name))
rse_gene_SRP068801$sra_attribute.strain <- as.numeric(rse_gene_SRP068801$sra_attribute.strain)
rse_gene_SRP068801$sra_attribute.tissue <- factor(rse_gene_SRP068801$sra_attribute.tissue)

## Resumen de las variables de interés
summary(as.data.frame(colData(rse_gene_SRP068801)[
  ,
  grepl("^sra_attribute.[genotype/variation|source_name|strain|tissue]", colnames(colData(rse_gene_SRP068801)))
]))
