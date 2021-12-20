**Classes and Objects: Part 1**

We use classes to create objects. In defining a class, we focus on states and behaviors. A class is a template for an object. It is a blueprint that describes the state and behavior that the objects of the class all share. Objects created at runtime are called instances of the particular class. 

- **States** (variables) track attributes for individual objects. *Every object's state is unique.*
  - An object's attributes are the data items bundled inside that object. These items are also called instance variables. An instance variable is a variable defined in the class for which each object in the class has a separate copy. 
- **Behaviors** (methods) are what objects are capable of doing. *Every instance of a class is similar in its shared behaviors.*

*Instance variables keep track of a state and instance methods expose behavior for objects.* States (instance variables) allows objects of the same class to have unique attributes while sharing common behaviors (instance methods). 

- A **constructor** is a method that gets triggered whenever an object is instantiated. (Whenever the `new` method is called upon the class.) 
  - `initialize`: Calling `new` also calls `initialize`. You can pass arguments to `initialize` through `new`. 
  - The constructor method in Ruby is `initialize` 
  - The purpose of a constructor is to initiate the state of an object. Constructors do not return any values. 
- An **instance variable** is prepended by the `@` symbol, e.g., `@name`. It exists as long as the object instance exists. Instance variables are one of the ways that we tie data to objects. 

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

Accessor methods (getter and setter methods) give us a way to expose and change an object's state. *It's better to call accessor methods than to reference instance variables directly.* 

When calling the setter method within a method definition, prepend `self` to the method name in order for the program to know that it should call a method and not initialize a local variable. (This syntax could also be used when calling the getter methods for sake of consistency, but it is not required.)

```ruby
def change_info(name, height) # use self to clarify method call
  self.name = name
  self.height = height
end 

def display_info(name, height) 
  "#{self.name} is #{self.height} tall."
end
```

