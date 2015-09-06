class Card

  attr_reader :card, :suit, :value

  def initialize(suit, card)
    @suit = suit
    @card = card
    @value = get_value
  end

  def print
    "#{@card}#{@suit} - #{@value}"
  end

  private

  def get_value
    return 10 if ["Валет", "Дама", "Король"].include?(@card)
    return 11 if @card == "Туз"
    return @card
  end
end
