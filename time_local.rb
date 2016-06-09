puts Time.local(1994,4,14)
puts Time.local(1994,4,14,22,45)
# puts Time.local(1994,4,14,22,415) #argument out of range
puts Time.gm(1994,4,14)
time = Time.local(1994,4,14)
puts time+1000000000
neha_bday= Time.local(1992,7,11)
today= Time.now

age=(today- neha_bday)/360/365/24
puts age