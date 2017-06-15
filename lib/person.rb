require './lib/person'
require './lib/atm'

class Person
  attr_accessor :name
  attr_accessor :cash
  #attr_accessor :account

    def initialize(attrs = {})
      @name = set_name(attrs[:name])
      @cash = 0
    end

  private

    def set_name(name)
     name.nil? ? missing_name : name
    end

    def missing_name
    raise ArgumentError, 'A name is required' #dont understand 'raise'
    end


end
