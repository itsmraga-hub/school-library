require_relative "person"

class Teacher < Person
  def initialize(age, name="unknown", parent_permission=true,specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# t = Teacher.new(40, 'Physics')
# puts t.to_json
# puts t.name
# puts t.can_use_services?