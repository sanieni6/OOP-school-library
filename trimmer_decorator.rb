require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super[0..5]
  end
end
