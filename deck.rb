require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = init
  end

  private

  def init
    @cards = []
    array = *(1..10)
    array = array | Array(["Валет", "Дама", "Король", "Туз"])

    ["♥", "♦", "♣", "♠"].each do |suit|
        array.each do |card|
            cards << Card.new(suit, card)
        end
    end

    @cards.shuffle
  end
end
