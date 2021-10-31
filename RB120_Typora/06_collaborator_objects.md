**Collaborator Objects**

Classes group common behaviors and objects encapsulate state. An object's state is saved in an object's instance variable. Instance methods can operate on instance variables. Usually the state is a string or number. 

Objects that are stored as state (assigned to an instance variable) within another object are called **collaborator objects**. Collaborator objects are usually custom objects, i.e., defined by the programmer and not inherited from the Ruby core library. However, collaborator objects are not strictly custom objects, *even a string object stored within an instance variable is technically a collaborator object.* 

**?** Collaborator objects also represent the connections between various actors in your program. **?**

Wendy Kuhn's article: 

- Collaboration is a 'has-a' relationship. (Ability not identity.)
- A collaborator object is part of another object's state. By assigning a collaborator object to an instance variable in another class's constructor method definition, you are associating the two objects with one another. *You can spot them when an object is assigned to an instance variable of another object inside a class definition.*
- Collaboration doesn't always happen immediately upon instantiating your primary object. *However, the collaborative relationship must exist within the definition of the primary class.* That is, collaboration doesn't just occur when code is executed and objects are instantiated: it exists from the design phase of the program. 
- Collaboration occurs when one object is added to the state of another object, i.e., when a method is invoked. The collaborative relationship exists in the design or intention of the code. 

