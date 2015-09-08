require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'hand'

class Game
    attr_accessor :player, :dealer

    def initialize(player, dealer)
        @player = player
        @dealer = dealer
    end

    def new_game()
        deck = Deck.new

        player.hand = Hand.new
        dealer.hand = Hand.new

        2.times {
            player.hand.hit(deck)
        }

        2.times {
            dealer.hand.hit(deck)
        }

        if player.hand.score == 21 ||  dealer.hand.score == 21
        else
            loop do
                skip = false

                puts "Ваши карты:"
                player.hand.show_cards
                print "Ваши очки: "
                puts player.hand.score

                break if player.hand.count == 3

                print "\n1. Пропустить ход\n2. Добавить карту\n3. Открыть карты\n"
                var = gets.chomp.to_i



                case var
                    when 1
                        puts "Ход пропущен"
                    when 2
                        player.hand.hit(deck)
                    when 3
                        puts "Открываем карты"
                    else
                        puts "Неправильный вариант... Выберите еще раз"
                        skip = true
                end

                dealer.hand.hit(deck) if dealer.hand.score <= 18 && !skip

                break if var == 3
            end
        end
            puts "Карты диллера:"
            dealer.hand .show_cards
            print "Очки диллера: "
            puts dealer.hand.score

            player_score = player.hand.score
            dealer_score = dealer.hand.score

            if player_score > 21
                loose = true
            elsif dealer_score > 21
                loose = false
            elsif player_score < dealer_score
                loose = true
            elsif player_score == dealer_score
                loose = nil
            else
                loose = false
            end

            if loose == true
                @player.decrease_balance
                @dealer.increase_balance
            elsif loose == false
                @player.increase_balance
                @dealer.decrease_balance
            end

            return loose
    end
end


