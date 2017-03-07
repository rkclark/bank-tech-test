require_relative '../lib/statement_printer'
require_relative '../lib/transaction'
require_relative '../lib/transaction_log'
require_relative '../lib/account'
require 'date'

describe StatementPrinter do

  let(:transaction_1) { instance_double('Transaction') }
  let(:transaction_2) { instance_double('Transaction') }
  let(:transaction_3) { instance_double('Transaction') }
  let(:transaction_log) { instance_double('TransactionLog') }
  let(:account) { instance_double('Account') }
  let(:account_class) { class_double('Account').as_stubbed_const(:transfer_nested_constants => true) }

  subject(:statement_printer) { described_class.new }

  let(:output_string) {
    "date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00"
  }

  before do
    allow(transaction_1).to receive_messages(date: DateTime.new(2012,1,10), amount: 1000.00)
    allow(transaction_2).to receive_messages(date: DateTime.new(2012,1,13), amount: 2000.00)
    allow(transaction_3).to receive_messages(date: DateTime.new(2012,1,14), amount: -500.00)
    allow(transaction_log).to receive(:transactions) { [ transaction_1, transaction_2, transaction_3 ] }
    allow(account).to receive(:transaction_log) { transaction_log }
    allow(account).to receive(:class) { account_class }

  end

  describe '#print' do
    it 'prints the statement in the correct format' do
      expect{ statement_printer.print_out(account) }.to output(output_string).to_stdout
    end
  end

end
