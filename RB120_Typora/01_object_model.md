**The Object Model: "Everything is an object in Ruby."**

There's three types of programming languages: procedural, functional, and object-oriented. Ruby is an object-oriented language with some procedural and functional features. Created so that larger programs could be written and modified without affecting the entire program: a way to section off code so that the program can be an interaction of many small parts and not 'one massive blob of dependency.'

- Abstraction is simplifying complex reality by modeling classes appropriate to the problem
- Polymorphism is the process of using an operator or function in different ways for different data input
- Encapsulation hides the implementation details of a class from other objects 
- Inheritance is a way to form new classes using classes that have already been defined 

**Encapsulation:** A form of data protection that only allows data to be manipulated with obvious intention. It involves hiding pieces of functionality and making those unavailable to the rest of the code base. It defines boundaries in an application and allows code to achieve higher complexity. Ruby accomplishes this task by creating objects and exposing interfaces (methods) to interact with those objects. 

Creating objects allows the programmer to think on a new level of abstraction. Objects represent real world nouns and can be given methods (verbs) to that describe the behavior the programmer is trying to represent.

**Polymorphism:** Allows different types of data to respond to a common interface. Objects of different types may respond to the same method invocation. *Ideally, we shoudl be able to use pre-written code for new purposes.* 

- Inheritance: a class inherits the behaviors of another class
- Superclass: the class from which another class's behaviors are inherited 
- Subclass: the class which inherits its behaviors from its superclass 
- Mixin: modules are similar to classes in that they contain shared behavior, however objects cannot be created within modules. Modules are mixed in with classes using the `include` method invocation. After mixing in a module, the behaviors declared in that module are available to the class and its objects. *Modules allow for additional behavior,  (methods) but do not allow instantiation of new identities or values (objects).* 

*Note: We have learned that everything in Ruby is an object. But that's not strictly true. However, everything that has value is an object. A few things which are not objects are methods, blocks, and variables.*

**Instantiation:** the workflow of creating a new object or instance from a class 

Objects are created from classes. Ruby defines the attributes and behaviors of its objects in classes. Classes are like basic outlines of waht an object should be made of and what it should be able to do.

A new object is instantiated by calling the class method `new`. 