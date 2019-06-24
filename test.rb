# encoding: utf-8
# Задача 12-4 — Объектно-ориентированный тест
# Задача 14-1 — Тест с данными в файлах
# Задача 23-5 — Тест на Тест на уровень общительности в github
# http://psylist.net/praktikum/00003.htm

require_relative "lib/test_process"
require_relative "lib/puts_result"

argument = ARGV[0]
version = "Задача 14-1 — Тест с данными в файлах\nЗадача 8-2 — Тест на уровень общительности\n" \
"Оценка уровня общительности (тест В.Ф. Ряховского)"

if (Gem.win_platform?) && ARGV[0]
  argument = argument.encode("UTF-8")
end

if argument == nil
  argument = "Таинственная Персона"
elsif argument == "-v"
  puts version
  exit
end

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
resume_path = current_path + "/data/resume.txt"

on_test = TestProcess.new(questions_path)
on_exit = PutsResult.new(resume_path)

puts "\nЗдравствуйте #{argument}!\n\nТест содержит возможность определить уровень коммуникабельности человека. " \
  "\nОтвечать на вопросы следует используя три варианта ответа:" \
  "\n\n« да »     - буква д\n« иногда » - буква и\n« нет »    - буква н"

on_test.questions.each { |a|
  puts "\n#{a}"
  user_answer = STDIN.gets.encode("UTF-8").chomp
  on_test.asks(user_answer)
  until on_test.answer_option.include?(user_answer) do
    puts "\nБудьте внимательнее:\nсимвол д - если 'да'\nсимвол н - ес" \
      "ли 'нет'\nсимвол и - если 'иногда'\nА Вы ввели: #{user_answer}"
    user_answer = STDIN.gets.encode("UTF-8").chomp
  end
}

system "cls"

puts "#{argument}, вы набрали: #{on_test.score} баллов и результат теста:"
puts on_exit.resume[on_exit.to_print(on_test.score)]
sleep 7