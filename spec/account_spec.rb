require_relative '../lib/account'
require_relative '../lib/transaction_log'
require_relative '../lib/transaction'

describe Account do

  let(:transaction_log_class) { class_double('TransactionLog') }
  let(:transaction_log) { instance_double('TransactionLog') }

  let(:transaction) { instance_double('Transaction') }

  let(:initial_balance) { described_class::INITIAL_BALANCE }
  let(:min_balance) { described_class::MIN_BALANCE }


  describe '#initialize' do
    before do
      allow(transaction_log_class).to receive(:new) { transaction_log }
    end
    subject(:account_class) { described_class }
    it 'accepts a transaction_log_class keyword argument' do
      expect{ account_class.new(transaction_log_class: transaction_log_class) }.not_to raise_error
    end
  end

  context 'initialized' do

    before do
      allow(transaction_log_class).to receive(:new) { transaction_log }
    end
    subject(:account) { described_class.new(transaction_log_class: transaction_log_class) }

    describe '#balance' do
      it 'initialises with a balance of zero' do
        expect(account.balance).to eq(initial_balance)
      end
    end

    describe '#add_transaction' do
      let(:transaction_value_error) { "Withdrawal rejected: would exceed your account's minimum balance." }
      before do
        allow(transaction_log).to receive(:log).with(transaction)
      end
      it 'raises error if withdrawal exceeds minimum balance' do
        allow(transaction).to receive(:amount) { (min_balance - 1) }
        expect{ account.add_transaction(transaction) }.to raise_error(transaction_value_error)
      end
      it 'calls log on the transaction log' do
        allow(transaction).to receive(:amount) { 5 }
        expect(transaction_log).to receive(:log).with(transaction)
        account.add_transaction(transaction)
      end
      context 'Deposit transaction (positive amount)' do
        it 'increases balance by transaction amount' do
          allow(transaction).to receive(:amount) { 5 }
          expect{ account.add_transaction(transaction) }.to change{ account.balance }.by 5
        end
      end
      context 'Withdrawal transaction (negative amount)' do
        it 'increases balance by transaction amount' do
          allow(transaction).to receive(:amount) { 5 }
          account.add_transaction(transaction)
          allow(transaction).to receive(:amount) { -4 }
          expect{ account.add_transaction(transaction) }.to change{ account.balance }.by -4
        end
      end
    end
  end



end
