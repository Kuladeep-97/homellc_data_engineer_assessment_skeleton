import pandas as pd

def export_df_to_db(df,table,cursor):
   cols=','.join(df.columns)
   place_holders=','.join(['%s']*len(df.columns))
   query=f"INSERT INTO {table}({cols}) VALUES({place_holders})"
   for _,row in df.iterrows():
    cursor.execute(query,tuple(row))
    