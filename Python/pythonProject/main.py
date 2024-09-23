from operator import truediv

print("Hello World!!")

single_quote_str = 'This is Single Quote String- "Hey"'

double_quote_str = "This is Double Quote String"

print(single_quote_str)
print(double_quote_str)

next_String = '''This is a
Multiple Line String'''

print(next_String)

#append string
greeting="Hello"
name ="Alice"
full_greeting = greeting +"," + name +"!"

print(full_greeting)

#format
greeting="Hello"
name ="Alice"
formatted_greeting ="{}, {}!".format(greeting, name)

#using f-string(python 3.6+)
formatted_greeting_f = f"{greeting}, {name}!"

print(formatted_greeting)
print(formatted_greeting_f)

#python string operations
#trim
text = " Python programming "

stripped_text = text.strip()
print(stripped_text)

uppercase_text = text.upper()
print(uppercase_text)

starts_with_python = text.startswith("Python")
print(starts_with_python)

replaced_text = text.replace("Programming", "Coding")
print(replaced_text)

#Integers
positive_int = 42
negative_int = -42
zero = 0

print(positive_int)
print(negative_int)
print(zero)

a=10
b=3

#Addition
addition = a + b

#subtraction
subtraction = a-b

#multiplication
multiplication =a*b

#division
division=a/b # this returns a float

#floor division
floor_division=a//b #this returns an integer

#modulus
modulus=a%b

#exponentiation
exponentiation=a**b

print("Addition:", addition)
print("Subtraction:", subtraction)
print("Multiplication:", multiplication)
print("Division:", division)
print("Floor Division:", floor_division)
print("Modulus:", modulus)
print("Exponentiation:", exponentiation)

#convert string to integer
num_str = "100"
num_int=(num_str)

#convert float into integer
num_float=12.34
num_int_from_float=int(num_float)

print("string to integer:", num_int)
print("float to integer:", num_int_from_float)

#comparision operator
x=10
y=5

is_greater = x > y  #true
is_equal = x ==y #false
print("x > y:", is_greater)
print("x ==y:", is_equal)

a= True
b= False

#logical AND
and_operation = a and b # a * b--true * false--1 * 0 -- 0 -false

#logical or
or_operation = a or b #true + false--true--1

#logical not
not_operation = not a #false

print("a and b:", and_operation)
print("a or b:", or_operation)
print("not a:",not_operation)

#convert integer to boolean
bool_from_int=bool(1) #true

#convert zero to boolean
bool_from_zero=bool(0) #false

#convert stringto boolean
bool_from_str= bool("Hello") #true

#convert empty string to boolean
bool_from_empty_str = bool("") #false

print("Boolean from integer 1:", bool_from_int)
print("Boolean from integer 0:", bool_from_zero)
print("Boolean from non-empty string:", bool_from_str)
print("Boolean from empty string:", bool_from_empty_str)

#list
#creating list
empty_list =[]
numbers =[1,2,3,4,5]
mixed_list=[1,'hello',3.14, True]

print(empty_list)
print(numbers)
print(mixed_list)

#Accessing elements from list
first_element=numbers[0]
third_element=numbers[2]
last_element=numbers[-1]

print("first",first_element)
print("third",third_element)
print("last",last_element)

#modifying elements
numbers[0]=10
numbers[2]=30

print(numbers)

#add items to list
number=[1,2,3,4,5]

number.append(6)

number.insert(2,2.5)

number.extend([7,8,9])

print (number)

#remove
number.remove(3) #by element

popped_element =number.pop(2) # by index

print(number)

number=[1,2,3,4,5]

#slicing a list
first_three = number[:3]
middle_two =number[1:3]
last_two=number[-2:]

print("first 3",first_three)
print("middle 2",middle_two)
print("last 2",last_two)

#Iterating over a list
for num in number:
    print(num)

#creating a list of squares using a list comprehension
squares=[x**2 for x in range(6)]

print(squares)




















