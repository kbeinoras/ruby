#a-skaicius kuris bus nuolat dauginamas
a=1
#for ciklas nurodantis jog ciklas suksis nuo skaiciaus 10 iki 20
for i in 10..20 
    #tikrinama ar skaicius i padalinus is 2 turi liekana
    if (i%2==0)
        #jei skaicius neturi liekanos jis yra sudauginamas su a
        a=i*a;
     end
end
puts a
