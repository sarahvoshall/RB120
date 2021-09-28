class GoodDog 
	@@number_of_dogs = 0 

	DOG_YEARS = 7 

	attr_accessor :name, :age, :weight 

	def initialize(n, a, w)
		self.name = n
		self.age = a * DOG_YEARS
		self.weight = w 
		@@number_of_dogs += 1 
	end 

	def change_info(n, a, w)
		self.name = n
		self.age = a * DOG_YEARS
		self.weight = w 
	end

	def to_s
		"This dog's name is #{self.name}. It is #{self.age} years old and weighs #{self.weight} pounds."
	end

	def what_is_self
		self 
	end

	def self.total_number_of_dogs # this is a class method 
		@@number_of_dogs
	end 
end

sparky = GoodDog.new('Sparky', 3, 34)
fido = GoodDog.new('Fido', 4, 22)

puts GoodDog.total_number_of_dogs
puts sparky.what_is_self



