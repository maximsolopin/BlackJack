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
    scoring_cards
  end

  def count
    @cards.count
  end

  def show_cards
    @cards.each_with_index do |card, index|
      puts "#{index + 1}. #{card.card}#{card.suit}"
    end
  end

  private

  def ace_value(score_local, value_local)
    if score_local + value_local <= 21
      val = value_local
    else
      val = 1
    end
    val
  end

  def scoring_cards
    score = 0

    @cards.each do |card|
      if card.card == 'Туз'
        score += ace_value(score, card.value)
      else
        score += card.value
      end
    end
    score
  end
end
