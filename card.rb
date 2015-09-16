class Card
  attr_reader :card, :suit, :value

  def initialize(suit, card)
    @suit = suit
    @card = card
    @value = card_value
  end

  def print
    puts "#{@card}#{@suit} - #{@value}"
  end

  private

  def card_value
    return 10 if %w(Валет Дама Король).include?(@card)
    return 11 if @card == 'Туз'
    @card
  end
end
