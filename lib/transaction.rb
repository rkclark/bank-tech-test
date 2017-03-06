class Transaction

  attr_reader :amount, :date

  def initialize(amount:)
    validate_amount(amount)
    @amount = amount
    @date = DateTime.now
  end

  private

  def validate_amount(amount)
    type_message = 'The amount argument can only accept numbers.'
    raise type_message unless amount.is_a?(Float) || amount.is_a?(Integer)
    zero_message = 'The transaction amount cannot be zero.'
    raise zero_message if amount.zero?
    value_message = 'The amount argument can only accept numbers up to two decimal places.'
    raise value_message if amount.is_a?(Float) && get_decimal_places(amount) > 2
  end

  def get_decimal_places(float)
    float.to_s.split(".")[1].length.to_i
  end
end
