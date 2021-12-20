# Design a Sports Team (Author Unknown...thank you!)

# - Include 4 players (attacker, midfielder, defender, goalkeeper)
# - All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
# - All players can run and shoot the ball.
# - Attacker should be able to lob the ball
# - Midfielder should be able to pass the ball
# - Defender should be able to block the ball
# - The referee has a whistle. He wears black and is able to run and whistle.

module Run
  def run; end
end

class Player
  include Run

  def initialize
    @jersey = 'blue'
  end

  def shoot; end
end

class Attacker < Player
  def lob; end
end

class MidFielder < Player
  def pass; end
end

class Defender < Player
  def block; end
end

class GoalKeeper < Player
  def initialize
    @jersey = 'white with blue stripes'
  end
end 

class Referee
  include Run

  def initialize
    @jersey = 'black'
    @whistle = true
  end
end

# ### Preschool (by Natalie Thompson)

# Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. 
# Both teachers and assistants can help a student with schoolwork and watch them on the playground. 
# A teacher teaches 
# and an assistant helps kids with any bathroom emergencies. 
# Kids themselves can learn and play. 
# A teacher and principle can supervise a class. 
# Only the principle has the ability to expel a kid. 
# Janitors have the ability to clean. 
# Cafeteria workers have the ability to serve food. 
# Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

module Lunchable
  def eat_lunch; end
end

module Supervisable
  def supervise_class; end
end

class Child
  include Lunchable

  def learn; end

  def play; end
end

class ClassroomFaculty
  include Lunchable

  def help_with_schoolwork; end

  def watch_on_playground; end
end

class Teacher < ClassroomFaculty
  include Supervisable

  def teach; end
end

class Assistant < ClassroomFaculty
  def assist_with_bathroom; end
end

class Principal
  include Lunchable
  include Supervisable

  def expel; end
end

class Janitor
  include Lunchable

  def clean; end
end

class LunchLady
  include Lunchable

  def serve_lunch; end
end


# ### Dental Office Alumni (by Rona Hsu)

# There's a dental office called Dental People Inc.  
# Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
# Both general dentists and oral surgeons can pull teeth. 
# Orthodontists cannot pull teeth.  
# Orthodontists straighten teeth.
# All of these aforementioned specialties are dentists. 
# All dentists graduated from dental school. 
# Oral surgeons place implants.
# General dentists fill teeth

module Pullable
  def pull_teeth; end
end

class Dentist
  def initialize
    @graduate = true
  end
end

class Orthodontist < Dentist
  def straighten_teeth; end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implant; end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth; end
end

