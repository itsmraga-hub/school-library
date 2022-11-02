require_relative "nameable"

class BaseDecorator < Nameable
  def initialize(obj)
    @nameable = obj
  end

  def correct_name
    @nameable.name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.name.capitalize
  end
end

# class TrimmerDecorator < BaseDecorator
#   def correct_name
#     if @nameable.correct_name.length > 10
#       return @nameable.correct_name.slice(0, 9)
#     end
#     @nameable.correct_name
#   end
# end
