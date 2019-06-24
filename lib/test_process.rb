# encoding: utf-8
# Задача 12-4 — Объектно-ориентированный тест
# Задача 14-1 — Тест с данными в файлах
# Задача 23-5 — Тест на Тест на уровень общительности в github
# http://psylist.net/praktikum/00003.htm

class TestProcess
  def initialize(questions_path)
    unless File.exist?(questions_path)
      puts "Файл #{questions_path} не найден"
    end

    f = File.new(questions_path,"r:UTF-8")
    @questions = f.readlines
    f.close

    @answer_option = %w(д н и)

    @score = 0
  end

  def asks(input)
    if input == @answer_option[0]
      @score += 2
    elsif input == @answer_option[2]
      @score += 1
    end
  end

  def score
    @score
  end

  def questions
    @questions
  end

  def answer_option
    @answer_option
  end
end
