# encoding: utf-8
# Задача 12-4 — Объектно-ориентированный тест
# Задача 14-1 — Тест с данными в файлах
# Задача 23-5 — Тест на уровень общительности в github
# http://psylist.net/praktikum/00003.htm

class PutsResult
  def initialize(resume_path)
    unless File.exist?(resume_path)
      puts "Файл #{resume_path} не найден"
    end

    f = File.new(resume_path,"r:UTF-8")
    @resume = f.readlines
    f.close
  end

  def to_print(score)
    if score <= 3
      @resume[6]
    elsif score <= 8
      @resume[5]
    elsif score <= 13
      @resume[4]
    elsif score <= 18
      @resume[3]
    elsif score <= 24
      @resume[2]
    elsif score <= 29
      @resume[1]
    else
      @resume[0]
    end
  end
end
