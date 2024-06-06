# Execute this script using Rscript data_curation.r to extract drug response, mutation, log2 gene expression, and copy data, and then run preprocess.py.
# To run this script, open the terminal and type "Rscript data_curation.r".

library(rcellminer) # Load the rcellminer library
library(rcellminerData) # Load the rcellminerData library

drugAnnot <- getFeatureAnnot(rcellminerData::drugData)[["drug"]] # Retrieve drug annotations from drug data
tmp = colnames(drugAnnot) # Get column names
tmp = head(tmp, n=6) # Select the first 6 columns
write.csv(drugAnnot[tmp], 'data/drug_annotation.csv') # Save as a CSV file

drugAct <- exprs(getAct(rcellminerData::drugData)) # Get drug activity data
write.csv(drugAct, 'data/drug_response.csv') # Save as a CSV file

mutation <- getAllFeatureData(rcellminerData::molData)[["mut"]] # Retrieve mutation data
write.csv(mutation, 'data/mutation.csv') # Save as a CSV file

expression <- getAllFeatureData(rcellminerData::molData)[["xsq"]] # Retrieve log2 gene expression data
write.csv(expression, 'data/log2_gene_expression.csv') # Save as a CSV file

copy <- getAllFeatureData(rcellminerData::molData)[["cop"]] # Retrieve copy number data
write.csv(copy, 'data/copy.csv') # Save as a CSV file

met <- getAllFeatureData(rcellminerData::molData)[["met"]] # Retrieve methylation data
write.csv(met, 'data/methylation.csv') # Save methylation data as a CSV file

system("python preprocess.py") # Execute the preprocess.py script

