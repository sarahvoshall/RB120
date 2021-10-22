**Equivalence** 

Testing for equivalence in Ruby is actually very complicated... 

Note: not everything is an object. Methods, blocks, if statements, and argument lists are not objects. 

**`==`**

When using `==` to compare strings, `==` compares the values within the two objects, not the objects themselves. If we need to know if the objects are the same (and have the same value), use `equal?`. 

```ruby
str1 = 'something'
str2 = 'something'

str1 == str2 # true 
str1.equal? str2 # false 
```

In summary, `==` compares the two variables' values, while `equal?` determines whether the two variables point to the same object. 

- `==` is a method, not an operator. It is inherited by every object as a method of the `BasicObject` class, however it is redefined in each subclass so that `==` knows how to specify which values to compare. 
- The default behavior of `BasicObject#==` is to compare the classes of two objects: it does not perform and equality check 
- `==` defaults to the same definition as `equal?` so when implementing `==` in a custom class, `==` should be redefined in order to override the default `BasicObject#==` behavior and provide a more meaningful way to compare objects. The instance methods `<` and `>` can be treated in the same way since they are also not operators. 

`===` is used implicity in case statements. 

`eql?` is used implicitly by hashes to determine if two objects contain the same value and if they're of the same class. They're used most often by hashes to determine equality amount its members. 