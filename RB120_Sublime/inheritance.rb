class Animal
	def speak(sound)
		sound
	end
end  

class GoodDog < Animal
end

class Cat < Animal 
end 

sparky = GoodDog.new
paws = Cat.new

puts sparky.speak('woof')
puts paws.speak('meow')
