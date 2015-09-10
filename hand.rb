class Hand
  attr_reader :cards

  def initialize
    @cards = []
    @score = 0
  end

  def hit(deck)
    @cards << deck.cards.shift
  end

  def score
    @score = 0
    scoring_cards
    @score
  end

  def count
    @cards.count
  end

  def show_cards
    @cards.each_with_index do |card, index|
      puts "#{index}. #{card.card}#{card.suit}"
    end
  end

  private

  def ace_value(value)
    if @score + value <= 21
      val = value
    else
      val = 1
    end
    return val
  end

  def scoring_cards
    @cards.each do |card|
      if card.card == "Туз"
        @score += ace_value(card.value)
      else
        @score += card.value
      end
    end
  end
end
