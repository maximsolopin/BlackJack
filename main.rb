require_relative 'game'
dealer = Dealer.new

printf 'Введите ваше имя: '
player = Player.new(gets.chomp)

loop do
  if player.balance == 0 || dealer.balance == 0
    puts 'Недостаточно денег на счете'
    break
  end
  game = Game.new(player, dealer)
  result = game.new_game

  if result.nil?
    puts 'Ничья!'
  elsif !result
    puts 'Вы выйграли!'
  elsif result
    puts 'Вы проиграли!'
  end

  puts "Ваш баланс: #{player.balance}. Сыграем еще раз? (y/n)"

  var = gets.chomp
  break if var == 'n'
end
