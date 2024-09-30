# GSEA-Analysis
# GSEA Analysis for Squamous Cell Carcinoma

This repository contains R code for performing Gene Set Enrichment Analysis (GSEA) using the `GSE135304` dataset of squamous cell carcinoma (SCC) obtained from microarray data. 

## Installation Instructions

1. **Install R**: Ensure you have R installed on your system. You can download it from [CRAN](https://cran.r-project.org/).

2. **Install RStudio** (optional): For a better user experience, install RStudio from [RStudio](https://www.rstudio.com/products/rstudio/download/).

3. **Clone this repository** or download the files directly.

4. **Run the R script**:
   - Open R or RStudio.
   - Set your working directory to where you downloaded the files.
   - Run the `gsea_analysis.R` script.

## Required Packages

The following R packages are required to run the analysis:

- `BiocManager`
- `clusterProfiler`
- `org.Hs.eg.db`
- `ReactomePA`

These packages can be installed using the provided code in the `gsea_analysis.R` script.

## Dataset Information

- **Dataset**: GSE135304
- **Type**: Microarray data for squamous cell carcinoma.

## Output

The combined GSEA results will be saved as a CSV file named `GSEA_Combined_Results.csv` in your working directory.

## License

This project is licensed under the MIT License.
