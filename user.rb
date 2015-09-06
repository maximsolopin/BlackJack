class User
    attr_accessor :name, :hand
    attr_reader :balance

    def initialize
        @balance = 100
    end

    def increase_balance
        @balance += 10
    end

    def decrease_balance
        @balance -= 10
    end

    private

    attr_writer :balance
end


