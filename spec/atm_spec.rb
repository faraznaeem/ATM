require './lib/atm.rb'

describe Atm do

  let(:account) {instance_double('Account')} #the happy path section

  before do
    allow(account).to receive(:balance).and_return(100)
  end

  it '1 allow subject withdraw if account has enough balance' do
    expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
    expect(subject.withdraw(45, account)).to eq expected_output
  end

  it '2 has $1000 on initialize' do
    expect(subject.funds).to eq 1000
  end

  it '3 funds are reduced at withdraw' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end
end
