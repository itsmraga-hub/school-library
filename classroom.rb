class classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = [] # classroom has-many students
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
