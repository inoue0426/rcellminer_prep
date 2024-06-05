import os

import numpy as np
import pandas as pd

names = dict(pd.read_csv("data/simplified_names.csv").values)


def convert_log2_to_fpkm(log2_values):
    return np.power(2, log2_values) - 1


convert_log2_to_fpkm(pd.read_csv("data/log2_gene_expression.csv", index_col=0)).to_csv(
    "data/gene_expression.csv"
)


def change_names(data_path):
    data = pd.read_csv(data_path, index_col=0)
    data.columns = [names[i] for i in data.columns]
    data = data.sort_index()
    data.to_csv(data_path)
    return data


dlist = [f for f in os.listdir("data") if not f.startswith("simp")]
for i in dlist:
    change_names(f"data/{i}")
