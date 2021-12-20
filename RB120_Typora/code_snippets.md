1. This code snippet returns `nil` since the instance method `set_name` is never called. Although the instance variable `@name` is instantiated due to the `attr_reader`, it doesn't contain a value until `set_name` is called. This demonstrates that unitialized instance variables do not raise an exception like how unitialized local variables would. 
2. This code snippet will return `nil` since the `enable_swimming` method wasn't called to initialize the `@can_swim` instance variable to `true` before the `swim` method call. This demonstrates that uninitialized instance variables have a `nil` value until they are initialized. In order for `@can_swim` to be inherited by the class, the module's method has to be called. 

3. The first two method calls will return the integer `4`. The final method call will return an exception since the method `describe_shape` within the `Describable` module doesn't know where to find the call to `SIDES`. This demonstrates the lexical nature of constant scope. When the method goes up to the `Describable` module, it doesn't return down to find `SIDES` within the `Quadrilateral` path. Basically, the method cannot find constants defined lower in the method lookup path, it can only search higher in the lookup path. The first call to self references the calling object. 
4. This outputs an array of all `Animal` objects contained by both the `mammals` object and the `birds` object. To return an array containing the `mammals` object and the `birds` object, we would need to change the `+()` method to `[self] << other_class`. 
5. The `change_info` method doesn't work as expected because instead of accessing the instance variables, it's actually initializing local variables. To avoid this ambiguity, the instance variable must be accessed by calling it with `self` (or `@`) prepended. 
6. We can produce our expected output but prepending `name` within the `change_name` method with `self` to let the class know that we are accessing the `@name` instance variable and not initializing a local variable. 
7. The call to output `Vehicle.wheels` will output `4`. All other calls to `self.wheels` will output `2` since the first call to output `Motorcycle.wheels` reassigned `@@wheels` to `2`. This demonstrates that using class variables while working with inheritance should be avoided since it can produce unexpected results. 
8. This outputs a `GoodDog` object with two attributes both containing the value `brown`. 
9. This code snippet raises an error since `super` goes into the superclass and finds a method `initialize` that takes no arguments, the `ArgumentError` exception is raised.
10. The method lookup path is GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel, BasicObject etc
11. This code will output the three statements `I eat.`, `I eat plankton.`, and `I eat kibble.` This demonstrates polymorphism in that the same method call can produce different outputs depending upon the object upon which it is called. 
12. This code will raise a `NoMethodError` since the snippet attempts to call the `jump` method on an `Array` object. The `kitty` and `bud` in this example are collaborator objects to the `Person` object. 
13. This snippet will output the string provided by `dog_name` with no value interpolated for `@name`. Since the `Dog` class provides its own `initialize` method without assigning `@name` to a value, `@name` exists but is `nil`. We essentially overwrote our `initialize` method which was behaving properly before the overriding method implemented in `Dog`. 
14. To return `true`, the objects must compare `name` values instead of `Person` objects. Once we've made that adjustment, although `true` is now being returned since the two objects' values are the same, they are not the same object. We could check this by viewing the object ids of each object. (Or call `equal?`)
15. First, the example outputs `Bob`. The second output is `My name is BOB` and the final output is `BOB`. Since line 14 is calling `puts` on a `String` object, it doesn't access the custom `to_s` method defined in our class, so it outputs `Bob`.  However, once `to_s` is called by the `puts` method call, `@name` is mutated by the destructive `String#upcase!` call. So when we call `name` on the `bob` object again, the mutated value of `@name` is returned. 
16. It is generally safer to invoke a setter method instead of referencing the instance variable directly when trying to set an instance variable within a class because the setter methods are more flexible. For example, if we needed to format a value. Say our user is updating their contact info and we want our program to make sure their input is correctly formatted.

```ruby
class Person
  def name=(n)
    @name = n.capitalize
  end
end
```

17. A good reason to use a custom getter method is if you were trying to format the output of an instance variable or hide sensitive information. For example, if we wanted the output to protect a social security number and only show the last four digits of the number. 

```ruby 
class Person
  def ssn
    "xxx-xxx-#{@ssn[-4..-1]}"
  end
end
```

