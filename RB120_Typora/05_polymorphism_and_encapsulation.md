**Polymorphism and Encapsulation** 

Polymorphism is the ability of objects with different types to respond in different ways to the same message (or method invocation.) That is, data of different types can respond to a common interface. 

Polymorphism usually involves inheritance from a common superclass. 

**Two main ways to implement polymorphism:**

1. Polymorphism through inheritance: two different object types can respond to the same method call by simply overriding an inherited method. (Overriding is usually treated as an aspect of inheritance so this is polymorphism through inheritance.) 
2. Polymorphism through **duck typing**: when objects of different unrelated (no inheritance) types respond to the same method name. With duck typing, we aren't concerned with the class or type of the object, only if the object has a particular behavior. *As long as the object involved uses the same method name and takes the same amount of arguments, we can treat the object as belonging to a specific category of objects.* Duck typing is a more flexible way to classify or typify objects, while classes provide a formal way to do so. 

**Encapsulation** lets us hide the internal representation of an object from the outside and expose only the methods and properties that the users of an object need. We use method access control to expose these properties and methods throug the public or external interface of a class: its public methods. 

Note: use `self` when calling private setter methods. (As of 2.7, `self` can be called with any private method... But private methods cannot be called upon other objects: only with the current object.)

A class should have as few public methods as possible. This allows for simplification and data protection. 

