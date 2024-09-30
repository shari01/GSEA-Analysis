# GSEA Analysis for Squamous Cell Carcinoma

# Install and load necessary packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# Install required Bioconductor packages
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("ReactomePA")  # Install ReactomePA

# Load necessary libraries
library(clusterProfiler)
library(org.Hs.eg.db)
library(ReactomePA)  # Load ReactomePA

# Load your data (make sure the path is correct)
deg_data <- read.csv("C:/Users/Sheryar Malik/sccdta.csv")

# Convert gene symbols to Entrez IDs
gene_ids <- bitr(deg_data$Gene_Name, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# Create a named vector of LogFC values
logfc_vector <- deg_data$LogFC
names(logfc_vector) <- gene_ids$ENTREZID

# Sort the gene list in decreasing order
logfc_vector <- sort(logfc_vector, decreasing = TRUE)

# Perform GSEA using KEGG pathways
gsea_KEGG <- gseKEGG(geneList = logfc_vector, organism = "hsa", pvalueCutoff = 0.05)

# Perform GSEA using Reactome pathways
gsea_Reactome <- gsePathway(geneList = logfc_vector, pvalueCutoff = 0.05)

# Perform GSEA using GO pathways
gsea_GO <- gseGO(geneList = logfc_vector, OrgDb = org.Hs.eg.db, keyType = "ENTREZID", pvalueCutoff = 0.05)

# Add a column to identify the source of each result
gsea_KEGG_df <- as.data.frame(gsea_KEGG)
gsea_Reactome_df <- as.data.frame(gsea_Reactome)
gsea_GO_df <- as.data.frame(gsea_GO)

gsea_KEGG_df$Source <- "KEGG"
gsea_Reactome_df$Source <- "Reactome"
gsea_GO_df$Source <- "GO"

# Merge all GSEA results into one data frame
combined_results <- rbind(gsea_KEGG_df, gsea_Reactome_df, gsea_GO_df)

# Save the combined results to a CSV file
write.csv(combined_results, "C:/Users/Sheryar Malik/GSEA_Combined_Results.csv", row.names = FALSE)

# View the combined results
head(combined_results)
