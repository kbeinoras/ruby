# frozen_string_literal: true

# a-skaicius kuris bus nuolat dauginamas
a = 1
# for ciklas nurodantis jog ciklas suksis nuo skaiciaus 10 iki 20
(10..20).each do |i|
  # tikrinama ar skaicius i padalinus is 2 turi liekana
  if i.even?
    # jei skaicius neturi liekanos jis yra sudauginamas su a
    a = i * a
  end
end
puts a
