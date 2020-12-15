# frozen_string_literal: true

# nu nulinamos reiksmes tam kad galetu sklandziai veikti programa
# n - ciklo iteracija
# sk - skaicius kuris bus atspausdinamas
# l ir s - skaiciai su kuriais bus atliekami skaiciavimai ir palyginimai
n = 1
sk = 0
s = 0
# sukamas ciklas 40 kartu
while n <= 40
  skait = 0
  d = 0
  sk += 1
  s = sk
  while s != 0
    # skaicius kuris yra tikrinamas yra isskaidomas skaitmenimis ir
    # tikrinama ar skaitmuo gali dalintis is kiekvieno savo skaitmens
    # ir sis ciklas taip pat skaiciu padalina skaitmenimis
    l = s % 10
    skait += 1
    s /= 10
    # tikrinama l liekana, jei liekana yra 0 tesiama programa, jei ne tada ciklas kartojamas kaskart
    # padidinant skait reiksme
    next if l.zero?

    # tikrinama ar skaicius dalijasi is skaitmens be liekanos, jei taip tai d yra padidinamas
    d += 1 if (sk % l).zero?
  end
  # Jei skaitmenu ir gerai pasidalinusiu skaiciu skaicius (d) yra lygus atspausdina skaiciu kuris atitinka
  # nurodytas salygas ir kaskart atspausdinus toki skaiciu n yra pridedamas
  # tam kad ciklas galetu testis ir galiausiai baigtis
  if skait == d
    puts sk
    n += 1
  end

end
