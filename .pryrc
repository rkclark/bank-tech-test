require_relative 'lib/account'
require_relative 'lib/transaction_log'
require_relative 'lib/transaction'
require_relative 'lib/statement_printer'

transaction_log_class = TransactionLog
account = Account.new(transaction_log_class: transaction_log_class)
sp = StatementPrinter.new
