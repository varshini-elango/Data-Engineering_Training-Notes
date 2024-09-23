import pandas as pd

#load the csv file into a dataframe
df = pd.read_csv('employee.csv')

#print the data frame
print(df)

#display the first three rows
print(df.head(3))

#show summary information about the data frame
print(df.info())

#diplay summary statistics of numeric columns
print(df.describe())

#filter rows where salary is greater than 80000
high_salary_df = df[df['Salary'] > 80000]
print(high_salary_df)

#sort by age in desc
sorted_df = df.sort_values(by='Age',ascending = False)
print(sorted_df)

