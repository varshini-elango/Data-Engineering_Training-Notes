import requests

response = requests.get("https://dummyjson.com/products/1")
print(response.json()) #print the HTTP status code

import pandas as pd

#creating a dataframe from a dictionary with indian names
data ={
    "Name": ["Amit","Priya","Vikram","Neha","Ravi"],
    "Age": [25,30,35,40,45],
    "City": ["Mumbai","Delhi","Bangalore","Chennai","Pune"]
}

df = pd.DataFrame(data)
print(df)

#accesing single column
print(df["Name"])

#accessing multiple columns
print(df[["Name","Age"]])

#accessing rows using index
print(df.iloc[0]) #first row
print(df.iloc[0:3]) #multiple rows

#filter rows where age is grater than 30
filtered_df=df[df["Age"]>30]
print(filtered_df)

#adding a new column 'salary'
df["salary"]=[50000,60000,70000,80000,90000]
print(df)

#sorting by age
sorted_df=df.sort_values(by="Age",ascending=False)
print(sorted_df)

#rename the 'name' column to 'full name' and 'Age' to 'years'
df_renamed = df.rename(columns={"Name" : "Full Name","Age":"Years"})
print(df_renamed)

#drop the column 'city'
df_dropped= df.drop(columns=["City"])
print(df_dropped)

#drop the row at index 2(vikram)
df_dropped_row = df.drop(index=2)
print(df_dropped_row)

#create a new column 'Seniority' based on the Age
df['Seniority'] = df["Age"].apply(lambda x: 'Senior' if x>= 35 else 'Junior')
print(df)

#adding a new column 'salary'
df["salary"]=[50000,60000,70000,80000,90000]

#group by 'city' and calculate the average salary in each city
df_grouped =  df.groupby("City")["salary"].mean()
print(df_grouped)

#apply a custom function to the 'salary' column to add 10% bonus
def add_bonus(salary):
    return salary * 1.10

df['salary_with_bonus'] = df['salary'].apply(add_bonus)
print(df)

#create another Dataframe
df_new = pd.DataFrame({
    "Name":["Amit" , "Priya", "Ravi"],
    "Bonus":[5000,6000,7000]
})

#Merge based on the 'Name' column
df_merged = pd.merge(df, df_new, on="Name", how="left")
print(df_merged)

#create another dataframe to concatenate
df_new = pd.DataFrame({
    "Name" : ["Sonia" ," Rahul"],
    "Age" : [29,31],
    "City" : ["Kolkata","Hyderabad"],
    "salary" :[58000,63000]
})

#concatenate the two dataframes
df_concat=pd.concat([df, df_new], ignore_index=True)
print(df_concat)

#find with more than 50000 salary and name start with 'A'
df_find= df[(df['salary']>50000) & (df['Name'].str.startswith('N'))]
print(df_find)





