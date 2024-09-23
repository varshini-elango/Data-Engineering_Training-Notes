import pandas as pd

#load the json file into a dataframe
df = pd.read_json('employees.json')

#print the data frame
print(df)

#filter rows where depart is 'IT'

#add a new column 'bonus' which is 10% of the salary
df['Bonus']= df['Salary'] * 1.10
print(df)

#save the updated data to new json file
df.to_json('employee_with_bonus.json',orient='records',lines=True)


