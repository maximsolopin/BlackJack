require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'hand'

class Game
  def initialize(player, dealer, deck = Deck.new)
    @player = player
    @dealer = dealer
    @deck = deck
  end

  def new_game
    init_game

    if player.hand.score == 21 || dealer.hand.score == 21
      print_player_hand
    else
      loop_game
    end

    print_dealer_hand
    loose = loosing?
    calc_balance(loose)

    loose
  end

  private

  attr_reader :player, :dealer, :deck

  def hand_score
    [player.hand.score, dealer.hand.score]
  end

  def loosing?
    player_score, dealer_score = hand_score
    if player_score > 21
      loose = true
    elsif dealer_score > 21
      loose = false
    elsif player_score < dealer_score
      loose = true
    elsif player_score == dealer_score
      loose = nil
    end
    loose || false
  end

  def calc_balance(loose)
    if loose == true
      @player.decrease_balance
      @dealer.increase_balance
    elsif loose == false
      @player.increase_balance
      @dealer.decrease_balance
    end
  end

  def print_player_hand
    puts 'Ваши карты:'
    player.hand.show_cards
    print 'Ваши очки: '
    puts player.hand.score
  end

  def print_dealer_hand
    puts 'Карты диллера:'
    dealer.hand.show_cards
    print 'Очки диллера: '
    puts dealer.hand.score
  end

  def init_game
    player.hand = Hand.new
    dealer.hand = Hand.new

    2.times do
      player.hand.hit(deck)
    end

    2.times do
      dealer.hand.hit(deck)
    end
  end

  def loop_game
    loop do
      skip = false

      print_player_hand

      break if player.hand.count == 3

      print "\n1. Пропустить ход\n2. Добавить карту\n3. Открыть карты\n"
      var = gets.chomp.to_i

      perform_action(var)

      dealer.hand.hit(deck) if dealer.hand.score <= 18 && !skip

      break if var == 3
    end
  end

  def perform_action(var)
    case var
    when 1
      puts 'Ход пропущен'
    when 2
      player.hand.hit(deck)
    when 3
      puts 'Открываем карты'
    else
      puts 'Неправильный вариант... Выберите еще раз'
      skip = true
    end
  end
end
