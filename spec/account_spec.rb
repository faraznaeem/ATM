require './lib/account.rb'

describe Account do
#placed numbers on tests to increase readability

  it '1 check length of a number' do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it '2 check the account balance on initialize' do
    expect(subject.balance).to eq 0
  end

  it '3 is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
end

it '4 is expected to have :active status on initialize' do
  expect(subject.account_status).to eq :active
end

end
