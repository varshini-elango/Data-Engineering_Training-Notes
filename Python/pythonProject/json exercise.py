
### JSON Exercises

#### Exercise 1: Reading a JSON File
#1. Create a JSON file named `data.json` with the following content:
#   ```json
#   {
#       "name": "John Doe",
#       "age": 30,
#       "city": "New York",
#       "skills": ["Python", "Machine Learning", "Data Analysis"]
#   }
#   ```
#2. Write a Python script to read and print the contents of the JSON file.
import json
#Writing data to a JSON file
data = {"name": "John Doe", "age": 30, "city": "New York","skills": ["Python", "Machine Learning", "Data Analysis"]}
with open("D:/varshini/Hexaware/training/Training 4/Python/data2.json", "w") as file:
    json.dump(data, file)
#Reading data from a JSON file
with open("D:/varshini/Hexaware/training/Training 4/Python/data2.json", "r") as file:
    Loaded_data = json.load(file)
    print(Loaded_data)

#### Exercise 2: Writing to a JSON File
#1. Create a Python dictionary representing a person's profile:
 #  ```python
#  profile = {
#       "name": "Jane Smith",
#       "age": 28,
#       "city": "Los Angeles",
#       "hobbies": ["Photography", "Traveling", "Reading"]
#   }
#   ```
#2. Write a Python script to save this data to a JSON file named `profile.json`.
import json
profile = {
    "name": "Jane Smith",
    "age": 28,
    "city": "Los Angeles",
    "hobbies": ["Photography", "Traveling", "Reading"]
}
with open("D:/varshini/Hexaware/training/Training 4/Python/profile.json", "w") as file:
    json.dump(data, file)

print("Data written to profile.json")

#### Exercise 3: Converting CSV to JSON
#1. Using the `students.csv` file from the CSV exercises, write a Python script to read the file and convert the data to a list of dictionaries.
#2. Save the list of dictionaries to a JSON file called `students.json`.
import csv
import json
data=[["Name", "Age","grade"],["Alice",14,9],["Bob", 15,10],["chitra",13,8],["david",14,9],["eve",15,10]]
with open("D:/varshini/Hexaware/training/Training 4/Python/students.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerows(data)

print("created")
students_list = []
with open('D:/varshini/Hexaware/training/Training 4/Python/students.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        students_list.append(row)

with open('D:/varshini/Hexaware/training/Training 4/Python/students.json', 'w') as jsonfile:
    json.dump(students_list, jsonfile, indent=4)

print("CSV data converted to students.json")

#### Exercise 4: Converting JSON to CSV
#1. Using the `data.json` file from Exercise 1, write a Python script to read the JSON data.
#2. Convert the JSON data to a CSV format and write it to a file named `data.csv`.
import json
import csv
data = {"name": "Alice", "age": 38, "city": "New York"}
with open("D:/varshini/Hexaware/training/Training 4/Python/data.json", "w") as file:
    json.dump(data, file)
with open("D:/varshini/Hexaware/training/Training 4/Python/data.json", "r") as file:
    Loaded_data = json.load(file)
    print(Loaded_data)

csv_data = {
    "name": data["name"],
    "age": data["age"],
    "city": data["city"],
}
with open('D:/varshini/Hexaware/training/Training 4/Python/data.csv', 'w', newline='') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=csv_data.keys())
    writer.writeheader()
    writer.writerow(csv_data)

print ("Json is converted to csv")


#### Exercise 5: Nested JSON Parsing
#1. Create a JSON file named `books.json` with the following content:
#   ```json
#   {
#       "books": [
#           {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925},
#           {"title": "War and Peace", "author": "Leo Tolstoy", "year": 1869},
#           {"title": "The Catcher in the Rye", "author": "J.D. Salinger", "year": 1951}
#       ]
#   }
#   ```
#2. Write a Python script to read the JSON file and print the title of each book.
import json
data = {
    "books": [
        {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925},
        {"title": "War and Peace", "author": "Leo Tolstoy", "year": 1869},
        {"title": "The Catcher in the Rye", "author": "J.D. Salinger", "year": 1951}
    ]
}
with open("D:/varshini/Hexaware/training/Training 4/Python/books.json", "w") as file:
    json.dump(data, file)
with open("D:/varshini/Hexaware/training/Training 4/Python/books.json", "r") as file:
    Loaded_data = json.load(file)
    print(Loaded_data)

for book in data['books']:
    print("Title:", book['title'])