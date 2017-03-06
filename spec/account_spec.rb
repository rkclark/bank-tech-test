require_relative '../lib/account'

describe Account do

  describe '#initialize' do
    subject(:account_class) { described_class }
    it 'returns a new instance of Account' do
      expect(account_class.new).to be_a(account_class)
    end
    it 'does not take any arguments' do
      expect{ account_class.new('arg') }.to raise_error(ArgumentError)
    end
  end

end
