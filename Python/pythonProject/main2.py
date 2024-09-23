#creting dictonaries
empty_dict ={}
person ={
    "name":"Mark",
    "age":30,
    "email":"mark@gmail.com"
}

print(empty_dict)
print(person)

#Accessing values
name = person["name"]
age = person["age"]

print("Name:",name)
print("Age:",age)

#modify values
person["age"]=31
person["email"]="mark_new@gmail.com"

print(person)

#adding a new key-value pair
person["address"]="123 Main st"

#removing key-value pair
del person["email"]

print (person)

keys=person.keys()
values=person.values()
items=person.items()

print("Keys:",keys)
print("Values:",values)
print("Items:",items)

#iterating over keys
for key in person:
    print(key)

#Iterating over values
for value in person.values():
    print(value)

#Iterationg over key-value pairs
for key, value in person.items():
    print(key, ":", value)

#creating a tuple of colors
colors=("red","green","blue")

#accessing elements of the tuple
print("first color:",colors[0])
print("last color:",colors[-1])

#length of the tuple
tuple_length=len(colors)
print("length:",tuple_length)

#looping through the tuple
print("tuple elements:")
for color in colors:
    print(color)

#creating a set
fruits={'apple','banana','orange'}
#adding an element
fruits.add("grape")
#removing a element
fruits.remove("banana")
#checking if an element is in set
print("Is 'apple' in th set?", "apple" in fruits)
print("Is 'banana' in th set?", "banana" in fruits)
#length of the set
set_len=len(fruits)
print("Number of elements in the set:", set_len)
#looping through the set
print("set elements:")
for fruit in fruits:
    print(fruit)

#list of dictionaries representing students' information
students = [
    {"name": "Alice", "age": 20, "grade": "A"},
    {"name": "Bob", "age": 22, "grade": "B"},
    {"name": "Charlie", "age": 21, "grade": "C"},
    {"name": "David", "age": 23, "grade": "B"},]
#Accessing and manipulating individual records
print(students[0]["name"])  # Accessing the name of the first student
students [1] ["age"] = 24 # Modifying the age of the second student
#Adding a new student record to the list
new_student = {"name": "Eva", "age": 19, "grade": "A"}
students.append(new_student)
# Iterating through the list of students
for student in students:
    print(f"Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")



