class TransactionLog
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log(transaction)
    self.transactions << transaction
  end

  private

  attr_writer :transactions

end
