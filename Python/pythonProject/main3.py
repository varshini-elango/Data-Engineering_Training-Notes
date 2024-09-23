#base class (parent class)
#object oriented

class Animal:
    def __init__(self, name):
        self.name = name

    #def speak(self):   #method
       # print("Animal Speaks")

#ani = Animal("bull") #creates an instance (object) of the Animal class
#ani.speak() #calling method, calls the speak method on the ani object


    def speak(self):
        pass

#derived class (child)inherited from animal
class Dog(Animal):
    def speak(self):
        return "Woof!"

class Cat(Animal):
    def speak(self):
        return "Meow!"

#creating instances of derived class
dog=Dog("Buddy")
cat = Cat("Whiskers")
#calling the speak method on instances
print(f"{dog.name} says: {dog.speak()}")
print(f"{cat.name} says: {cat.speak()}")







