require 'date'

class Account
  attr_accessor :balance #fucking shit why dont you work
  attr_accessor :pin_code
  attr_accessor :exp_date
  attr_accessor :account_status
  attr_accessor :owner

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
      @pin_code = make_pin
      @balance = 0
      @exp_date = set_exp_date
      @account_status = :active
      @owner = set_owner(attrs[:owner])
  end

  #def deactivate
  #  @account_status = :deactivated
  #end

  private

  def make_pin
    rand(1000..9999) #look up the difference between two dots and three?
  end

  def set_exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

# Chose to use class method beacuse it can be used inside private
  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def set_owner(obj)
    obj.nil? ?  missing_owner : obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
