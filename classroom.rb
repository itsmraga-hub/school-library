require_relative './student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = [] # classroom has-many students
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
