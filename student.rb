require_relative "person"

class Student < Person
  def initialize(age, name="unknown", parent_permission=true,classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end

p = Student.new(20, classroom: "fgh")
puts p
puts p.age
puts p.name
puts p.play_hooky