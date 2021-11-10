**Variable Scope: Instance, Class, Constants** 

We've only talked about local variables, and now it's time to discuss variable scoping rules for instance and class variables and constants, as well as the effect of inheritance upon these scoping rules. 

**Instance Variable Scope**: Instance variables start with `@` and are scoped at the object level. 

- They are used to track individual object state and do not cross over between objects. *Using instance variables separates the state of similar objects.* 
- Since instance variables are scoped at the object level, they are accessible in the object's instance methods, even if they're initialized outside of that instance method. 
- *Remember to initialize instance variables within instance methods.* 

**Class Variable Scope**: Class variables start with `@@` and are scoped at the class level. They have two main behaviors: 

- all objects share one copy of the class variable (which implies that objects can access class variables through instance methods)
- class methods can access class variables regardless of where they're initialized 

**Constant Variable Scope**: Constants are capitalized and have a lexical scope. 





