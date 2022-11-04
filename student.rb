require_relative 'person'

class Student < Person
  attr_reader :classroom # student belongs-to classroom

  def initialize(age, name, parent_permission, classroom)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
