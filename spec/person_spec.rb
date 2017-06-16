require './lib/person'
require './lib/atm'

describe Person do

subject { described_class.new(name: 'Faraz') }

  it '1 is expected to have a :name on initialize' do
      expect(subject.name).not_to be nil
  end

  it '2 is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  it '3 is expected to have a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it '4 is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

  describe '5 can create an Account' do
    before { subject.create_account }
    it '6 of Account class ' do
      expect(subject.account).to be_an_instance_of Account
    end
  end

  describe '7 can manage funds if an account been created' do
      let(:atm) { Atm.new }
      before { subject.create_account }
      it '8 can deposit funds' do
        expect(subject.deposit(100)).to be_truthy
      end
    end

  describe '9 can not manage funds if no account been created' do
     it '10 can\'t deposit funds' do
       expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
     end
   end
end
