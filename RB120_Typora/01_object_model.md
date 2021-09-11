**The Object Model: "Everything is an object in Ruby."**

Created so that larger programs could be written and modified without affecting the entire program: a way to section off code so that the program can be an interaction of many small parts and not 'one massive blob of dependency.'

**Encapsulation:** A form of data protection that only allows data to be manipulated with obvious intention. 

**Polymorphism:** Allows different types of data to respond to a common interface. 

- Inheritance: a class inherits the behaviors of another class
- Superclass: the class from which another class's behaviors are inherited 
- Subclass: the class which inherits its behaviors from its superclass 
- Mixin: modules are similar to classes in that they contain shared behavior, however objects cannot be created within modules. Modules are mixed in with classes using the `include` method invocation. After mixing in a module, the behaviors declared in that module are available to the class and its objects. 

*Note: We have learned that everything in Ruby is an object. But that's not strictly true. However, everything that has value is an object. A few things which are not objects are methods, blocks, and variables.*

**Instantiation:** the workflow of creating a new object or instance from a class 