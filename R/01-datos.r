#cargar paquete de recount3
library("recount3")

#cambiar URL de recount3 a AWS

options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

getOption(
  "recount3_url",
  "http://duffel.rail.bio/recount3"
)

#Se revisan los proyectos con datos de raton
MouseProjects <- available_projects(organism = "mouse")

#Se selecciona un proyecto de interés
ProjectData <- subset(
  MouseProjects,
  project == "SRP068801" & project_type == "data_sources"
)

#Se crea el objeto RSEa con la información
rse_gene_SRP068801 <- create_rse(ProjectData)

#Se convierten las cuentas crudas a cuentas por lectura
assay(rse_gene_SRP068801, "counts") <- compute_read_counts(rse_gene_SRP068801)

