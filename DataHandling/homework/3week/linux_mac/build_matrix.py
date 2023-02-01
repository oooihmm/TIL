import numpy as np
import pandas as pd
from pandas import Series, DataFrame


def get_rating_matrix(filename, dtype=np.float32):
    df = pd.read_csv(filename)

    result = df.pivot_table(["rating"],
    index = df.source,
    columns = df.target, fill_value = 0).values

    return result


def get_frequent_matrix(filename, dtype=np.float32):
    df = pd.read_csv(filename)
    
    result = df.groupby(["source", "target"])["target"].count().unstack().values

    return result

get_rating_matrix("../movie_rating.csv")
get_frequent_matrix("../1000i.csv")