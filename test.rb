# encoding: utf-8
# Задача 12-4 — Объектно-ориентированный тест
# Задача 14-1 — Тест с данными в файлах
# Задача 23-5 — Тест на уровень общительности в github
# Задача 26-2 — Рефакторинг теста
# http://psylist.net/praktikum/00003.htm

require_relative "lib/test_process"
require_relative "lib/puts_result"

argument = ARGV[0]
VERSION = "Задача 26-2 — Тест рефакторинг \nЗадача 23-5 — Тест на уровень " \
  "общительности в github\nЗадача 14-1 — Тест с данными в файлах\n" \
  "Задача 8-2  — Тест на уровень общительности\n" \
  "Оценка уровня общительности (тест В.Ф. Ряховского)"

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
resume_path = current_path + "/data/resume.txt"

test_process = TestProcess.new(questions_path)
puts_result = PutsResult.new(resume_path)
test_process.version = VERSION

puts "\nЗдравствуйте #{test_process.version(argument)}!\n\nТест содержит возможность определить уровень коммуникабельности человека. " \
  "\nОтвечать на вопросы следует используя три варианта ответа:" \
  "\n\n« да »     - буква д\n« иногда » - буква и\n« нет »    - буква н"

test_process.questions.each {|one_question|
  puts "\n#{one_question}"
  user_answer = STDIN.gets.encode("UTF-8").chomp
  test_process.asks(user_answer)
}
s = test_process.score
system "cls"

puts "#{test_process.version(argument)},  в итоге вы набрали: #{s}  и результат теста:"
puts puts_result.to_print(s)
