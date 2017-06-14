require 'date'

class Account

  def attr_accessor
    :account_balance

    def initialize
      @account_balance = 1500
      @pin_code = 1234
      @exp_date = '12/17'
    end

    case withdraw(pin_code, amount)
      when incorrect_pin?(pin_code, account.pin_code)
          {status: false, message: 'wrong pin', date: Date.today }
      else
          withdraw_funds(amount)
    end

  private

    def withdraw_funds(amount)
      @account_balance -= amount
      {status: true, message: 'funds withdrawn', date: Date.today }
    end

    def incorrect_pin?(pin_code, actual_pin)
      pin_code != actual_pin
    end
  end
end
