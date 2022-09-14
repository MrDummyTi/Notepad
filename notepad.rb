require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

puts "Блокнот"
puts "Что бы вы хотели записать в блокнот?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size # пока юзер не выбрал правильно
  # выводим заново массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console
# Сохраняем пост в файл
entry.save
puts "Ваша запись сохранена!"