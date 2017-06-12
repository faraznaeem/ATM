require './lib/atm.rb'
describe Atm do
  let(:account) {instance_double('Account') }

  it 'allow withdraw if account has enough balance.' do
  # We need to tell the spec what to look for as the responce
  # and store that in a variable called `expected_outcome`.
  # Please note that we are omitting the `bills` part at the moment,
  # We will modify this test and add that later.

  expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }

  # We need to pass in two arguments to the `withdraw` method.
  # The amount of money we want to withdraw AND the `account` object.
  # The reason we pass in the `account` object is that the Atm needs
  # to be able to access information about the `accounts` balance
  # in order to be able to clear the transaction.
  expect(subject.withdraw(45, account)).to eq expected_output
end

  before do
    allow(:account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'has $1000 on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw 50
    expect(subject).to eq 950
  end
end
