require_relative '../lib/transaction_log'
require_relative '../lib/transaction'

describe TransactionLog do

  let(:transaction) { instance_double('Transaction') }
  subject(:transaction_log) { described_class.new }

  describe '#transactions' do
    it 'initializes as an array' do
      expect(transaction_log.transactions).to be_an(Array)
    end
    it 'initializes as empty' do
      expect(transaction_log.transactions).to be_empty
    end
  end

  describe '#log' do
    it 'adds a transaction to the transactions array' do
      expect{ transaction_log.log(transaction) }.to change{ transaction_log.transactions.length }.by 1
    end
  end

end
