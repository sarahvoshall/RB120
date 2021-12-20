**Inheritance and Variable Scope** 

How inheritance affects variables: 

**Instance Variables**: Instance variables can be inherited *as long as they are initiated before they are accessed*. 

- Instance variables don't exhibit any surprising behavior. They behave similarly to how instance methods do, with the exception that we have to first call the method that initializes the instance variable. After that, the instance can access that instance variable. **This suggest that instance variables and their values are not inherited like instance methods are.** 

**Class Variables**: Class variables can be affected by subclasses. For this reason, avoid using class variables when working with inheritance. (Use *class instance variables* instead...)

**Constants**

- In unconnected classes: Constants are confined to instances of their class unless the namespace resolution operator is used `::`. 
- In inheritance: a constant initialized in a superclass is inherited by its subclasses and can be accessed by both class and instance methods. 
- With modules: constants are not evaluated at runtime, so lexical scope (where they are used in code) matters (when accessing constants through modules, use the `::` namespace resolution operator)