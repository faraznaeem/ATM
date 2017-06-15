class Account

  def attr_accessor
    :pin_code

    def initialize
      @pin_code = make_pin
    end

  private

  def make_pin
    rand(1000..9999) #look up the difference between two dots and three?
  end

  end
end
