require 'date'

class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account )
    case
    when insufficient_funds_in_account?(amount, account)
    return_error_message('insufficient funds')
    when insufficient_funds_in_atm?(amount)
    return_error_message('insufficient funds in atm')
    when incorrect_pin?(pin_code, account.pin_code)
      return_error_message('wrong pin')
    when card_expired?(account.exp_date)
    return_error_message('card expired')
    when account_disabled?(account.account_status)
    return_error_message('account is disabled')
    else
      perform_transaction(amount, account)
    end
  end

  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

def return_error_message(message)
  {status: false,
    message: message,
    date: Date.today }


end
  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def account_disabled?(status)
    status != :active
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []

    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end

    bills
  end
end
