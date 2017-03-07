require 'date'

class Transaction

  attr_reader :amount, :date

  def initialize(amount:)
    validate_amount(amount)
    @amount = amount.to_f
    @date = DateTime.now
  end

  private

  def validate_amount(amount)
    message = 'The amount argument can only accept numbers.'
    raise message unless amount.is_a?(Float) || amount.is_a?(Integer)
    message = 'The transaction amount cannot be zero.'
    raise message if amount.zero?
    message = 'The amount argument can only accept numbers up to two decimal places.'
    raise message if amount.is_a?(Float) && get_decimal_places(amount) > 2
  end

  def get_decimal_places(float)
    float.to_s.split(".")[1].length.to_i
  end
end
