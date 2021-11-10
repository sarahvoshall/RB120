**Equivalence** 

Testing for equivalence in Ruby is actually very complicated... 

*Note: not everything is an object. Methods, blocks, conditional statements, and argument lists are not objects.* 

**`==`**

When using `==` to compare strings, `==` compares the values within the two objects, not the objects themselves. If we need to know if the objects are the same (and have the same value), use `equal?`. 

- A string is equal to another string of the same value 
- An integer is equal to another integer of the same value
- A symbol is equal to another symbol of the same value

```ruby
str1 = 'something'
str2 = 'something'
str1 == str2						# => true

int1 = 1
int2 = 2
int1 == int2						# => true

sym1 = :something
sym2 = :something
sym1 == sym2						# => true
```

What exactly is the `==` equality comparison method doing here? *It's not comparing the objects, it's comparing the objects' values.* We can use `equal?` to determine whether two objects are the same.

```ruby
str1 = 'something'
str2 = 'something'

str1 == str2 # true 
str1.equal? str2 # false 
```

In summary, `==` compares the two variables' values, while `equal?` determines whether the two variables point to the same object. 

- `==` **is a method, not an operator**. It is inherited by every object as a method of the `BasicObject` class, however it is redefined in each subclass so that `==` knows how to specify which values to compare. 
- `==` defaults to the same definition as `equal?` so when implementing `==` in a custom class, `==` should be redefined in order to override the default `BasicObject#==` behavior and provide a more meaningful way to compare objects. The instance methods `<` and `>` can be treated in the same way since they are also not operators. 
- (Definining `==` gives you `!=` for free.)

**Object IDs**: Symbols and integers behave slightly differently in Ruby than other objects: if two symbols or two integers have the same value, they are also the same object. This is a performance optimization since you can't modify a symbol or an integer. 

```ruby
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id			# => false 

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id			# => true

int1 = 5
int2 = 5
int1.object_id == int2.object_id			# => true
```

`===` is used implicity in case statements. This method asks 'if `(x...y)` is a group, is `n` a member of that group?' 

```ruby
num = 25

case num
when 1..50
  puts 'small number'
when 51..100
  puts 'large number'
else
  puts 'not in range'
end

# Behind the scenes, the case statement is using the === method to compare each when clause with num. 

if (1..50) === num
  puts 'small number'
elsif (51..100) === num
  puts 'large number'
else
  puts 'not in range'
end
```

Another example... 

```ruby
String === 'hello'		# => true
String === 15					# => false
```

`eql?` is used implicitly by hashes to determine both if two objects contain the same value and if they're instances of the same class. They're used most often by hashes to determine equality among its members. 

**Summary**

`==` 

- for most objects, `==` compares the values of the objects and is frequently used
- `==` is actually a method: most built-in Ruby classes provide their own `==` method to specify how that class compares objects
- `BasicObject#==` defaults to checking whether two objects are the same object, it does not perform an equality check (this is why other classes provide their own behavior for `==`)
- **define `==` in order to compare custom objects** 

`equal?` 

- determines whether two variables both have the same value and point to the same object
- **do not define `equal?`** 
- less used method than `==` 
- **comparing two objects' `object_id` has the same affect as comparing them with `equal?`** 