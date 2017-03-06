require_relative '../lib/transaction'

describe Transaction do

  let(:amount) { 5 }

  subject(:transaction) { described_class.new(amount: amount) }

  describe '#initialize' do
    let(:transaction_class) { described_class }
    describe 'amount keyword argument' do
      let(:amount_value_error) { 'The amount argument can only accept numbers up to two decimal places.' }
      let(:amount_type_error) { 'The amount argument can only accept numbers.' }
      let(:amount_zero_error) { 'The transaction amount cannot be zero.' }
      it 'accepts an integer' do
        expect{ transaction_class.new(amount: amount) }.not_to raise_error
      end
      it 'accepts a float with 1 decimal place' do
        expect{ transaction_class.new(amount: 5.1) }.not_to raise_error
      end
      it 'accepts a float with 2 decimal places' do
        expect{ transaction_class.new(amount: 5.11) }.not_to raise_error
      end
      it 'rejects a float with 3 decimal places or more' do
        expect{ transaction_class.new(amount: 5.111) }.to raise_error(amount_value_error)
        expect{ transaction_class.new(amount: 5.22222222) }.to raise_error(amount_value_error)
      end
      it 'accepts negative values' do
        expect{ transaction_class.new(amount: -5.1) }.not_to raise_error
      end
      it 'rejects a zero value' do
        expect{ transaction_class.new(amount: 0) }.to raise_error(amount_zero_error)
      end
      it 'rejects any arguments that are not an integer or float' do
        expect{ transaction_class.new(amount: 'string') }.to raise_error(amount_type_error)
        expect{ transaction_class.new(amount: []) }.to raise_error(amount_type_error)
        expect{ transaction_class.new(amount: {}) }.to raise_error(amount_type_error)
      end
    end

  end

  describe '#amount' do
    it 'returns the amount passed at initialization' do
      expect(transaction.amount).to eq amount
    end
  end

  describe '#date' do
    it 'returns a DateTime object' do
      expect(transaction.date).to be_a(DateTime)
    end
    it 'returns the date the transaction was created' do
      test_date = DateTime.now.strftime("%d/%m/%Y")
      expect(transaction.date.strftime("%d/%m/%Y")).to eq test_date
    end
  end

end
