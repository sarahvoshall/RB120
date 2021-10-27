**Classes and Objects: Part 1**

We use classes to create objects. In defining a class, we focus on states and behaviors. 

- **States** (variables) track attributes for individual objects. *Every object's state is unique.*
- **Behaviors** (methods) are what objects are capable of doing.  

*Instance variables keep track of a state and instance methods expose behavior for objects.* States (instance variables) allows objects of the same class to have unique attributes while sharing common behaviors (instance methods). 

- A **constructor** is a method that gets triggered whenever a new object is created. (Whenever the `new` method is called upon the class.) 
  - `initialize`: Calling `new` also calls `initialize`. You can pass arguments to `initialize` through `new`. Is `initialize` the only constructor in Ruby? 
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

When calling the setter method within a method definition, prepend `self` to the method name in order for the program to know that it should call a method and not initializing a new local variable. (This syntax could also be used when calling the getter methods for sake of consistency, but it is not required.)

```ruby
def change_info(name, height) # use self to clarify method call
  self.name = name
  self.height = height
end 

def display_info(name, height) 
  "#{self.name} is #{self.height} tall."
end
```

