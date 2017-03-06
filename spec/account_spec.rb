require_relative '../lib/account'
require_relative '../lib/transaction_log'

describe Account do

  let(:transaction_log_class) { class_double('TransactionLog') }
  subject(:account) { described_class.new }
  let(:initial_balance) { described_class::INITIAL_BALANCE }


  describe '#initialize' do
    subject(:account_class) { described_class }
    it 'can accept a transaction_log_class keyword argument' do
      expect{ account_class.new(transaction_log_class: transaction_log_class) }.not_to raise_error
    end
    it 'can initialize without the transaction_log_class keyword argument' do
      expect{ account_class.new }.not_to raise_error
    end
  end

  describe '#balance' do
    it 'initialises with a balance of zero' do
      expect(account.balance).to eq(initial_balance)
    end
  end

end
