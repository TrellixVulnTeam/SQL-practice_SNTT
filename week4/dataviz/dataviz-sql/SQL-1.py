# %%
import sqlite3
import pandas as pd
# %%
con = sqlite3.connect('sakila.db')

# %%
def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df
# %%
query = '''
    SELECT *
    FROM sqlite_master
    WHERE type = 'table';
'''

tables = sql_to_df(query)
tables
# %%
query = '''
    SELECT first_name, last_name
    FROM customer
'''

customer_names = sql_to_df(query)
customer_names
# %%
