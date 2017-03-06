require_relative '../lib/transaction_log'

describe TransactionLog do

  subject(:transaction_log) { described_class.new }

  describe '#transactions' do
    it 'initializes with an empty transaction array' do
      expect(transaction_log.transactions).to be_empty
    end
  end

end
