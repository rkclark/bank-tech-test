class StatementPrinter

  def print_out(account)
    transactions = prepare_data(account)
    output_string = header_string + stringify_transactions(transactions)
    print output_string
  end

  private

  Transaction = Struct.new(:date, :credit, :debit, :balance)

  def prepare_data(account)
    total_balance = account.class::INITIAL_BALANCE
    account.transaction_log.transactions.map do |t|
      date = t.date.strftime("%d/%m/%Y")
      credit = t.amount > 0 ?  "#{sprintf "%.2f", t.amount}" : ""
      debit = t.amount < 0 ?  "#{sprintf "%.2f", t.amount.abs}" : ""
      balance = "#{sprintf "%.2f", total_balance += t.amount}"
      Transaction.new(date, credit, debit, balance)
    end.reverse
  end

  def header_string
    "date       || credit || debit   || balance\n"
  end

  def stringify_transactions(transactions)
    transactions_string = ''
    transactions.each do |t|
      transactions_string += "#{t.date.ljust(11)}||#{t.credit.rjust(8)}|| #{t.debit.ljust(8)}||#{t.balance.rjust(8)}\n"
    end
    transactions_string.chomp
  end
end
