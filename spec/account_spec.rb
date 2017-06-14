require './lib/account.rb'

describe Account do
#place numbers on tests to increase readability

  it '1 check length of a number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it '2 is expected to have an expiry date on initialize' do
      # Here we set the validity of the card to 5 yrs as default
      expected_date = Date.today.next_year(5).strftime("%m/%y")
      expect(subject.exp_date).to eq expected_date
  end
end
