#specify file path and name

file_path = "D:/varshini/Hexaware/training/Training 4/Python/example.txt"

#open the file in write mode and write content
with open(file_path, "w") as file:
    file.write("Hello, this is content written to a file in your laptop!")

    print("file created and content created successfully.")

#open a file in read mode and print each line
with open("D:/varshini/Hexaware/training/Training 4/Python/example.txt", "r") as file:
    for line in file:
        print(line.strip()) #remove new line character /n

#open a file in append mode and add new content
with open("D:/varshini/Hexaware/training/Training 4/Python/example.txt", "a") as file:
    file.write("\nThis is additional content appended to the file.")

#read the entire file as a string and print it
with open("D:/varshini/Hexaware/training/Training 4/Python/example.txt", "r") as file:
    content =file.read()
    print(content)

#writing data to a csv file

import csv
data=[["Name", "Age"],["Alice",25],["Bob", 30]]
with open("D:/varshini/Hexaware/training/Training 4/Python/data.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerows(data)

## Reading data from a CSV file
with open("D:/varshini/Hexaware/training/Training 4/Python/data.csv", "r") as file:
    reader = csv.reader(file)
    for row in reader:
        print(row)

import json
#Writing data to a JSON file
data = {"name": "Alice", "age": 38, "city": "New York"}
with open("D:/varshini/Hexaware/training/Training 4/Python/data.json", "w") as file:
    json.dump(data, file)

#Reading data from a JSON file
with open("D:/varshini/Hexaware/training/Training 4/Python/data.json", "r") as file:
    Loaded_data = json.load(file)
    print(Loaded_data)




