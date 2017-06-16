require 'date'

class Account
  attr_accessor :balance, :account_status, :owner
  attr_reader :exp_date, :pin_code

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
      @pin_code = make_pin
      @balance = 0
      @exp_date = set_exp_date
      @account_status = :active
      @owner = set_owner(attrs[:owner])
  end

  private

  def make_pin
    rand(1000..9999).to_s
  end

  def set_exp_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

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