18. It's possible for `Triangle.sides` to return `4`. However, `Triangle.new.sides` will always return `3`. This example demonstrates that class variables are scoped at the class level, so any instance of a class or its subclasses can alter the class variable. 
19. The `attr_accessor` method provides built-in getter and setter methods for any symbols representing instance variables that follow it. We shouldn't always provide `attr_accessor` methods for every instance variable in a class because we usually want to protect who can access the instance variables. Say we had a class containing driver's license info. We would want the user to be able to update an address within the info but we wouldn't want to provide an option to change their eye color. So in this case, we would provide an `attr_reader` for eye color and an `attr_accessor` for address. 
20. A state is a bit of information about an object. Maybe a name, an age, a weight. A behavior is a action that may be performed upon the states of an object. Within classes, states are mostly represented by instance variables, and behaviors are represented by instance methods.  
21. Instance methods are called upon an instance of a class, class methods are called upon the entire class. 
22. Collaborator objects are objects that work in tandem with other objects. The purpose of using them is to extend the functionality of a class. An example: 

```ruby
class Poker
  def initialize
    @deck = Deck.new
  end
end 

class Deck; end
```

23. Fake operators are useful in custom classes to obtain desired outcomes. Since fake operators are actually methods, they need to be defined within our custom classes in order to make meaningful behaviors. 

```ruby 
class Wallet
  include Comparable
  
  attr_reader :amount
  
  def initialize(amount)
    @amount = amount
  end
  
  def <=>(other)
    self.amount <=> other.amount
  end
end
```

24. The `self` in Ruby has three main purposes. When used inside a class definition and outside an instance method, `self` refers to the class itself. When used inside a class definition and inside an instance method, `self` refers to the calling object, or the instance that called it. 

```ruby
class Person
  self # represents the class itself
  
  def self.method # represents the defining of a class method
    self # represents the class itself
  end
  
  def method
    self # represents the caller, the instance of the class which called it
  end
end
```

25. Instance variables are scoped at the object level. So even an instance variable initialized outside an instance method is available to all instance methods within the class definition. 

26. Instance variables can be inherited through class inheritance or interface inheritance as long as the method is called within the superclass or mixin module to initialize that instance variable. 

```ruby
module MixIn
  def learn_behavior
    @behavior = true
  end
end

class SuperClass
  def receive_ability
    @ability = true
  end
end

class SubClass < SuperClass
  include MixIn
  
  def act
    puts "Act!" if @ability
  end

  def behave 
    puts "Behave." if @behavior
  end
end

subclass = SubClass.new
p subclass.act # ==> nil 
p subclass.behave # ==> nil

subclass.receive_ability
subclass.learn_behavior

subclass.act # ==> 'Act!'
subclass.behave # ==> 'Behave.'
```



27. Encapsulation refers to the ability to expose certain methods to the public interface, i.e., the ability of an object to interact with other objects. The public interface is what methods are available to the object outside its class definition.
28. `puts` automatically calls `to_s` on its caller which returns the class name and an encoding of its object id and `p` automatically calls `inspect` on its caller which returns the class name and encoding of its object id along with its attributes. 
29. Accidental method overriding happens when a subclass or module contains a method with the same name as a method from a base class. Since method calls follow the method lookup path, the most recent implementation of a method will be called. Another time this can happen is when defining a method within a custom class that already exists in the `Object` class. In the below example, we override the `send` method which usually takes one argument, however in our custom definition, it doesn't take an argument.

```ruby 
class Class
  def send 
    puts "Sending..."
  end
  
  def message
    "Message"
  end 
end

instance = Class.new
instance.send :message
```

27. Method Access Control is implemented in Ruby through the use of the the access modifiers: `public`, `private`, and `protected`. Methods are `public` unless otherwise specified. Methods following the `private` access modifier are not exposed outside the method and can only be called by other methods within the class. Methods following `protected` behave similarly, the difference is that `protected` methods can be called upon other objects within the class whereas `public` methods cannot. 

```ruby
class Secret
  attr_writer :secret

  def initialize(secret)
    @secret = secret
  end

  def change_secret(new_secret)
    self.secret = new_secret
  end

  private

  attr_reader :secret
end
```

```ruby
class Secret
  def initialize(secret)
    @secret = secret
  end

  def compare_secret(other)
    secret == other.secret
  end
  
  protected 

  attr_reader :secret
end
```

