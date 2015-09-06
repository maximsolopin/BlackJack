class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
    @score = 0
  end

  def hit(deck)
    @cards << deck.cards.shift
  end

  def get_score
    score
    @score
  end

  def score
    @score = 0
    @cards.each do |card|
        if card.card == "Туз"
          if @score + card.value <= 21
            @score += card.value
          else
            @score += 1
          end
        else
          @score += card.value
        end
    end
  end

  def count
    @cards.count
  end

  def show_cards
    @cards.each_with_index do |card, index|
      puts "#{index}. #{card.card}#{card.suit}"
    end
  end
end
