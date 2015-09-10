require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = init
  end

  private

  def init
    @cards = []
    array = (2..10).to_a | ["Валет", "Дама", "Король", "Туз"]

    ["♥", "♦", "♣", "♠"].each do |suit|
        array.each do |card|
            cards << Card.new(suit, card)
        end
    end

    @cards.shuffle
  end
end
