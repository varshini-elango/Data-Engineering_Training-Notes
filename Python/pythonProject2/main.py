import mymodule

print(mymodule.greet("Varshini"))

import math_operation
result = math_operation.add(5,3)
print(result)

result = math_operation.subtract(10,6)
print(result)

import string_utils
print(string_utils.capitalize("I am from karpagam college"))

reversed_sentence = string_utils.reverse("Hello world")
print(f"Reversed: {reversed_sentence}")

vowel_count = string_utils.count_vowels("Hii ,hoe are you?")
print(f"Vowel Count: {vowel_count}")

is_palindrome = string_utils.is_palindrome("Madam")
print(f"Is Palindrome: {is_palindrome}")

print(mymodule.greet("World"))

# Importing the arithmetic module from my_package
#from mypackage import arithmatic

#Importing the geometry module from my_package
#from mypackage import geometry

from mypackage import *

# Using functions from arithmetic module
print("Addition:", arithmatic.add(10,5))
print("Division:", arithmatic.divide(10,2))

#Using functions from geometry module
print("Area of Circle:", geometry.area_of_circle(5))
print("Perimeter of Rectangle:", geometry.perimeter_of_rectangle(10,5))

def describe_pet(pet_name, animal_type="dog"):
    print(f"I have a {animal_type} named {pet_name}.")

#using keyword arguments
describe_pet(animal_type="cat", pet_name="whiskers")
describe_pet(pet_name="Rover")

def make_pizza(size , *toppings):
    print(f"Making a {size}-inch pizza with following toppings:")
    for topping in toppings:
        print(f"- {topping}")

make_pizza(12, "pepperoni","mushrooms","green peppers")

def build_profile(first, last ,**user_info):
    return {"first_name": first, "last_name" : last,**user_info}

#calling with arbitrary keyword arguments
user_profile= build_profile("John", "Deo", location ="New York",field =" Engineering")
print(user_profile)