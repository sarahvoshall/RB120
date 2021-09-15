module Swimmable 
	def swim
		"I'm swimming!"
	end
end 

class Animal; end

class Fish < Animal 
	include Swimmable
end 

class Mammal < Animal 
end 

class Cat < Mammal 
end 

class Dog < Mammal 
	include Swimmable
end 

sparky = Dog.new 
nemo = Fish.new 
paws = Cat.new 

puts sparky.swim 
puts nemo.swim

# Method Lookup Path 

module Swimmable
	def swim
		"I'm swimming!"
	end 
end 

module Climbable 
	def climb 
		"I'm climbing!"
	end 
end 

module Walkable 
	def walk 
		"I'm walking!"
	end
end

class Animal 
	include Walkable 

	def speak 
		"Hello!"
	end
end

class GoodDog < Animal 
	include Swimmable
	include Climbable
end 

puts GoodDog.ancestors

# More Modules 
module Mammal
	class Dog 
		def speak
			'Arf!'
		end
	end

	class Cat
		def say_name(name)
			"#{name}"
		end
	end 
end 

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new

p buddy.speak
p kitty.say_name('kitty')