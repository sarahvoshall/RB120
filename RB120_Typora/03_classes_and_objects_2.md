**Classes and Objects: Part 2** 

Up until now, all methods we've created are instance methods. **Class methods** are called directly on the class without instantiating objects. Class methods are prepended by `self.` When calling the class method, use the class name followed by the class method name without having instantiated objects. **Class methods are containers for functionality that pertains to the class and not to individual objects.** Objects deal with state and if a methods does not deal with a state of an object, a class method can be used. 

Instance variables capture information related to specific instances of classes (objects). **Class variables** contain information pertaining to the entire class. Class variables are prepended by `@@`. *Class variables can be accessed from within instance methods.* We use class variables and class methods to keep track of class level detail that pertains only to the class and not to individual objects. 

**Constants** are defined by capitalizing a variable. (Most use all uppercase.) 

**`to_s`** 

- Calling `puts` automatically calls `to_s` on its argument. The `to_s` method returns the name of the object's class and an encoding of its object id. 

*Note: `puts` calls `to_s` on any argument except arrays. For arrays, it prints the result on separate lines of calling `to_s` on each element of the array.* 

- The `p` method works similarly except the method it calls by default is `inspect`. 
- The `to_s` method is also called automatically in string interpolation. 

**`self`**

- `self` is used when calling setter methods from within the class  (`self` is used whenever an instance method is called from within the class)
- `self` is used for class method definitions 

From within a class, `self` in an instance method refers to the object that called the method. Outside an instance method, `self` references the class itself. `Self` is a way of being explicit about what the program is referencing. `Self` changes depending on its scope so be careful about whether it's used in an instance method or not. 