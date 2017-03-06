class Account

  attr_reader :balance

  INITIAL_BALANCE = 0

  def initialize(transaction_log: TransactionLog)
    @balance = INITIAL_BALANCE
  end

end
