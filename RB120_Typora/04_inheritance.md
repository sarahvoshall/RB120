**Inheritance**

Inheritance is when a class inherits its behavior from another class. The class that inherits behavior is the subclass. The class from which behaviors are inherited is the superclass. 

Inheritance allows us to extract common behaviors from subclasses to a superclass in order to *keep the logic in one place.* Inheritance removes duplication from code. Any time you keep writing the same logic again and again there is a way to extract that logic to one place. 

Use the `<` symbol to signify inheritance. 

```ruby 
class SubClass < SuperClass
end 
```

This means that all methods of `SuperClass` are available to `SubClass`. 

Ruby checks the object's class for available methods before moving up to check the superclass for methods. 

**`super` **

Calling `super` within a method calls methods earlier in the method lookup path. The **method lookup path** is the order in which classes are inspected when you call a method. 

**Modules** 

Another way to DRY up code in Ruby is to implement modules. Modules allow for certain methods to be mixed in to other classes without the methods being available to every subclass of a superclass. 

- **class inheritance**: one type inherits the behaviors of another type. The result is a new type that specializes the type of the superclass. 
- **interface inheritance**: uses mixin modules. The class doesn't inherit from another type, but instead inherits the interface provided by the mixin module. The result type is not a specialized type of the module. 

**class inheritance vs. interface inheritance (mixin modules)**

- you can only subclass (class inherit) from one class, you can mix in as many modules (interface inherit) as you like 
- class inheritance is better for "is a" relationships and interface inheritance is better for "has a" relationships, e.g., a dog "is an" animal and it "has an" ability to swim 
  - class: identity 
  - interface: behavior / ability 
- modules can't be instantiated, i.e., objects cannot be created from modules. Modules are used only for namespacing and grouping common methods together. 
- methods in mixin modules should be defined without using `self`. 

**Method Lookup Path**: the order in which classes are inspected when you call a method. https://launchschool.com/books/oo_ruby/read/inheritance

**More Modules** 

- namespacing: organizing similar classes under a module 

  - call classes in a module by appending the class name to the module name with two colons 

  - ```ruby
    buddy = Mammal::Dog.new
    ```

- module methods: using modules as containers for methods. Useful for methods that seem out of place within your code 

**Method Access Control**

- access modifiers allow or restrict access to a particular thing. In Ruby, we are concerned with restricting access to certain methods defined within a class. 

Method access control is implemented in Ruby through the use of the `public`, `private`, and `protected` access modifiers. 

- `public` methods are available to anyone who knows either the class name or the object's name . These methods are readily available for the rest of the program to use and *comprise the class's interface (how other classes and objects will interact with this class and its objects)*
- `private` methods are at work in the class but are not available to the rest of the program. `private` methods are only accessible from other `public` methods within the class and are not accessible outside the class definition at all 
  - *Note: Before Ruby 2.7, private methods are only accessible from inside the class when called without `self`. Since 2.7, private methods can be called with `self` as the caller, private methods cannot be called with any other object -- not even one of the same type. You can only call a private method with the current object.*
- protected methods 
  - inside the class, `protected` methods are accessible like `public` methods
  - outside the class, `protected` methods act like `private` methods 
  - Note: Since 2.7, the main difference is that `private` methods may noe be called with a *difference instance object* within the public method. However, `protected` methods can be called with a different object within the public method. 

**Accidental Method Overriding**

Remember that every class you create inherently subclasses from `Object`. Methods defined in the `Object` are available in all classes. Remember that through inheritance, a subclass's method can override a superclass's method. If you accidentally override a method originally defined in `Object`, it can have far-reaching effects on your code. One `Object` instance method that's easily overridden without any side effects is the `to_s` method, which you'll do often when you want a different string representation of an object. Familiarize yourself with the common `Object` methods in order to avoid accidentally overriding them. 

**Modules to Know**

- Comparable

```ruby 
def <=>(other)
  cost <=> other.cost
end 
```

Returns -1 if the left operand is less, 0 if the left operand is equal to the right, and 1 if the right is greater. 

