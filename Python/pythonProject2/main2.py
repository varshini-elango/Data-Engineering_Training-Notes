import pandas as pd
import numpy as np

#load the csv file
df = pd.read_csv('sample_data.csv')

#display the dataFrame
print(df)

#replace empty strings and strings with only spaces with Nan
df.replace(r'^\s*$' ,np.nan,regex=True, inplace=True)

#check for missing values in each column
print("missing values:")
print(df.isnull().sum())

#display rows with missing data
print("Row with missing data:")
print(df[df.isnull().any(axis=1)])

#drop rows with any missing values
df_cleaned =  df.dropna()

#display the cleaned dataframe
print("Cleaned data:")
print(df_cleaned)






