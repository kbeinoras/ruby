# frozen_string_literal: true
require 'test/unit'
# for ciklas nurodantis jog ciklas suksis nuo skaiciaus 10 iki 20
# irasyti nuo kokio skaiciaus iki kokio skaiciaus testuoti
def multiplication(start, finnish, number_to_start)
  (start..finnish).each do |i|
    # tikrinama ar skaicius i padalinus is 2 turi liekana
    if i.even?
      # jei skaicius neturi liekanos jis yra sudauginamas su a
      number_to_start *= i
    end
  end
  puts number_to_start
  return number_to_start
end

start = 10
finnish = 20
number_to_start = 1

multiplication(start, finnish, number_to_start)

class MyTest < Test::Unit::TestCase
  def test_multiplication
    assert_equal(9_676_800, multiplication(10, 20, 1))
  end
end