27. Modules expand a class's behavior but should not expand the states of a class. Classes should contain the states (instance variables) of its objects. 
28. Polymorphism is the ability in Ruby for different objects to respond differently to the same method call. We can use polymorphism through inheritance as in the first example, and duck-typing when the classes have similar behaviors but are otherwise unrelated.

```ruby
class Animal
  def speak
    puts '...'
  end
end

class Dog < Animal
  def speak
    puts "bark"
  end
end

class Cat < Animal
  def speak
    puts "meow"
  end
end 

class Turtle < Animal
end

animals = [Dog.new, Cat.new, Turtle.new]
animals.each { |animal| animal.speak }
```

```ruby
class Musician
  def prepare
    "practice scales"
  end
end

class Chef
  def prepare
    "prepare mise-en-place"
  end
end

class Artist
  def prepare
    "clean brushes"
  end
end

posse = [Musician.new, Chef.new, Artist.new]
posse.each { |person| person.prepare }
```

1. Encapsulation is the ability in Ruby to expose certain methods and protect others. 

2. This code outputs the expected strings. In this case, it makes more sense to use a module rather than define a parent class and implement class inheritance because the methods contained by the `Walkable` module are shared behaviors between two unrelated classes. We could say that the relationship between the classes and the module is a "has-a" relationship and not an "is-a" relationship. That is, both `Person` and `Animal` have the ability to `walk`. 

3. OOP is a type of programming that allows higher levels of abstraction. Programmers using OOP are able to think about programs in real-world terms. Allows for programmers to interact with blocks or cells of a mass rather than the entire. 

4. Classes are the blueprints for objects. A class determines the potential of an object. 

5. Class inheritance should be used for 'is-a' characteristics while interface inheritance should be used for 'has-a' characteristics. 

   ```ruby
   module
   
   class Animal
     def initialize(name)
       @name = name
     end
   end
   
   class Cat < Animal
     def say_name
       @name
     end
   end
   ```

    

6. This code will not return `true`. The `==`'s default behavior is to call `equal?` on its caller, that is, the default behavior of `==` is to compare object ids. This demonstrates that objects of the same class are still unique objects even when they contain no attributes. 

7. In this example, `Thing` is a superclass with the subclass `AnotherThing` which is the superclass of its subclass `SomethingElse`.  

8. The method lookup path of this code snippet is `Penguin`, `Migratory`, `Aquatic`, `Bird`, `Animal`, `Object`, `Kernel`, `BasicObject`. We can check the path by calling `ancestors` on the `Penguin` class. 

9. This code outputs `Daisy says mooooooo!` When `sound` is called in the the `Cow` class, its `super` call goes up into the `Animal` class and the return value of that call is interpolated into the the `sound` class of `Cow`. 

10. In this example, the two objects have the same behaviors but distinct states. They are instantiated with two arguments passed in to the constructor method so that the two instance variables are initialized to their respective values. Their behaviors or instance methods are identical. This demonstrates that states contain unique behavior while behaviors are shared. 

11. This example returns `nil`. To change the output to the expected result of `A`, we need to change the implementation of `change_grade` to specifically access the `@grade` instance variable instead of initializing a local variable. To do this, we should prepend `grade` with `self` so that the method knows to reassign the instance variable. 

12. In this class, the first instance of method refers to the class itself, the second instance refers to defining a class method, the third refers to the class itself, and the fourth refers to the instance of the object that calls it. 

13. This demonstrates that instance variables are not listed within the object until they are initialized. To change this, we'd need to initialize `@grade` within the constructor method. 

14. To produce our expected output, the `name` method should be called within the `speak` class of `Character` rather than accessing the `@name` instance variable directly. 

15. This example outputs an encoding of the object interpolated into a string. The first output is the expected outcome, the second will be an error and the third will be the expected. This code demonstrates how `super` works. 

16. The collaborator objects in this code snippet are `String` and `Person`. Whenever an instance variable is initialized, whatever object is initialized is a collaborator object of the method. 

17. This statement uses the `===` method to determine whether the target value is included within a range. The `===` is used almost exclusively by case statements. 

18. Within this code snippet, we have a constant, a class variable, and two instance variables. Constants have lexical scope. 







