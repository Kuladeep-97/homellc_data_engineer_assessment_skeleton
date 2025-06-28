import pandas as pd

def load_clean_csv(path):
  df=pd.read_csv(path)
  df['Age']=2025-df['Year_Built']
  for col_name in df.columns:
    if df[col_name].dtype=='object':
     df[col_name]=df[col_name].replace('','NA').fillna('NA')
  return df



