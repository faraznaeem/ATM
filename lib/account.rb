require 'date'
class Account
  attr_accessor :balance #fucking shit why dont you work
  attr_accessor :pin_code
  attr_accessor :exp_date

  STANDARD_VALIDITY_YRS = 5

  def initialize
      @pin_code = make_pin
      @balance = 0
      @exp_date = set_exp_date
  end

  private

  def make_pin
    rand(1000..9999) #look up the difference between two dots and three?
  end

  def set_exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end


end
