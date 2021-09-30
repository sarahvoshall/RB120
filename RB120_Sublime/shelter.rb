class Owner
  attr_reader :name 
  attr_accessor :pets, :number_of_pets

  def initialize(name)
    @name = name 
    @pets = []
    @number_of_pets = 0 
  end 
end 

class Pet 
  attr_reader :name, :animal 

  def initialize(animal, name)
    @animal = animal
    @name = name 
  end 
end 

class Shelter
  @@adopters = [] 

  def adopt(owner, pet)
    owner.pets << pet
    owner.number_of_pets += 1 
    @@adopters << owner unless @@adopters.include?(owner)
  end 

  def print_adoptions
    @@adopters.each do |adopter| 
      puts "#{adopter.name} has adopted the following pets:"
      adopter.pets.each do |pet|
        puts "a #{pet.animal} named #{pet.name}"
      end
    end
  end 
end 



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.