require_relative '../lib/account'

describe Account do

  subject(:account) { described_class.new }
  let(:initial_balance) { described_class::INITIAL_BALANCE }

  describe '#initialize' do
    subject(:account_class) { described_class }
    it 'returns a new instance of Account' do
      expect(account_class.new).to be_a(account_class)
    end
    it 'does not take any arguments' do
      expect{ account_class.new('arg') }.to raise_error(ArgumentError)
    end
  end

  describe '#balance' do
    it 'initialises with a balance of zero' do
      expect(account.balance).to eq(initial_balance)
    end
  end

end
