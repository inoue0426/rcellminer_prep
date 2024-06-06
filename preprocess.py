import os

import numpy as np
import pandas as pd

# Load a dictionary from a CSV to map simplified names
names = dict(pd.read_csv("data/simplified_names.csv").values)

# Function to convert log2 values to FPKM
def convert_log2_to_fpkm(log2_values):
    return np.power(2, log2_values) - 1

# Convert log2 gene expression data to FPKM and save it as a CSV
convert_log2_to_fpkm(pd.read_csv("data/log2_gene_expression.csv", index_col=0)).to_csv(
    "data/gene_expression.csv"
)

# Function to replace column names using the loaded 'names' dictionary
def change_names(data_path):
    data = pd.read_csv(data_path, index_col=0)
    data.columns = [names[i] for i in data.columns]
    data = data.sort_index()
    data.to_csv(data_path)
    return data

# List all files in 'data' directory that do not start with 'simp' and do not start with 'drug_annotation'
dlist = [f for f in os.listdir("data") if not f.startswith("simp") and not f.startswith("drug_annotation")]
for i in dlist:
    change_names(f"data/{i}")
