require_relative 'nameable'

class BaseDecorator < Nameable
  # rubocop:disable Lint/MissingSuper
  def initialize(obj)
    @nameable = obj
  end
  # rubocop:enable Lint/MissingSuper

  def correct_name
    @nameable.name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name.slice(0, 9) if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
