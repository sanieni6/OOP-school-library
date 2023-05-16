require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize[0..9]
  end
end
