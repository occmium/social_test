# encoding: utf-8
# Задача 12-4 — Объектно-ориентированный тест
# Задача 14-1 — Тест с данными в файлах
# Задача 23-5 — Тест на уровень общительности в github
# Задача 26-2 — Рефакторинг теста
# http://psylist.net/praktikum/00003.htm

class TestProcess

  attr_reader :questions, :score
  attr_writer :version

  def initialize(questions_path)
    unless File.exist?(questions_path)
      puts "Файл #{questions_path} не найден"
    end

    @questions = File.readlines(questions_path, encoding: "UTF-8")

    @answer_option = %w(д н и)

    @score = 0
  end

  def version(argument)
    if (Gem.win_platform?) && ARGV[0]
      argument = argument.encode("UTF-8")
    end

    if argument == nil
      argument = "Таинственная Персона"
    elsif argument == "-v"
      puts @version
      exit
    else
      argument
    end
  end



  def asks(input)
    until @answer_option.include?(input) do
      puts "\nБудьте внимательнее:\nсимвол д - если 'да'\nсимвол н - ес" \
      "ли 'нет'\nсимвол и - если 'иногда'\nА Вы ввели: #{input}"
      input = STDIN.gets.encode("UTF-8").chomp
    end

    if input == @answer_option[0]
      @score += 2
    elsif input == @answer_option[2]
      @score += 1
    end
  end
end
