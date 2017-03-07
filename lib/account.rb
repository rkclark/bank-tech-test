class Account

  attr_reader :balance

  INITIAL_BALANCE = 0
  MIN_BALANCE = 0

  def initialize(transaction_log_class: TransactionLog)
    message = 'The transaction_log_class argument can only accept a Class object'
    raise message unless transaction_log_class.is_a?(Class)
    @balance = INITIAL_BALANCE
  end

  def add_transaction(transaction)
    message = "Withdrawl rejected: would exceed your account's minimum balance."
    raise message if balance + transaction.amount < MIN_BALANCE
    @balance += transaction.amount
  end

end
