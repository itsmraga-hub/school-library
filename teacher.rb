require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization, parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
