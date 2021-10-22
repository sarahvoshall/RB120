**Classes and Objects: Part 1**

We use classes to create objects. In defining a class, we focus on states and behaviors. 

- **States** (variables) track attributes for individual objects. 
- **Behaviors** (methods) are what objects are capable of doing.  

*Instance variables keep track of a state and instance methods expose behavior for objects.*

- A **constructor** is a method that gets triggered by creating a new object. (Whenever the `new` method is called upon the class.)
- An **instance variable** is prepended by the `@` symbol, e.g., `@name`. It exists as long as the object instance exists. 

**Accessor** methods are shorthand for getter and setter methods. Use the `attr_accessor` to create getter and setter methods. 

```ruby
	def name # getter method
		@name 
	end

	def name=(n) # setter method 
		@name = n 
	end 
```

```ruby 
attr_accessor :name
```

Both of the above example do the same thing. The `attr_accessor` method takes a symbol as an argument which it uses to create the method name for the getter and setter methods. If you only want the getter, use `attr_reader` and if you only want the setter, use `attr_writer`. All `attr_*` methods take a symbol parameter. Multiple symbols can be provided to track more states. 

Accessor methods (getter and setter methods) give us a way to expose and change an object's state. *It's better to call accessor methods than to reference instance variables.* 

**!** Access instance variables inside the class without the `@` if the getter method is available. *Unless you're reassigning the instance variable, then the `@` needs to be used.* 

