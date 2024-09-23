import pandas as pd
import numpy as np

#load the csv file
df = pd.read_csv('sample_data.csv')

print("Before Transaction")
print(df)

#Ensure there are no leading/trailing spaces in column names
df.columns= df.columns.str.strip()
#Strip spaces from the 'City' column and replace empty strings with Nan
df['City'] = df['City'].str.strip().replace('', np.nan)
# Fill missing values in the 'City' column with 'Unknown'
df ['City'] = df ['City'].fillna('Unknown')
#Fill missing values in the 'Age' column with the median age
df ['Age'] = pd.to_numeric(df['Age'].str.strip(), errors='coerce')
df ['Age'] = df ['Age'].fillna (df['Age'].median())
#Fill missing values in the 'Salary' column with the median salary
df ['Salary'] = df['Salary'].fillna (df['Salary'].median())
#Display the dataframe after filling missing values
print("After filling missing values:")
print(df)

df1=pd.DataFrame({
    'employee_id':[1,2,3,4,],
    'employee_name': ['John Doe','Jane Smith','Sam Brown','Emily Davis']
})

df2 = pd.DataFrame({
    'employee_id':[3,4,5,6],
    'department':['Finance','HR','IT','Marketing']
})

#merge the DataFrame on 'employee_id'
merged_df =pd.merge(df1,df2,on='employee_id',how='inner')
print("Merged Data:")
print(merged_df)

df= pd.DataFrame({
    'employee_id':[1,2,2,3,3,3],
    'department':['HR','IT','IT','Finance','Finance','Finance',],
    'Salary':[500000,600000,620000,550000,58000,60000]
})

grouped_df = df.groupby('department')['Salary'].mean().reset_index()
print("Grouped Data:")
print(grouped_df)
