class MyCar
	@@total_mileage = 0

	attr_accessor :color 
	attr_reader :year, :model

	def self.calculate_mileage(gallons, miles)
		puts "My car gets #{miles / gallons} miles to the gallon."
	end

	def self.display_mileage
		@@total_mileage
	end

	def initialize(y, c, m)
		@year = y
		@color = c
		@model = m
		@current_speed = 0 
	end

	def info
		"My car is a #{color} #{year} #{model}."
	end

	def travel_distance(num)
		@@total_mileage += num 
	end

	def speed_up(num)
		@current_speed += num 
		"You accelerated #{num} mph."
	end 

	def brake(num)
		@current_speed -= num 
		"You decelerated #{num} mph."
	end 

	def current_speed
		"You are going #{@current_speed} mph."
	end 

	def shut_down
		@current_speed = 0
		"The car is off."
	end 

	def spray_paint(new_color)
		self.color = new_color 
	end 

	def to_s
		"My car is a #{self.color} #{self.year} #{self.model} with #{@@total_mileage} miles on it."
	end
end 


honda = MyCar.new('2006', 'blue', 'Honda')
p MyCar.display_mileage


