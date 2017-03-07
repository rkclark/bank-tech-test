class Account

  attr_reader :balance, :transaction_log 

  INITIAL_BALANCE = 0
  MIN_BALANCE = 0

  def initialize(transaction_log_class:)
    @balance = INITIAL_BALANCE
    @transaction_log = transaction_log_class.new
  end

  def add_transaction(transaction)
    message = "Withdrawal rejected: would exceed your account's minimum balance."
    raise message if balance + transaction.amount < MIN_BALANCE
    update_balance(transaction.amount)
    log_transaction(transaction)
  end

  private


  attr_writer :balance

  def update_balance(amount)
    self.balance += amount
  end

  def log_transaction(transaction)
    transaction_log.log(transaction)
  end

end
