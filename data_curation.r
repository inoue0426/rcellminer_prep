# Execute this script using Rscript data_curation.r to extract drug response, mutation, log2 gene expression, and copy data, and then run preprocess.py.
# To run this script, open the terminal and type "Rscript data_curation.r".

library(rcellminer)
library(rcellminerData)

drugAct <- exprs(getAct(rcellminerData::drugData))
write.csv(drugAct, 'data/drug_response.csv')

mutation <- getAllFeatureData(rcellminerData::molData)[["mut"]]
write.csv(mutation, 'data/mutation.csv')

expression <- getAllFeatureData(rcellminerData::molData)[["xsq"]]
write.csv(expression, 'data/log2_gene_expression.csv')

copy <- getAllFeatureData(rcellminerData::molData)[["cop"]]
write.csv(copy, 'data/copy.csv')

system("python preprocess.py")

