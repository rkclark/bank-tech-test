require_relative '../lib/account'
require_relative '../lib/transaction_log'

describe Account do

  let(:transaction_log_class) { TransactionLog }
  subject(:account) { described_class.new }
  let(:initial_balance) { described_class::INITIAL_BALANCE }


  describe '#initialize' do
    subject(:account_class) { described_class }
    describe 'transaction_log_class keyword argument' do
      it 'accepts a transaction_log_class keyword argument' do
        expect{ account_class.new(transaction_log_class: transaction_log_class) }.not_to raise_error
      end
      it 'can initialize without the transaction_log_class keyword argument' do
        expect{ account_class.new }.not_to raise_error
      end
      it 'raises error if the argument receives an object that is not a class' do
        type_error = 'The transaction_log_class argument can only accept a Class object'
        expect{ account_class.new(transaction_log_class: '') }.to raise_error(type_error)
      end
    end

  end

  describe '#balance' do
    it 'initialises with a balance of zero' do
      expect(account.balance).to eq(initial_balance)
    end
  end

end
