require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = init
  end

  def init
    @cards = []
    ["♥", "♦", "♣", "♠"].each do |suit|
        (2..10).each do |card|
            cards << Card.new(suit, card)
        end
        ["Валет", "Дама", "Король", "Туз"].each do |card|
            cards << Card.new(suit, card)
        end
    end
    @cards.shuffle
  end
end
