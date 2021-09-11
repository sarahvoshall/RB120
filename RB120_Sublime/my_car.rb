class MyCar
	attr_accessor :color, :model  
	attr_reader :year

	def initialize(y, c, m)
		@year = y
		@color = c
		@model = m
		@current_speed = 0 
	end

	def info
		"My car is a #{color} #{year} #{model}."
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
end 


honda = MyCar.new('2006', 'blue', 'Honda')
puts honda.speed_up(20)
puts honda.current_speed
puts honda.brake(7)
puts honda.current_speed
puts honda.shut_down

puts honda.year
honda.color = 'red'
puts honda.info

honda.spray_paint('yellow')
puts honda.info
